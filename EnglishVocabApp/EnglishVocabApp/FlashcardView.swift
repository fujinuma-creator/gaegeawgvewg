import SwiftUI

/// 4. 復習のフラッシュカード
struct FlashcardView: View {
    @EnvironmentObject var store: WordStore
    @EnvironmentObject var settings: AppSettings
    let deck: FlashcardDeck
    @Binding var path: NavigationPath

    enum Direction: String, CaseIterable { case enToJa = "英語 → 日本語", jaToEn = "日本語 → 英語" }
    enum Face { case front, answer, detail }

    @State private var index = 0
    @State private var face: Face = .front
    @State private var direction: Direction = .enToJa
    @State private var remembered = 0
    @State private var finished = false
    @State private var dragOffset: CGSize = .zero
    @State private var flyingOut = false
    /// nil until the finger has moved far enough to tell; then true for a
    /// sideways swipe (moves the card) and false for an up/down scroll.
    @State private var dragIsHorizontal: Bool? = nil
    /// The deck's words, looked up once. Looking them up on every frame of a
    /// drag (deck × 4,000 words) is what made the swipe stutter.
    @State private var words: [Word] = []
    @State private var loaded = false

    private var current: Word? { index < words.count ? words[index] : nil }

    private func loadDeck() {
        guard !loaded else { return }
        var byId: [String: Word] = [:]
        byId.reserveCapacity(store.words.count)
        for w in store.words where byId[w.id] == nil { byId[w.id] = w }
        words = deck.wordIds.compactMap { byId[$0] }
        loaded = true
    }

