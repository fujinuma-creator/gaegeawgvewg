import SwiftUI

/// フル版の案内・無料体験の開始・購入・復元。
struct PaywallView: View {
    @EnvironmentObject var purchases: PurchaseManager
    @Environment(\.dismiss) private var dismiss

    private let features: [(String, String)] = [
        ("book", "全単語の詳細（例文・英語の定義・関連表現）"),
        ("calendar", "復習リスト・フラッシュカード・カレンダー"),
        ("pencil.and.list.clipboard", "文法（入門〜上級）"),
        ("bubble.left.and.bubble.right", "日常のトピック会話"),
        ("sparkles", "AIで単語を追加・例文を作成（APIキーは任意）"),
        ("square.and.arrow.up", "復習リストのCSV書き出し（購入後）"),
    ]

    var body: some View {
        ZStack {
            HatchBackground()
            ScrollView {
                VStack(spacing: 16) {
                    HStack {
                        Spacer()
                        Button { dismiss() } label: {
                            Image(systemName: "xmark").font(.system(size: 15, weight: .bold)).foregroundStyle(Palette.text)
                                .padding(10).background(Circle().fill(Palette.paper))
                                .overlay(Circle().stroke(Palette.ink, lineWidth: 1.2))
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel("閉じる")
                    }

                    VStack(spacing: 8) {
                        Text("KOTOBA英語 フル版").font(LFont.title(26)).foregroundStyle(Palette.text)
                            .marker(Palette.markerGreen, height: 11, yOffset: 4)
                        Text(purchases.statusText).font(LFont.heading(14)).foregroundStyle(statusColor)
                    }
                    .frame(maxWidth: .infinity)
                    .sketchCard(padding: 18)

                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(features, id: \.1) { f in
                            HStack(alignment: .top, spacing: 10) {
                                Image(systemName: f.0).font(.system(size: 15, weight: .semibold))
                                    .foregroundStyle(Palette.green).frame(width: 22)
                                Text(f.1).font(LFont.body(14)).foregroundStyle(Palette.text)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        SketchDivider(dashed: true).padding(.vertical, 2)
                        HStack(spacing: 10) {
                            Image(systemName: "mic").font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(Palette.stageBlue).frame(width: 22)
                            Text("発音はいつでも無料で使えます").font(LFont.body(14)).foregroundStyle(Palette.subText)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .sketchCard(padding: 16)

                    actions

                    Text("一度の購入でずっと使えます。追加料金・広告はありません。\n購入は Apple ID で管理され、アプリが個人情報を受け取ることはありません。")
                        .font(LFont.caption(11)).foregroundStyle(Palette.subText)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(16)
            }
        }
        .alert("お知らせ", isPresented: Binding(get: { purchases.message != nil }, set: { if !$0 { purchases.message = nil } })) {
            Button("OK", role: .cancel) {}
        } message: { Text(purchases.message ?? "") }
        .onChange(of: purchases.access) { _, a in
            // 体験を開始した／購入したら閉じる
            switch a {
            case .purchased, .trial: dismiss()
            default: break
            }
        }
        .task { await purchases.loadProducts() }
    }

    private var statusColor: Color {
        switch purchases.access {
        case .purchased, .trial: return Palette.green
        case .expired: return Palette.stageRed
        case .notStarted: return Palette.subText
        }
    }

    @ViewBuilder
    private var actions: some View {
        VStack(spacing: 12) {
            switch purchases.access {
            case .purchased:
                Text("ご購入ありがとうございます 🎉").font(LFont.heading(16)).foregroundStyle(Palette.green)
                Button { dismiss() } label: { Text("閉じる") }.buttonStyle(GreenButtonStyle())
            case .notStarted:
                Button { Task { await purchases.startTrial() } } label: {
                    VStack(spacing: 2) {
                        Text("30日間 無料で試す")
                        Text("期間が終わっても自動で課金されません").font(LFont.caption(10)).foregroundStyle(.white.opacity(0.85))
                    }
                }
                .buttonStyle(GreenButtonStyle())
                Button { Task { await purchases.buyFull() } } label: {
                    Text("今すぐフル版を購入（\(purchases.priceText)・買い切り）")
                }
                .buttonStyle(OutlineButtonStyle())
            case .trial, .expired:
                Button { Task { await purchases.buyFull() } } label: {
                    Text("フル版を購入（\(purchases.priceText)・買い切り）")
                }
                .buttonStyle(GreenButtonStyle())
            }
            if purchases.access != .purchased {
                Button { Task { await purchases.restore() } } label: {
                    Text("購入を復元").font(LFont.heading(13)).foregroundStyle(Palette.text).underline()
                }
                .buttonStyle(.plain)
            }
            if purchases.busy { ProgressView().padding(.top, 4) }
        }
        .disabled(purchases.busy)
    }
}

/// 「フル版で見る」ボタン付きのロック表示（詳細のモザイクの上に重ねる）。
struct LockBadge: View {
    var title: String = "フル版で見る"
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: "lock.fill").font(.system(size: 12, weight: .bold))
                Text(title).font(LFont.heading(13))
            }
            .foregroundStyle(.white)
            .padding(.vertical, 8).padding(.horizontal, 14)
            .background(ZStack {
                Rectangle().fill(Palette.ink).offset(x: 2, y: 2)
                Rectangle().fill(Palette.green)
                Rectangle().strokeBorder(Palette.ink, lineWidth: 1.2)
            })
        }
        .buttonStyle(.plain)
    }
}
