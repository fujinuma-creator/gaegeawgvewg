import SwiftUI

/// 8. 日常のトピック会話（会話）
struct ConversationView: View {
    @EnvironmentObject var store: WordStore
    @EnvironmentObject var settings: AppSettings
    let conversationId: String
    @Binding var path: NavigationPath

    @AppStorage("lingro.doneConversations") private var doneRaw: String = ""
    @State private var playingLine: Int? = nil

    private var conversation: TopicConversation? { TopicSeed.all.first { $0.id == conversationId } }

    var body: some View {
        ZStack {
            HatchBackground()
            if let c = conversation {
                let siblings = TopicSeed.conversations(in: c.category)
                let idx = (siblings.firstIndex(of: c) ?? 0)
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 14) {
                        topBar(c)
                        Text("\(c.emoji) \(c.category)　\(idx + 1) / \(siblings.count)")
                            .font(LFont.heading(13)).foregroundStyle(Palette.text)
                            .padding(.horizontal, 8).padding(.vertical, 2)
                            .background(Palette.paper.opacity(0.9))
                        VStack(spacing: 14) {
                            ForEach(c.lines) { line in
                                if line.sectionBreak {
                                    SketchDivider(dashed: true).padding(.vertical, 2).padding(.horizontal, 30)
                                }
                                bubble(line)
                            }
                        }
                        .padding(.top, 6)
                        keyCard(c)
                        if idx + 1 < siblings.count {
                            nextCard(siblings[idx + 1])
                        } else {
                            Button { path.removeLast() } label: { Text("一覧に戻る →") }
                                .buttonStyle(GreenButtonStyle(fullWidth: false))
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    .padding(.bottom, 40)
                }
            } else {
                Text("会話が見つかりません").foregroundStyle(Palette.subText)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .studyScreen()
        .onAppear {
            settings.lastConversationId = conversationId
            store.markStudied()
            markDone()
            if settings.autoSpeak, let first = conversation?.lines.first {
                SpeechManager.shared.speak(first.english)
            }
        }
        .onDisappear { SpeechManager.shared.stop() }
    }

    private func markDone() {
        var set = Set(doneRaw.split(separator: ",").map(String.init))
        set.insert(conversationId)
        doneRaw = set.sorted().joined(separator: ",")
    }

    private func topBar(_ c: TopicConversation) -> some View {
        HStack(alignment: .top) {
            Button { path.removeLast() } label: {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left").font(.system(size: 12, weight: .bold))
                    Text("一覧").font(LFont.heading(14))
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
            Text(c.title)
                .font(LFont.heading(18)).foregroundStyle(Palette.text)
                .marker(Palette.markerOrange, height: 9, yOffset: 3)
                .multilineTextAlignment(.center)
                .padding(.top, 6)
            Spacer()
            Button { path.removeLast(path.count) } label: {
                Text("閉じる").font(LFont.heading(14))
                    .foregroundStyle(Palette.text)
                    .padding(.vertical, 7).padding(.horizontal, 10)
                    .background(ZStack {
                        Rectangle().fill(Palette.ink).offset(x: 2, y: 2)
                        Rectangle().fill(Palette.paper)
                        Rectangle().strokeBorder(Palette.ink, lineWidth: 1.3)
                    })
            }
            .buttonStyle(.plain)
        }
    }

    private func bubble(_ line: DialogueLine) -> some View {
        let isA = line.speaker == "A"
        return HStack(alignment: .bottom, spacing: 8) {
            if isA { avatar("A") } else { Spacer(minLength: 40) }
            Button {
                playingLine = line.id
                SpeechManager.shared.speak(line.english)
            } label: {
                VStack(alignment: .leading, spacing: 4) {
                    Text(line.japanese)
                        .font(LFont.caption(12))
                        .foregroundStyle(isA ? Palette.subText : .white.opacity(0.85))
                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        Text(line.english)
                            .font(LFont.heading(17))
                            .foregroundStyle(isA ? Palette.text : .white)
                            .fixedSize(horizontal: false, vertical: true)
                        Image(systemName: "speaker.wave.2")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(isA ? Palette.green : .white)
                    }
                    if !line.ipa.isEmpty {
                        Text(line.ipa)
                            .font(LFont.caption(11))
                            .foregroundStyle(isA ? Palette.green : .white.opacity(0.8))
                    }
                }
                .padding(.vertical, 10).padding(.horizontal, 14)
                .background(ZStack {
                    Rectangle().fill(Palette.ink).offset(x: 3, y: 3)
                    Rectangle().fill(isA ? Palette.paper : Palette.bubbleGreen)
                    Rectangle().strokeBorder(Palette.ink, lineWidth: playingLine == line.id ? 2.2 : 1.4)
                })
            }
            .buttonStyle(.plain)
            if isA { Spacer(minLength: 40) } else { avatar("B") }
        }
        .frame(maxWidth: .infinity, alignment: isA ? .leading : .trailing)
    }

    private func avatar(_ s: String) -> some View {
        Text(s).font(LFont.heading(13)).foregroundStyle(Palette.text)
            .frame(width: 28, height: 28)
            .background(Circle().fill(Palette.paper))
            .overlay(Circle().stroke(Palette.ink, lineWidth: 1.4))
    }

    private func keyCard(_ c: TopicConversation) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("この会話の表現").font(LFont.heading(15)).foregroundStyle(Palette.text)
            FlowLayout(spacing: 8) {
                ForEach(c.keys) { k in
                    Button { SpeechManager.shared.speak(k.english) } label: {
                        HStack(spacing: 6) {
                            Text(k.english).font(LFont.heading(14)).foregroundStyle(Palette.text)
                            if !k.japanese.isEmpty {
                                Text(k.japanese).font(LFont.caption(12)).foregroundStyle(Palette.subText)
                            }
                        }
                        .padding(.vertical, 5).padding(.horizontal, 9)
                        .background(ZStack {
                            Rectangle().fill(Palette.ink).offset(x: 2, y: 2)
                            Rectangle().fill(Palette.paper)
                            Rectangle().strokeBorder(Palette.ink, lineWidth: 1.2)
                        })
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .sketchCard(padding: 14)
        .padding(.top, 8)
    }

    private func nextCard(_ next: TopicConversation) -> some View {
        Button { path.append(HomeView.Route.conversation(next.id)) } label: {
            HStack {
                Text("次の会話：\(next.title)").font(LFont.heading(14)).foregroundStyle(Palette.text)
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 12, weight: .bold)).foregroundStyle(Palette.text)
            }
            .sketchCard(padding: 14)
        }
        .buttonStyle(.plain)
    }
}

/// Simple wrapping layout for chips.
struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let width = proposal.width ?? .infinity
        var x: CGFloat = 0, y: CGFloat = 0, rowH: CGFloat = 0
        for s in subviews {
            let size = s.sizeThatFits(.unspecified)
            if x + size.width > width, x > 0 { x = 0; y += rowH + spacing; rowH = 0 }
            x += size.width + spacing
            rowH = max(rowH, size.height)
        }
        return CGSize(width: width == .infinity ? x : width, height: y + rowH)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var x = bounds.minX, y = bounds.minY, rowH: CGFloat = 0
        for s in subviews {
            let size = s.sizeThatFits(.unspecified)
            if x + size.width > bounds.maxX, x > bounds.minX { x = bounds.minX; y += rowH + spacing; rowH = 0 }
            s.place(at: CGPoint(x: x, y: y), proposal: ProposedViewSize(size))
            x += size.width + spacing
            rowH = max(rowH, size.height)
        }
    }
}
