import SwiftUI

/// 1. ホーム
struct HomeView: View {
    @EnvironmentObject var store: WordStore
    @EnvironmentObject var settings: AppSettings
    @EnvironmentObject var purchases: PurchaseManager
    @ObservedObject private var bgm = BGMManager.shared
    @State private var path = NavigationPath()
    @State private var showPaywall = false
    @AppStorage("paywall.firstShown") private var firstPaywallShown = false
    @State private var editingMotto = false
    @State private var mottoDraft = ""

    enum Route: Hashable {
        case allWords, reviewList, pronunciation, grammar, grammarQuiz, topics, settings
        case flashcards(FlashcardDeck)
        case conversation(String)
    }

    private var todayCount: Int { store.todayReviewWords(limit: settings.dailyLimit).count }

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                HatchBackground()
                DriftingCloud(image: "cloud_big", height: 46, y: 150, duration: 46, startFraction: 0.15)
                DriftingCloud(image: "cloud_small", height: 30, y: 420, duration: 60, startFraction: 0.6, opacity: 0.8)
                DriftingCloud(image: "cloud_big", height: 36, y: 700, duration: 52, startFraction: 0.4, opacity: 0.85)
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 18) {
                        topBar
                        heroCard
                        statsCard
                        menuSection
                        topicBar
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    .padding(.bottom, 32)
                }
            }
            .navigationDestination(for: Route.self) { route in
                destination(for: route)
            }
            .toolbar(.hidden, for: .navigationBar)
        }
        .sheet(isPresented: $showPaywall) {
            PaywallView().environmentObject(purchases)
        }
        .task {
            // 初回だけ、無料体験の案内を出す
            try? await Task.sleep(nanoseconds: 800_000_000)
            if !firstPaywallShown, purchases.access == .notStarted {
                firstPaywallShown = true
                showPaywall = true
            }
        }
    }

    /// 発音・全単語・設定以外は、購入済み or 無料体験中のみ。
    private func requiresFullAccess(_ route: Route) -> Bool {
        switch route {
        case .reviewList, .grammar, .grammarQuiz, .topics, .flashcards, .conversation: return true
        case .allWords, .pronunciation, .settings: return false
        }
    }

    private func go(_ route: Route) {
        if requiresFullAccess(route) && !purchases.hasFullAccess { showPaywall = true } else { path.append(route) }
    }

    private var locked: Bool { !purchases.hasFullAccess }

    /// 小さな鍵マーク（ロック中のタイルに表示）
    private var lockMark: some View {
        Image(systemName: "lock.fill")
            .font(.system(size: 11, weight: .bold))
            .foregroundStyle(.white)
            .padding(6)
            .background(Circle().fill(Palette.ink.opacity(0.8)))
    }

    /// 無料体験の残り日数／購入の案内（ヒーローの下）
    @ViewBuilder
    private var trialBanner: some View {
        switch purchases.access {
        case .purchased, .trial:
            // 購入済み・無料体験中は表示しない（残り日数は 設定 → 購入 で確認できる）
            EmptyView()
        case .expired, .notStarted:
            Button { showPaywall = true } label: {
                HStack(spacing: 6) {
                    Image(systemName: "lock.open").font(.system(size: 12, weight: .bold))
                    Text(purchases.access == .expired ? "無料体験は終了しました" : "30日間 無料で全機能を試す")
                        .font(LFont.heading(13))
                    Spacer()
                    Text(purchases.access == .expired ? "フル版を購入 →" : "はじめる →").font(LFont.heading(12))
                }
                .foregroundStyle(.white)
                .sketchCard(padding: 10, fill: Palette.green)
            }
            .buttonStyle(.plain)
        }
    }

    @ViewBuilder
    private func destination(for route: Route) -> some View {
        switch route {
        case .allWords:       AllWordsView(path: $path)
        case .reviewList:     ReviewListView(path: $path)
        case .pronunciation:  PronunciationView(path: $path)
        case .grammar:        GrammarView(path: $path)
        case .grammarQuiz:    GrammarQuizView(path: $path)
        case .topics:         TopicListView(path: $path)
        case .settings:       SettingsView(path: $path)
        case .flashcards(let deck): FlashcardView(deck: deck, path: $path)
        case .conversation(let id): ConversationView(conversationId: id, path: $path)
        }
    }

    // MARK: - Top bar: logo + gear

    private var topBar: some View {
        HStack {
            HStack(spacing: 8) {
                Image("logo_book").resizable().scaledToFit().frame(height: 30).floating(amplitude: 2, duration: 2.6, rotate: 3)
                Text("KOTOBA英語")
                    .font(.system(size: 30, weight: .black, design: .rounded))
                    .foregroundStyle(Palette.text)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
            }
            Spacer()
            Image("cloud_small").resizable().scaledToFit().frame(height: 34).floating(amplitude: 3, duration: 4, delay: 0.5)
            Spacer().frame(width: 14)
            Button { bgm.toggle() } label: {
                Image(systemName: bgm.isOn ? "music.note" : "speaker.slash")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(bgm.isOn ? .white : Palette.subText)
                    .frame(width: 36, height: 36)
                    .background(Circle().fill(bgm.isOn ? Palette.green : Palette.paper))
                    .overlay(Circle().stroke(Palette.ink, lineWidth: 1.4))
            }
            .buttonStyle(.plain)
            .accessibilityLabel(bgm.isOn ? "BGMを止める" : "BGMを流す")
            Spacer().frame(width: 10)
            Button { path.append(Route.settings) } label: {
                Image("gear_button").resizable().scaledToFit().frame(height: 42).floating(amplitude: 1.5, duration: 3, rotate: 6)
            }
            .buttonStyle(.plain)
        }
        .padding(.top, 6)
    }

    // MARK: - Hero


    private var heroCard: some View {
        ZStack(alignment: .topTrailing) {
            HeroLondon()
                .frame(maxWidth: .infinity)
            VStack(alignment: .trailing, spacing: 6) {
                Text(Date().longJa)
                    .font(LFont.heading(13))
                    .foregroundStyle(Palette.text)
                    .shadow(color: .white.opacity(0.9), radius: 2)
                mottoTag
            }
            .padding(.top, 14)
            .padding(.trailing, 14)
        }
        .frame(maxWidth: .infinity)
        .background(Palette.hatchPale)
        .overlay(Rectangle().strokeBorder(Palette.ink, lineWidth: 1.6))
        .clipped()
    }

    /// 右上のひとこと。タップで書き換えられる。
    private var mottoTag: some View {
        Button {
            mottoDraft = settings.motto
            editingMotto = true
        } label: {
            Text(settings.motto.isEmpty ? "ひとこと" : settings.motto)
                .font(LFont.heading(20))
                .foregroundStyle(Palette.text)
                .lineLimit(3)
                .multilineTextAlignment(.trailing)
                .lineSpacing(6)
                .frame(maxWidth: 230, alignment: .trailing)
                .shadow(color: .white.opacity(0.95), radius: 2)
                .shadow(color: .white.opacity(0.7), radius: 6)
        }
        .buttonStyle(.plain)
        .alert("ひとことを変更", isPresented: $editingMotto) {
            TextField("頑張ろう", text: $mottoDraft)
            Button("保存") { settings.motto = mottoDraft.trimmingCharacters(in: .whitespacesAndNewlines) }
            Button("キャンセル", role: .cancel) {}
        } message: { Text("ホーム右上に表示することばです。") }
    }

    // MARK: - Stats

    private var statsCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Label("継続学習日数", systemImage: "flame.fill")
                        .font(LFont.body(13))
                        .foregroundStyle(Palette.subText)
                        .labelStyle(StatLabelStyle(color: Palette.coinOrange))
                    HStack(alignment: .lastTextBaseline, spacing: 3) {
                        Text("\(store.stats.streak)").font(LFont.number(38))
                        Text("日連続").font(LFont.heading(14))
                    }
                    .foregroundStyle(Palette.text)
                }
                Spacer()
                VStack(alignment: .leading, spacing: 6) {
                    Label("本日の学習時間", systemImage: "clock")
                        .font(LFont.body(13))
                        .foregroundStyle(Palette.subText)
                        .labelStyle(StatLabelStyle(color: Palette.text))
                    let total = Int(store.liveSeconds(on: Date()))
                    let hours = total / 3600, minutes = (total % 3600) / 60
                    HStack(alignment: .lastTextBaseline, spacing: 3) {
                        if hours > 0 {
                            Text("\(hours)").font(LFont.number(38))
                            Text("時間").font(LFont.heading(14))
                        }
                        Text("\(minutes)").font(LFont.number(38)).padding(.leading, hours > 0 ? 4 : 0)
                        Text("分").font(LFont.heading(14))
                    }
                    .foregroundStyle(Palette.text)
                }
                Spacer(minLength: 0)
            }
            SketchDivider()
            weekRow
        }
        .sketchCard(padding: 16)
    }

    private var weekRow: some View {
        HStack {
            ForEach(0..<7, id: \.self) { i in
                let day = Date().startOfDay.adding(days: i - 6)
                let done = store.stats.studied(on: day)
                VStack(spacing: 6) {
                    if i == 6 {
                        if done {
                            Image("check_coin").resizable().scaledToFit().frame(width: 34, height: 34)
                        } else {
                            Image("today_circle").resizable().scaledToFit().frame(width: 34, height: 34)
                        }
                    } else if done {
                        Image("check_coin").resizable().scaledToFit().frame(width: 34, height: 34)
                    } else {
                        Circle().stroke(Palette.faint, style: StrokeStyle(lineWidth: 1.4, dash: [3, 3]))
                            .frame(width: 30, height: 30).padding(2)
                    }
                    Text(i == 6 ? "今日" : day.weekdayJa)
                        .font(LFont.caption(12))
                        .fontWeight(i == 6 ? .bold : .medium)
                        .foregroundStyle(i == 6 ? Palette.text : Palette.subText)
                }
                if i < 6 { Spacer() }
            }
        }
    }

    // MARK: - 学習メニュー

    private var menuSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 10) {
                Text("学習メニュー").font(LFont.heading(17)).foregroundStyle(Palette.text)
                Rectangle().fill(Palette.ink).frame(height: 1.4)
            }
            HStack(alignment: .top, spacing: 12) {
                menuTile(image: "menu_words", title: "全単語リスト", marker: Palette.markerGreen,
                         subtitle: "\(Self.comma(store.totalCount))語・習得 \(Self.comma(store.learnedCount))語", route: .allWords)
                reviewTile
            }
            HStack(alignment: .top, spacing: 12) {
                menuTile(image: "menu_phone", title: "発音", marker: Palette.markerBlue,
                         subtitle: "聞いて、まねして話す", route: .pronunciation, delay: 0.8)
                menuTile(image: "menu_envelope", title: "文法", marker: Palette.markerRed,
                         subtitle: "基本から順番に", route: .grammar, delay: 1.3)
            }
        }
    }

    private func menuTile(image: String, title: String, marker: Color, subtitle: String, route: Route, delay: Double = 0) -> some View {
        Button { go(route) } label: {
            VStack(alignment: .leading, spacing: 6) {
                Image(image).resizable().scaledToFit().frame(height: 74)
                    .floating(amplitude: 3, duration: 3.4, delay: delay, rotate: 1.5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                Text(title).font(LFont.heading(19)).foregroundStyle(Palette.text).marker(marker)
                Text(subtitle).font(LFont.body(12)).foregroundStyle(Palette.subText).lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity, minHeight: 176, alignment: .topLeading)
            .sketchCard(padding: 14)
            .overlay(alignment: .topTrailing) { if requiresFullAccess(route) && locked { lockMark.padding(10) } }
        }
        .buttonStyle(.plain)
    }

    private var reviewTile: some View {
        Button { go(Route.reviewList) } label: {
            VStack(alignment: .leading, spacing: 6) {
                HStack(alignment: .top) {
                    Image("menu_cup").resizable().scaledToFit().frame(height: 70).floating(amplitude: 3, duration: 3.8, delay: 0.4, rotate: 2)
                    Spacer()
                    Text("今日 \(todayCount)語")
                        .font(LFont.heading(12))
                        .foregroundStyle(Palette.text)
                        .padding(.vertical, 4).padding(.horizontal, 8)
                        .background(Palette.tagYellow)
                        .overlay(Rectangle().strokeBorder(Palette.ink, lineWidth: 1))
                }
                .padding(.bottom, 10)
                Text("復習リスト").font(LFont.heading(19)).foregroundStyle(Palette.text).marker(Palette.markerOrange)
                Text("忘れる前にもう一度").font(LFont.body(12)).foregroundStyle(Palette.subText)
            }
            .frame(maxWidth: .infinity, minHeight: 176, alignment: .topLeading)
            .sketchCard(padding: 14, emphasized: true)
            .overlay(alignment: .bottomTrailing) { if locked { lockMark.padding(10) } }
        }
        .buttonStyle(.plain)
    }

    // MARK: - トピック会話 bar

    private var topicBar: some View {
        Button { go(Route.topics) } label: {
            HStack(spacing: 12) {
                Image("menu_bubbles").resizable().scaledToFit().frame(height: 62).floating(amplitude: 2.5, duration: 3, delay: 0.6, rotate: 2)
                VStack(alignment: .leading, spacing: 8) {
                    Text("日常のトピック会話").font(LFont.heading(18)).foregroundStyle(Palette.text).marker(Palette.markerOrange)
                    HStack(spacing: 6) {
                        SketchTag(text: "カフェ"); SketchTag(text: "旅行"); SketchTag(text: "仕事")
                    }
                }
                Spacer()
                if locked { lockMark }
                Image(systemName: "chevron.right").font(.system(size: 16, weight: .bold)).foregroundStyle(Palette.text)
            }
            .sketchCard(padding: 14)
        }
        .buttonStyle(.plain)
    }
}

