import SwiftUI

/// 7. 日常のトピック会話（一覧）
struct TopicListView: View {
    @EnvironmentObject var settings: AppSettings
    @Binding var path: NavigationPath

    @AppStorage("lingro.doneConversations") private var doneRaw: String = ""
    @State private var query = ""
    @State private var category: String? = nil
    @State private var level: TopicLevel? = nil
    @State private var expandedCategories: Set<String> = []

    private var done: Set<String> { Set(doneRaw.split(separator: ",").map(String.init)) }

    private var filtered: [TopicConversation] {
        TopicSeed.all.filter { c in
            (category == nil || c.category == category!)
                && (level == nil || c.level == level!)
                && (query.isEmpty || c.title.contains(query) || c.category.contains(query) || c.keys.contains { $0.english.localizedCaseInsensitiveContains(query) })
        }
    }

    /// Categories shown as full sections (first three in the design) and
    /// the rest as the compact grid at the bottom.
    private var sectionCategories: [TopicCategory] {
        let cats = TopicSeed.categories.filter { cat in filtered.contains { $0.category == cat.id } }
        return (category == nil && query.isEmpty) ? Array(cats.prefix(3)) : cats
    }
    private var gridCategories: [TopicCategory] {
        guard category == nil, query.isEmpty else { return [] }
        return Array(TopicSeed.categories.dropFirst(3))
    }

    var body: some View {
        ZStack {
            HatchBackground()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 14) {
                    ScreenTopBar { path.removeLast() }
                    ScreenHeaderCard(title: "日常のトピック会話", tagline: "使う場面で、\n覚える。", image: "hdr_chat", markerColor: Palette.markerOrange, imageHeight: 74)
                    SketchSearchField(placeholder: "場面やことばで検索（例：会計、ER）", text: $query)
                    categoryChips
                    levelChips
                    resumeCard
                    ForEach(sectionCategories) { cat in section(cat) }
                    if !gridCategories.isEmpty { categoryGrid }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 40)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .studyScreen()
    }

    // MARK: chips

    private var categoryChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                SketchChip(title: "すべて \(TopicSeed.all.count)", selected: category == nil) { category = nil }
                ForEach(TopicSeed.categories) { cat in
                    SketchChip(title: "\(cat.id) \(TopicSeed.conversations(in: cat.id).count)", selected: category == cat.id) {
                        category = category == cat.id ? nil : cat.id
                    }
                }
            }
            .padding(.vertical, 3)
        }
    }

    private var levelChips: some View {
        HStack(spacing: 8) {
            Text("レベル").font(LFont.heading(13)).foregroundStyle(Palette.text)
            SketchChip(title: "すべて", selected: level == nil) { level = nil }
            ForEach(TopicLevel.allCases) { l in
                SketchChip(title: l.rawValue, selected: level == l) { level = level == l ? nil : l }
            }
            Spacer()
        }
    }

    // MARK: 続きから

    @ViewBuilder
    private var resumeCard: some View {
        if let id = settings.lastConversationId, let c = TopicSeed.all.first(where: { $0.id == id }) {
            let siblings = TopicSeed.conversations(in: c.category)
            let idx = (siblings.firstIndex(of: c) ?? 0) + 1
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text("続きから").font(LFont.caption(11)).foregroundStyle(Palette.subText)
                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        Text(c.title).font(LFont.heading(16)).foregroundStyle(Palette.text).marker(Palette.markerOrange, height: 8, yOffset: 3)
                        Text("\(c.category) ・ \(idx)/\(siblings.count)").font(LFont.caption(11)).foregroundStyle(Palette.subText)
                    }
                }
                Spacer()
                Button { open(c) } label: { Text("再開 →") }
                    .buttonStyle(GreenButtonStyle(fullWidth: false))
            }
            .sketchCard(padding: 14, emphasized: true)
        }
    }

    // MARK: sections

    private func section(_ cat: TopicCategory) -> some View {
        let items = filtered.filter { $0.category == cat.id }
        let expanded = expandedCategories.contains(cat.id)
        let shown = expanded ? items : Array(items.prefix(3))
        return VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(cat.id).font(LFont.heading(16)).foregroundStyle(Palette.text).marker(cat.color.opacity(0.45), height: 8, yOffset: 3)
                Spacer()
                Text("\(items.count)件").font(LFont.caption(12)).foregroundStyle(Palette.subText)
            }
            .padding(.bottom, 6)
            ForEach(shown) { c in
                Button { open(c) } label: {
                    HStack(spacing: 10) {
                        Image(systemName: done.contains(c.id) ? "checkmark.circle" : "circle")
                            .foregroundStyle(done.contains(c.id) ? Palette.green : Palette.faint)
                        Text("\(c.emoji) \(c.title)").font(LFont.body(14)).foregroundStyle(Palette.text)
                            .lineLimit(1).minimumScaleFactor(0.8)
                        Spacer()
                        SketchTag(text: c.level.rawValue)
                        Image(systemName: "chevron.right").font(.system(size: 11, weight: .bold)).foregroundStyle(Palette.subText)
                    }
                    .padding(.vertical, 9)
                }
                .buttonStyle(.plain)
                if c.id != shown.last?.id { SketchDivider(dashed: true) }
            }
            if items.count > 3 && !expanded {
                Button { withAnimation { _ = expandedCategories.insert(cat.id) } } label: {
                    HStack(spacing: 2) {
                        Text("ほか \(items.count - 3)件を見る")
                        Image(systemName: "chevron.right").font(.system(size: 10, weight: .bold))
                    }
                    .font(LFont.heading(12)).foregroundStyle(Palette.green)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top, 6)
                }
                .buttonStyle(.plain)
            }
        }
        .sketchCard(padding: 14)
    }

    private var categoryGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)], spacing: 12) {
            ForEach(gridCategories) { cat in
                Button { category = cat.id } label: {
                    HStack(spacing: 6) {
                        Circle().fill(cat.color).frame(width: 10, height: 10)
                        Text(cat.id).font(LFont.heading(14)).foregroundStyle(Palette.text).lineLimit(1).minimumScaleFactor(0.8)
                        Spacer()
                        Text("\(TopicSeed.conversations(in: cat.id).count)件").font(LFont.caption(11)).foregroundStyle(Palette.subText)
                        Image(systemName: "chevron.right").font(.system(size: 10, weight: .bold)).foregroundStyle(Palette.subText)
                    }
                    .sketchCard(padding: 12)
                }
                .buttonStyle(.plain)
            }
        }
    }

    private func open(_ c: TopicConversation) {
        path.append(HomeView.Route.conversation(c.id))
    }
}
