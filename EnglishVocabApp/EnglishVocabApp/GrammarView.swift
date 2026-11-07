import SwiftUI

/// 6. 文法
struct GrammarView: View {
    @EnvironmentObject var store: WordStore
    @Binding var path: NavigationPath
    @State private var level: TopicLevel = .beginner
    @State private var openId: String? = nil

    private var topics: [GrammarTopic] { GrammarSeed.topics(for: level) }

    var body: some View {
        ZStack {
            HatchBackground()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 14) {
                    ScreenTopBar { path.removeLast() }
                    ScreenHeaderCard(title: "文法", tagline: "かたちを知れば、\nことばはつながる。", image: "hdr_grammar", markerColor: Palette.markerRed)
                    HStack(spacing: 8) {
                        ForEach(TopicLevel.allCases) { l in
                            SketchChip(title: l.rawValue, selected: level == l) { level = l; openId = nil }
                        }
                        Spacer()
                    }
                    ForEach(Array(topics.enumerated()), id: \.element.id) { i, t in
                        row(number: i + 1, topic: t)
                        if openId == t.id { detail(t) }
                    }
                    practiceCard
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 40)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .studyScreen()
    }

    /// 4択の練習問題（379問）へ。
    private var practiceCard: some View {
        Button { path.append(HomeView.Route.grammarQuiz) } label: {
            HStack(spacing: 12) {
                Text("?")
                    .font(LFont.title(26)).foregroundStyle(.white)
                    .frame(width: 44, height: 44)
                    .background(Palette.stageRed)
                    .overlay(Rectangle().strokeBorder(Palette.ink, lineWidth: 1.2))
                VStack(alignment: .leading, spacing: 3) {
                    Text("4択で練習する").font(LFont.heading(16)).foregroundStyle(Palette.text).marker(Palette.markerRed, height: 8, yOffset: 3)
                    Text("\(GrammarMCQSeed.questions.count)問から毎日ちがう10問。解説つき").font(LFont.caption(12)).foregroundStyle(Palette.subText)
                }
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 13, weight: .bold)).foregroundStyle(Palette.subText)
            }
            .sketchCard(padding: 14, emphasized: true)
        }
        .buttonStyle(.plain)
        .padding(.top, 6)
    }

    private func row(number: Int, topic t: GrammarTopic) -> some View {
        let open = openId == t.id
        return Button {
            withAnimation(.easeInOut(duration: 0.2)) { openId = open ? nil : t.id }
            if !open { store.markStudied() }
        } label: {
            HStack(spacing: 14) {
                Text(String(format: "%02d", number))
                    .font(LFont.title(20)).foregroundStyle(Palette.stageRed)
                VStack(alignment: .leading, spacing: 3) {
                    Text(t.title).font(LFont.heading(16)).foregroundStyle(Palette.text)
                    Text(t.summary).font(LFont.caption(12)).foregroundStyle(Palette.subText)
                    Text(t.sample).font(LFont.heading(13)).foregroundStyle(Palette.green)
                }
                Spacer()
                Image(systemName: open ? "chevron.down" : "chevron.right")
                    .font(.system(size: 13, weight: .bold)).foregroundStyle(Palette.subText)
            }
            .sketchCard(padding: 14, emphasized: open)
        }
        .buttonStyle(.plain)
    }

    private func detail(_ t: GrammarTopic) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            Text(t.detailTitle).font(LFont.title(26)).foregroundStyle(Palette.text)
            Text(t.detailSubtitle).font(LFont.body(13)).foregroundStyle(Palette.subText)
            ForEach(t.sections) { sec in
                VStack(alignment: .leading, spacing: 10) {
                    Text(sec.heading).font(LFont.heading(15)).foregroundStyle(Palette.text)
                        .marker(Palette.markerBlue, height: 8, yOffset: 3)
                    HStack(alignment: .top, spacing: 8) {
                        ForEach(sec.chunks) { ch in
                            VStack(spacing: 4) {
                                Text(ch.text).font(LFont.heading(16)).foregroundStyle(Palette.text)
                                    .padding(.vertical, 6).padding(.horizontal, 10)
                                    .background(tint(ch.tint))
                                    .overlay(Rectangle().strokeBorder(Palette.ink, lineWidth: 1))
                                Text(ch.label).font(LFont.caption(10)).foregroundStyle(Palette.subText)
                            }
                        }
                    }
                    ForEach(sec.examples) { ex in
                        Button { SpeechManager.shared.speak(ex.english) } label: {
                            VStack(alignment: .leading, spacing: 2) {
                                HStack(spacing: 6) {
                                    Text(ex.english).font(LFont.heading(15)).foregroundStyle(Palette.text)
                                        .fixedSize(horizontal: false, vertical: true)
                                    Image(systemName: "speaker.wave.2").font(.system(size: 11)).foregroundStyle(Palette.green)
                                }
                                if !ex.ipa.isEmpty { Text(ex.ipa).font(LFont.caption(11)).foregroundStyle(Palette.green) }
                                Text(ex.japanese).font(LFont.caption(12)).foregroundStyle(Palette.subText)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 6) {
                Text(t.tipTitle).font(LFont.heading(14)).foregroundStyle(Palette.text)
                Text(t.tip).font(LFont.body(13)).foregroundStyle(Palette.text).fixedSize(horizontal: false, vertical: true)
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Palette.tagYellow.opacity(0.8))
            .overlay(Rectangle().strokeBorder(Palette.coinOrange.opacity(0.7), lineWidth: 1))
            HStack(spacing: 14) {
                HStack(spacing: 4) {
                    Text("×").foregroundStyle(Palette.stageRed)
                    Text(t.wrong).foregroundStyle(Palette.text)
                }
                HStack(spacing: 4) {
                    Text("○").foregroundStyle(Palette.stageTeal)
                    Text(t.right).foregroundStyle(Palette.text)
                }
            }
            .font(LFont.heading(13))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .sketchCard(padding: 18, emphasized: true)
    }

    private func tint(_ n: Int) -> Color {
        switch n {
        case 0: return Palette.markerBlue.opacity(0.5)
        case 1: return Palette.markerRed.opacity(0.6)
        case 2: return Palette.markerYellow.opacity(0.6)
        default: return Palette.markerGreen.opacity(0.6)
        }
    }
}


/// 文法の4択練習。1回10問、順番は日替わり。
struct GrammarQuizView: View {
    @EnvironmentObject var store: WordStore
    @Binding var path: NavigationPath

    @State private var questions: [GrammarQuestion] = []
    @State private var index = 0
    @State private var chosen: Int? = nil
    @State private var correct = 0
    @State private var finished = false
    private let roundSize = 10

    var body: some View {
        ZStack {
            HatchBackground()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 14) {
                    ScreenTopBar(backTitle: "文法") { path.removeLast() }
                    if finished {
                        summary
                    } else if index < questions.count {
                        progress
                        card(questions[index])
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 40)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .studyScreen()
        .onAppear { if questions.isEmpty { start() } }
    }

    private func start() {
        let day = Int(Date().startOfDay.timeIntervalSince1970 / 86_400)
        var rng = SplitMix64(seed: UInt64(bitPattern: Int64(day &* 104_729 &+ 3)))
        var all = GrammarMCQSeed.questions
        all.shuffle(using: &rng)
        questions = Array(all.prefix(roundSize))
        index = 0; chosen = nil; correct = 0; finished = false
    }

    private var progress: some View {
        HStack {
            Text("第 \(index + 1) / \(questions.count) 問").font(LFont.heading(14)).foregroundStyle(Palette.text)
            Spacer()
            Text("正解 \(correct)").font(LFont.heading(14)).foregroundStyle(Palette.green)
        }
        .padding(.horizontal, 10).padding(.vertical, 4)
        .background(Palette.paper.opacity(0.9))
    }

    private func card(_ q: GrammarQuestion) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            Text(q.question)
                .font(LFont.heading(18)).foregroundStyle(Palette.text)
                .fixedSize(horizontal: false, vertical: true)
            VStack(spacing: 10) {
                ForEach(Array(q.choices.enumerated()), id: \.offset) { i, choice in
                    choiceButton(i, choice, q)
                }
            }
            if let c = chosen {
                SketchDivider(dashed: true)
                HStack(spacing: 6) {
                    Text(c == q.correctIndex ? "○ 正解！" : "× 不正解")
                        .font(LFont.heading(16))
                        .foregroundStyle(c == q.correctIndex ? Palette.stageTeal : Palette.stageRed)
                    Spacer()
                    SpeakerButton(text: q.question.replacingOccurrences(of: "___", with: q.choices[q.correctIndex]), size: 16)
                }
                Text(q.translation).font(LFont.body(14)).foregroundStyle(Palette.text)
                    .fixedSize(horizontal: false, vertical: true)
                Text(q.explanation.trimmingCharacters(in: .whitespacesAndNewlines))
                    .font(LFont.body(13)).foregroundStyle(Palette.text)
                    .lineSpacing(3)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Palette.tagYellow.opacity(0.8))
                    .overlay(Rectangle().strokeBorder(Palette.coinOrange.opacity(0.7), lineWidth: 1))
                Button { next() } label: { Text(index + 1 >= questions.count ? "結果を見る →" : "次の問題 →") }
                    .buttonStyle(GreenButtonStyle())
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .sketchCard(padding: 18, emphasized: true)
    }

    private func choiceButton(_ i: Int, _ text: String, _ q: GrammarQuestion) -> some View {
        let answered = chosen != nil
        let isRight = i == q.correctIndex
        let isMine = chosen == i
        let fill: Color = !answered ? Palette.paper : (isRight ? Palette.markerGreen : (isMine ? Palette.markerRed : Palette.paper))
        return Button {
            guard chosen == nil else { return }
            chosen = i
            if isRight { correct += 1 }
            store.markStudied()
        } label: {
            HStack(spacing: 10) {
                Text(["A", "B", "C", "D"][min(i, 3)]).font(LFont.heading(13)).foregroundStyle(Palette.subText).frame(width: 18)
                Text(text).font(LFont.heading(15)).foregroundStyle(Palette.text)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                if answered && isRight { Text("○").foregroundStyle(Palette.stageTeal).font(LFont.heading(15)) }
                if answered && isMine && !isRight { Text("×").foregroundStyle(Palette.stageRed).font(LFont.heading(15)) }
            }
            .padding(.vertical, 10).padding(.horizontal, 12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(ZStack {
                Rectangle().fill(Palette.ink).offset(x: 2, y: 2)
                Rectangle().fill(fill)
                Rectangle().strokeBorder(Palette.ink, lineWidth: answered && (isRight || isMine) ? 2 : 1.2)
            })
        }
        .buttonStyle(.plain)
        .disabled(answered)
    }

    private func next() {
        if index + 1 >= questions.count { finished = true } else { index += 1; chosen = nil }
    }

    private var summary: some View {
        VStack(spacing: 14) {
            Text("🎉").font(.system(size: 50))
            Text("\(correct) / \(questions.count) 問 正解").font(LFont.title(24)).foregroundStyle(Palette.text)
            Text("明日はまた別の10問が出ます").font(LFont.body(14)).foregroundStyle(Palette.subText)
            HStack(spacing: 10) {
                Button { start() } label: { Text("同じ10問をもう一度") }.buttonStyle(OutlineButtonStyle(fullWidth: false))
                Button { path.removeLast() } label: { Text("文法に戻る →") }.buttonStyle(GreenButtonStyle(fullWidth: false))
            }
        }
        .frame(maxWidth: .infinity)
        .sketchCard(padding: 28)
        .padding(.top, 30)
    }
}
