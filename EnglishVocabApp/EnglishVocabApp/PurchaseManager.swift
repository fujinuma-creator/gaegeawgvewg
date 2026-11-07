import Foundation
import StoreKit

/// 課金の状態を管理する（StoreKit 2）。
///
/// - 30日間の無料体験: 価格0円の「非消耗型」アイテム（trial30）。
///   Apple のガイドライン 3.1.1 に沿った、買い切り前のお試し期間の作り方。
///   購入日は Apple ID に記録されるので、アプリを入れ直しても体験期間はリセットされない。
/// - フル版: 2,000円の「非消耗型」アイテム（full）。一度買えばずっと使える。
///
/// 購入情報は Apple が管理し、アプリ・開発者は個人情報を受け取らない。
@MainActor
final class PurchaseManager: ObservableObject {
    static let fullID = "com.fujinuma.englishvocab.full"
    static let trialID = "com.fujinuma.englishvocab.trial30"
    static let trialDays = 30

    enum Access: Equatable {
        case notStarted            // まだ無料体験を始めていない
        case trial(daysLeft: Int)  // 無料体験中
        case expired               // 体験終了・未購入
        case purchased             // フル版購入済み
    }

    @Published private(set) var fullProduct: Product?
    @Published private(set) var trialProduct: Product?
    @Published private(set) var purchased: Bool
    @Published private(set) var trialStart: Date?
    @Published private(set) var busy = false
    @Published var message: String?

    private let d = UserDefaults.standard
    private var updatesTask: Task<Void, Never>?

    init() {
        // 前回の状態をすぐ使えるようにキャッシュから読む（その後 Apple に確認して更新）
        purchased = d.bool(forKey: "iap.purchased")
        trialStart = Self.earliest(d.object(forKey: "iap.trialStart") as? Date, Self.localTrialStart())

        // 他の端末での購入・返金・ファミリー共有などの変化を受け取る
        updatesTask = Task { [weak self] in
            for await result in Transaction.updates {
                if case .verified(let t) = result { await t.finish() }
                await self?.refresh()
            }
        }
        Task { [weak self] in
            await self?.loadProducts()
            await self?.refresh()
        }
    }

    // MARK: - 状態

    var access: Access {
        if purchased { return .purchased }
        guard let start = trialStart else { return .notStarted }
        let end = start.addingTimeInterval(Double(Self.trialDays) * 86_400)
        let left = Int(ceil(end.timeIntervalSinceNow / 86_400))
        return left > 0 ? .trial(daysLeft: left) : .expired
    }

    /// 復習リスト・文法・会話・単語の詳細などが使えるか（購入済み or 体験中）
    var hasFullAccess: Bool {
        switch access {
        case .purchased, .trial: return true
        case .notStarted, .expired: return false
        }
    }

    /// CSV 書き出しはフル版のみ（無料体験中も不可）
    var canExportCSV: Bool { purchased }

    var priceText: String { fullProduct?.displayPrice ?? "¥2,000" }

    var statusText: String {
        switch access {
        case .purchased: return "フル版（購入済み）"
        case .trial(let n): return "無料体験中・あと\(n)日"
        case .expired: return "無料体験は終了しました"
        case .notStarted: return "30日間 無料でお試しできます"
        }
    }

    // MARK: - Apple とのやりとり

    func loadProducts() async {
        do {
            let products = try await Product.products(for: [Self.fullID, Self.trialID])
            fullProduct = products.first { $0.id == Self.fullID }
            trialProduct = products.first { $0.id == Self.trialID }
        } catch {
            // 通信できないときはキャッシュの状態のまま動く
        }
    }

    /// 現在の権利（購入済み・体験開始日）を Apple の記録から読み直す。
    func refresh() async {
        var isPurchased = false
        var start: Date? = nil
        for await result in Transaction.currentEntitlements {
            guard case .verified(let t) = result, t.revocationDate == nil else { continue }
            switch t.productID {
            case Self.fullID: isPurchased = true
            case Self.trialID: start = t.originalPurchaseDate
            default: break
            }
        }
        purchased = isPurchased
        trialStart = Self.earliest(start, trialStart, Self.localTrialStart())
        d.set(purchased, forKey: "iap.purchased")
        d.set(trialStart, forKey: "iap.trialStart")
    }

    /// 無料体験を始める。App Store の 0円アイテムが使えればそれで記録し、
    /// 使えない場合（審査前・Xcode の設定なし・オフラインなど）は端末の
    /// キーチェーンに開始日を記録して始める。どちらもアプリを入れ直しても消えない。
    func startTrial() async {
        guard trialStart == nil else { return }
        if trialProduct == nil { await loadProducts() }
        if trialProduct != nil {
            await buy(Self.trialID, quiet: true)
            if trialStart != nil { return }
            if lastPurchaseCancelled { return }   // 利用者がキャンセルしたときは始めない
        }
        let now = Date()
        KeychainHelper.set(ISO8601DateFormatter().string(from: now), for: Self.localTrialKey)
        trialStart = now
        d.set(now, forKey: "iap.trialStart")
        message = nil
    }

    private static let localTrialKey = "englishvocab.trialStart"

    private static func localTrialStart() -> Date? {
        guard let s = KeychainHelper.get(localTrialKey) else { return nil }
        return ISO8601DateFormatter().date(from: s)
    }

    private static func earliest(_ dates: Date?...) -> Date? {
        dates.compactMap { $0 }.min()
    }

    private var lastPurchaseCancelled = false
    func buyFull() async { await buy(Self.fullID) }

    func restore() async {
        busy = true
        defer { busy = false }
        do {
            try await AppStore.sync()
            await refresh()
            message = purchased ? "購入を復元しました" : (trialStart != nil ? "無料体験の記録を復元しました" : "復元できる購入はありませんでした")
        } catch {
            message = "復元できませんでした。通信状態を確認してください。"
        }
    }

    private func product(for id: String) -> Product? {
        id == Self.fullID ? fullProduct : trialProduct
    }

    private func buy(_ id: String, quiet: Bool = false) async {
        lastPurchaseCancelled = false
        if product(for: id) == nil { await loadProducts() }
        guard let product = product(for: id) else {
            if !quiet { message = "商品の情報を読み込めませんでした。通信状態を確認してもう一度お試しください。" }
            return
        }
        busy = true
        defer { busy = false }
        do {
            switch try await product.purchase() {
            case .success(let verification):
                if case .verified(let t) = verification {
                    await t.finish()
                    await refresh()
                } else if !quiet {
                    message = "購入を確認できませんでした。"
                }
            case .pending:
                if !quiet { message = "購入の承認待ちです（ファミリーの承認など）。" }
            case .userCancelled:
                lastPurchaseCancelled = true
            @unknown default:
                break
            }
        } catch {
            if !quiet { message = "購入できませんでした。もう一度お試しください。" }
        }
    }
}