    var body: some View {
        ZStack {
            HatchBackground()
            VStack(spacing: 14) {
                header
                progressBar
                directionToggle
                if !loaded {
                    Spacer()
                } else if finished || current == nil {
                    doneCard
                } else if let w = current {
                    card(w)
                        .offset(x: dragOffset.width, y: dragOffset.height * 0.15)
                        .rotationEffect(.degrees(Double(dragOffset.width) / 24), anchor: .bottom)
                        // simultaneous, so the swipe also works on the detail
                        // face, whose examples sit in a vertical ScrollView
                        .simultaneousGesture(swipeGesture(w))
                    Spacer(minLength: 0)
                    swipeHint
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
            .padding(.bottom, 24)

            // スワイプ中は画面全体に ⭕️ 思い出せた ／ ❌ 思い出せなかった を表示
            swipeFeedback
        }
        .toolbar(.hidden, for: .navigationBar)
        .studyScreen()
        .onAppear {
            loadDeck()
            if settings.autoSpeak, direction == .enToJa, let w = current { SpeechManager.shared.speak(w.word) }
        }
    }

    // MARK: header / progress / toggle

    private var header: some View {
        HStack {
            Button { path.removeLast() } label: {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left").font(.system(size: 12, weight: .bold))
                    Text(deck.title).font(LFont.heading(14))
                }
                .foregroundStyle(Palette.text)
                .padding(.vertical, 7).padding(.horizontal, 10)
                .background(ZStack {
                    Rectangle().fill(Palette.ink).offset(x: 2, y: 2)
                    Rectangle().fill(Palette.paper)
                    Rectangle().strokeBorder(Palette.ink, lineWidth: 1.3)
                })
            }
            .buttonStyle(.plain)
            Spacer()
            Text("\(min(index + 1, max(words.count, 1))) / \(words.count)")
                .font(LFont.heading(14)).foregroundStyle(Palette.text)
        }
    }

    private var progressBar: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle().fill(Palette.paper)
                Rectangle().fill(Palette.green)
                    .frame(width: geo.size.width * CGFloat(words.isEmpty ? 0 : Double(index) / Double(words.count)))
                Rectangle().strokeBorder(Palette.ink, lineWidth: 1.2)
            }
        }
        .frame(height: 12)
    }

    private var directionToggle: some View {
        HStack(spacing: 10) {
            ForEach(Direction.allCases, id: \.self) { d in
                Button {
                    direction = d; face = .front
                } label: {
                    Text(d.rawValue)
                        .font(LFont.heading(13))
                        .foregroundStyle(direction == d ? .white : Palette.text)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 9)
                        .background(ZStack {
                            Rectangle().fill(Palette.ink).offset(x: 2, y: 2)
                            Rectangle().fill(direction == d ? Palette.green : Palette.paper)
                            Rectangle().strokeBorder(Palette.ink, lineWidth: 1.3)
                        })
                }
                .buttonStyle(.plain)
            }
        }
    }

    // MARK: card

    private func card(_ w: Word) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 5) {
                Circle().fill(w.reviewStage.color).frame(width: 9, height: 9)
                Text("\(w.reviewStage.label)の復習").font(LFont.caption(12)).foregroundStyle(Palette.text)
            }
            Spacer(minLength: 12)
            Group {
                switch face {
                case .front:  front(w)
                case .answer: answer(w)
                case .detail: detail(w)
                }
            }
            .frame(maxWidth: .infinity)
            Spacer(minLength: 12)
            Text(hint)
                .font(LFont.caption(12)).foregroundStyle(Palette.faint)
                .frame(maxWidth: .infinity)
        }
        .padding(18)
        .frame(maxWidth: .infinity, minHeight: 380)
        .background(ZStack {
            Rectangle().fill(Palette.paper).offset(x: 5, y: 6).overlay(Rectangle().strokeBorder(Palette.ink.opacity(0.5), lineWidth: 1.2).offset(x: 5, y: 6))
            Rectangle().fill(Palette.paper)
            Rectangle().strokeBorder(Palette.ink, lineWidth: 1.8)
        })
        .contentShape(Rectangle())
        .onTapGesture { advanceFace(w) }
    }

    private var hint: String {
        switch face {
        case .front:  return direction == .enToJa ? "タップで答えを表示" : "タップで英語を表示"
        case .answer: return "もう一度タップで詳しく"
        case .detail: return "タップで単語に戻る"
        }
    }

    private func advanceFace(_ w: Word) {
        withAnimation(.easeInOut(duration: 0.15)) {
            switch face {
            case .front:
                face = .answer
                if settings.autoSpeak { SpeechManager.shared.speak(w.word) }
            case .answer: face = .detail
            case .detail: face = .front
            }
        }
    }

    private func front(_ w: Word) -> some View {
        VStack(spacing: 14) {
            if direction == .enToJa {
                Text(w.word).font(LFont.word(40)).foregroundStyle(Palette.text).multilineTextAlignment(.center)
                SpeakerButton(text: w.word, size: 20, color: Palette.text)
            } else {
                Text(w.japanese).font(LFont.word(30)).foregroundStyle(Palette.text).multilineTextAlignment(.center)
                if let uc = w.useCases.first {
                    Text(uc).font(LFont.body(13)).foregroundStyle(Palette.subText)
                }
            }
        }
    }

    private func answer(_ w: Word) -> some View {
        VStack(spacing: 10) {
            Text(w.word).font(LFont.word(36)).foregroundStyle(Palette.text).multilineTextAlignment(.center)
            if !w.ipa.isEmpty { Text(w.ipaDisplay).font(LFont.heading(15)).foregroundStyle(Palette.green) }
            SpeakerButton(text: w.word, size: 18, color: Palette.text)
            Rectangle().fill(Palette.ink).frame(height: 1.4).padding(.horizontal, 20).padding(.vertical, 6)
            Text(w.japanese).font(LFont.word(26)).foregroundStyle(Palette.text).marker(Palette.markerOrange, height: 12, yOffset: 4)
                .multilineTextAlignment(.center)
        }
    }

    private func detail(_ w: Word) -> some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Text(w.word).font(LFont.word(30)).foregroundStyle(Palette.text)
                    SpeakerButton(text: w.word, size: 16, color: Palette.text)
                }
                if !w.ipa.isEmpty { Text(w.ipaDisplay).font(LFont.heading(14)).foregroundStyle(Palette.green) }
                Text(w.japanese).font(LFont.word(20)).foregroundStyle(Palette.text).marker(Palette.markerOrange, height: 10, yOffset: 3)
                if !w.definition.isEmpty {
                    detailLabel("英語の定義")
                    Text(w.definition).font(LFont.body(14)).foregroundStyle(Palette.text)
                }
                if let uc = w.useCases.first {
                    detailLabel("使う場面")
                    Text(uc).font(LFont.body(14)).foregroundStyle(Palette.text)
                }
                if !w.examples.isEmpty {
                    detailLabel("例文")
                    ForEach(w.examples.prefix(3)) { ex in ExampleLine(example: ex, size: 14) }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxHeight: 300)
    }

    private func detailLabel(_ s: String) -> some View {
        Text(s).font(LFont.caption(11)).foregroundStyle(Palette.faint).padding(.top, 4)
    }

    // MARK: swipe

    /// ⭕️ / ❌ stamps that fade in while the card is being dragged.
    /// Full-screen feedback while dragging: a soft colour wash over the whole
    /// screen with a big mark and label in the middle, fading in with the drag.
    private var swipeFeedback: some View {
        let dx = dragOffset.width
        let right = dx > 0
        let strength = min(1, max(0, (abs(dx) - 15) / 90))
        let color = right ? Palette.green : Palette.stageRed
        return ZStack {
            color.opacity(0.22 * strength)
                .ignoresSafeArea()
            VStack(spacing: 10) {
                Text(right ? "⭕️" : "❌").font(.system(size: 76))
                Text(right ? "思い出せた" : "思い出せなかった")
                    .font(LFont.title(28))
                    .foregroundStyle(color)
                Text(right ? "次は少し先に復習" : "1日後にもう一度")
                    .font(LFont.body(14))
                    .foregroundStyle(Palette.text.opacity(0.8))
            }
            .padding(.vertical, 22).padding(.horizontal, 30)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(Palette.paper.opacity(0.92))
                    .overlay(RoundedRectangle(cornerRadius: 18).stroke(color, lineWidth: 2))
            )
            .scaleEffect(0.9 + 0.1 * strength)
        }
        .opacity(strength)
        .allowsHitTesting(false)
    }

    private var swipeHint: some View {
        HStack(spacing: 18) {
            HStack(spacing: 4) {
                Image(systemName: "arrow.left").font(.system(size: 11, weight: .bold))
                Text("❌").font(.system(size: 12))
            }
            Text("カードを左右にスワイプ")
            HStack(spacing: 4) {
                Text("⭕️").font(.system(size: 12))
                Image(systemName: "arrow.right").font(.system(size: 11, weight: .bold))
            }
        }
        .font(LFont.caption(12)).foregroundStyle(Palette.subText)
        .padding(.vertical, 6).padding(.horizontal, 12)
        .background(Palette.paper.opacity(0.9))
    }

    private func swipeGesture(_ w: Word) -> some Gesture {
        DragGesture(minimumDistance: 8)
            .onChanged { v in
                guard !flyingOut else { return }
                if dragIsHorizontal == nil {
                    let dx = abs(v.translation.width), dy = abs(v.translation.height)
                    guard max(dx, dy) > 8 else { return }
                    dragIsHorizontal = dx > dy
                }
                guard dragIsHorizontal == true else { return }
                dragOffset = v.translation
            }
            .onEnded { v in
                defer { dragIsHorizontal = nil }
                guard !flyingOut, dragIsHorizontal == true else { return }
                let dx = v.translation.width
                // A quick flick counts even if the finger travelled only a little.
                let flick = v.predictedEndTranslation.width
                if dx > 70 || (dx > 20 && flick > 220) {
                    flyOff(direction: 1, from: v) { answer(remembered: true, w) }
                } else if dx < -70 || (dx < -20 && flick < -220) {
                    flyOff(direction: -1, from: v) { answer(remembered: false, w) }
                } else {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) { dragOffset = .zero }
                }
            }
    }

    private func flyOff(direction: CGFloat, from v: DragGesture.Value, then completion: @escaping () -> Void) {
        flyingOut = true
        // Keep the finger's speed: a fast flick leaves faster.
        let speed = abs(v.predictedEndTranslation.width - v.translation.width)
        let duration = speed > 300 ? 0.14 : 0.2
        withAnimation(.easeOut(duration: duration)) {
            dragOffset = CGSize(width: direction * 520, height: dragOffset.height)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            var t = Transaction()
            t.disablesAnimations = true
            withTransaction(t) {
                completion()
                dragOffset = .zero
            }
            flyingOut = false
        }
    }

    private func answer(remembered ok: Bool, _ w: Word) {
        store.record(remembered: ok, for: w)
        if ok { remembered += 1 }
        if index + 1 >= words.count {
            finished = true
        } else {
            index += 1
            face = .front
            if settings.autoSpeak, direction == .enToJa, let n = current { SpeechManager.shared.speak(n.word) }
        }
    }

    private var doneCard: some View {
        VStack(spacing: 14) {
            Text("🎉").font(.system(size: 50))
            Text("今日の復習が終わりました").font(LFont.heading(18)).foregroundStyle(Palette.text)
            Text("思い出せた \(remembered) ／ \(words.count) 語").font(LFont.body(14)).foregroundStyle(Palette.subText)
            Button { path.removeLast() } label: { Text("\(deck.title)に戻る →") }
                .buttonStyle(GreenButtonStyle(fullWidth: false))
        }
        .frame(maxWidth: .infinity)
        .sketchCard(padding: 28)
        .padding(.top, 30)
    }
}