extension HomeView {
    /// 2480 → "2,480"
    static func comma(_ n: Int) -> String {
        let f = NumberFormatter(); f.numberStyle = .decimal; f.locale = Locale(identifier: "en_US")
        return f.string(from: NSNumber(value: n)) ?? "\(n)"
    }
}

struct StatLabelStyle: LabelStyle {
    let color: Color
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 5) {
            configuration.icon.foregroundStyle(color)
            configuration.title
        }
    }
}

/// What a flashcard session reviews: a title for the back button and the ids.
struct FlashcardDeck: Hashable {
    let title: String
    let wordIds: [String]
}

/// The London street, gently alive: the three shop signs swing on their
/// brackets, the bus rocks as if idling at the stop, a small cloud drifts
/// across the sky and the whole scene breathes very slowly. The moving parts
/// are cut from the same picture, so at rest they sit exactly on top of
/// their originals.
struct HeroLondon: View {
    @State private var swing = false
    @State private var breathe = false

    /// Pixel size of hero_london.png; overlay positions below are in it.
    private let base = CGSize(width: 605, height: 565)

    var body: some View {
        GeometryReader { geo in
            let k = geo.size.width / base.width
            ZStack(alignment: .topLeading) {
                Image("hero_london")
                    .resizable()
                    .frame(width: base.width * k, height: base.height * k)
                DriftingCloud(image: "cloud_small", height: 24 * k, y: 34 * k, duration: 52, startFraction: 0.3, opacity: 0.85)
                    .frame(width: base.width * k, height: 90 * k)
                part("sign_tea", w: 168, h: 106, k: k)
                    .rotationEffect(.degrees(swing ? 1.8 : -1.8), anchor: .top)
                    .offset(x: 16 * k, y: 222 * k)
                part("sign_books", w: 142, h: 86, k: k)
                    .rotationEffect(.degrees(swing ? -1.3 : 1.3), anchor: .top)
                    .offset(x: 188 * k, y: 242 * k)
                part("sign_bakery", w: 136, h: 94, k: k)
                    .rotationEffect(.degrees(swing ? 1.4 : -1.4), anchor: .top)
                    .offset(x: 348 * k, y: 234 * k)
                // The bus drives from the left edge to the right edge and comes
                // round again, rocking a little as it goes.
                TimelineView(.animation(minimumInterval: 1.0 / 30)) { context in
                    let busW = 250 * k
                    let t = context.date.timeIntervalSinceReferenceDate / 14
                    let f = t - floor(t)
                    let x = -busW + CGFloat(f) * (base.width * k + busW)
                    part("hero_bus", w: 250, h: 125, k: k)
                        .rotationEffect(.degrees(sin(t * 2 * .pi * 9) * 0.6), anchor: .bottom)
                        .offset(x: x, y: 440 * k + CGFloat(sin(t * 2 * .pi * 9)) * 1.2)
                }
            }
            .scaleEffect(breathe ? 1.012 : 1.0, anchor: .bottom)
            .frame(width: base.width * k, height: base.height * k)
        }
        .aspectRatio(base.width / base.height, contentMode: .fit)
        .onAppear {
            withAnimation(.easeInOut(duration: 2.8).repeatForever(autoreverses: true)) { swing = true }
            withAnimation(.easeInOut(duration: 7).repeatForever(autoreverses: true)) { breathe = true }
        }
    }

    private func part(_ name: String, w: CGFloat, h: CGFloat, k: CGFloat) -> some View {
        Image(name)
            .resizable()
            .frame(width: w * k, height: h * k)
    }
}
