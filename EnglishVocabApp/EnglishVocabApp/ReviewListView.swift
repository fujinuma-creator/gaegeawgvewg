import SwiftUI

/// 3. 復習リスト
struct ReviewListView: View {
    @EnvironmentObject var store: WordStore
    @EnvironmentObject var settings: AppSettings
    @Binding var path: NavigationPath

    @State private var month = Date().startOfDay
    @State private var selectedDay = Date().startOfDay
    @State private var showAll = false
    @State private var sortByStage = true

    private var todayWords: [Word] { store.todayReviewWords(limit: settings.dailyLimit) }
    private var dayWords: [Word] {
        let list: [Word]
        if selectedDay.isToday { list = todayWords }
        else if selectedDay < Date().startOfDay { list = store.reviewedWords(on: selectedDay) }
        else { list = store.scheduledWords(on: selectedDay) }
        return sortByStage ? list.sorted { $0.stage < $1.stage } : list.sorted { $0.word < $1.word }
    }

    private var isPastDay: Bool { selectedDay < Date().startOfDay }

    var body: some View {
        ZStack {
            HatchBackground()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    ScreenTopBar { path.removeLast() }
                    ScreenHeaderCard(title: "復習リスト", tagline: "忘れかけた頃に、\nもう一度。", image: "hdr_review", markerColor: Palette.markerOrange)
                    todayCard
                    CalendarCard(month: $month, selectedDay: $selectedDay)
                    dayList
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 40)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .studyScreen()
    }

    // MARK: 今日の復習

    private var todayCard: some View {
        let counts = store.stageCounts(limit: settings.dailyLimit)
        return VStack(alignment: .leading, spacing: 12) {
            Text("今日の復習").font(LFont.body(14)).foregroundStyle(Palette.subText)
            HStack(alignment: .lastTextBaseline, spacing: 4) {
                Text("\(todayWords.count)").font(LFont.number(44)).foregroundStyle(Palette.text)
                Text("語").font(LFont.heading(16)).foregroundStyle(Palette.text)
            }
            LazyVGrid(columns: [GridItem(.flexible(), alignment: .leading), GridItem(.flexible(), alignment: .leading)], spacing: 8) {
                ForEach(ReviewStage.allCases, id: \.rawValue) { s in
                    HStack(spacing: 6) {
                        Circle().fill(s.color).frame(width: 10, height: 10)
                        Text("\(s.label) \(counts[s] ?? 0)").font(LFont.body(14)).foregroundStyle(Palette.text)
                    }
                }
            }
            Button {
                startSession(todayWords, title: "復習リスト")
            } label: { Text("今日の復習をはじめる →") }
            .buttonStyle(GreenButtonStyle(fullWidth: false))
            .disabled(todayWords.isEmpty)
            .padding(.top, 4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .sketchCard(padding: 18, emphasized: true)
    }

    // MARK: 選んだ日のリスト

    private var dayList: some View {
        let words = dayWords
        let shown = showAll ? words : Array(words.prefix(5))
        return VStack(spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "clock").font(.system(size: 12, weight: .bold)).foregroundStyle(Palette.text)
                Text("\(selectedDay.withWeekdayJa) の学習時間")
                    .font(LFont.heading(13)).foregroundStyle(Palette.text)
                Spacer()
                Text(StudyStats.timeText(store.liveSeconds(on: selectedDay)))
                    .font(LFont.number(20)).foregroundStyle(Palette.text)
            }
            .sketchCard(padding: 12)
            HStack {
                Text(isPastDay
                     ? "\(selectedDay.withWeekdayJa) に復習した単語 ・ \(words.count)語"
                     : "\(selectedDay.withWeekdayJa) の復習 ・ \(words.count)語")
                    .font(LFont.heading(13)).foregroundStyle(Palette.text)
                Spacer()
                Button { sortByStage.toggle() } label: {
                    HStack(spacing: 3) {
                        Text(sortByStage ? "段階順" : "単語順")
                        Image(systemName: "chevron.down").font(.system(size: 9, weight: .bold))
                    }
                    .font(LFont.body(12)).foregroundStyle(Palette.text)
                }
                .buttonStyle(.plain)
            }
            if words.isEmpty {
                Text(selectedDay.isToday ? "今日の復習はありません 🎉"
                     : (isPastDay ? "この日に復習した単語はありません" : "この日に復習する単語はありません"))
                    .font(LFont.body(14)).foregroundStyle(Palette.subText)
                    .frame(maxWidth: .infinity).sketchCard(padding: 18)
            }
            ForEach(shown) { w in
                ReviewRow(word: w)
            }
            if words.count > 5 && !showAll {
                Button { withAnimation { showAll = true } } label: {
                    Text("ほか \(words.count - 5)語を表示").font(LFont.heading(14)).foregroundStyle(Palette.text)
                        .frame(maxWidth: .infinity).sketchCard(padding: 12)
                }
                .buttonStyle(.plain)
            }
            if !words.isEmpty && selectedDay.isToday {
                Button { startSession(words, title: "復習リスト") } label: {
                    Text("今日の\(words.count)語を復習する →")
                }
                .buttonStyle(GreenButtonStyle(fullWidth: false))
                .padding(.top, 10)
            }
        }
    }

    private func startSession(_ words: [Word], title: String) {
        path.append(HomeView.Route.flashcards(FlashcardDeck(title: title, wordIds: words.map { $0.id })))
    }
}

/// Word / jyutping / meaning + stage badge and dots.
struct ReviewRow: View {
    let word: Word
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Text(word.word).font(LFont.word(22)).foregroundStyle(Palette.text)
                    if !word.ipa.isEmpty {
                        Text(word.ipaDisplay).font(LFont.heading(12)).foregroundStyle(Palette.green)
                            .lineLimit(1).minimumScaleFactor(0.7)
                    }
                    SpeakerButton(text: word.word, size: 12)
                }
                Text(word.japanese).font(LFont.body(14)).foregroundStyle(Palette.text)
                if let last = word.lastReviewedDate {
                    Text("\(last.shortJa)にチェック").font(LFont.caption(11)).foregroundStyle(Palette.faint)
                } else {
                    Text("まだ復習していません").font(LFont.caption(11)).foregroundStyle(Palette.faint)
                }
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 8) {
                StageBadge(stage: word.reviewStage)
                StageDots(stage: word.stage)
            }
        }
        .sketchCard(padding: 14)
    }
}

// MARK: - Calendar

struct CalendarCard: View {
    @EnvironmentObject var store: WordStore
    @EnvironmentObject var settings: AppSettings
    @Binding var month: Date
    @Binding var selectedDay: Date

    private let cal = Calendar.current
    private let weekdays = ["日", "月", "火", "水", "木", "金", "土"]

    private var days: [Date?] {
        guard let range = cal.range(of: .day, in: .month, for: month),
              let first = cal.date(from: cal.dateComponents([.year, .month], from: month)) else { return [] }
        let lead = cal.component(.weekday, from: first) - 1
        var cells: [Date?] = Array(repeating: nil, count: lead)
        for d in range { cells.append(first.adding(days: d - 1)) }
        while cells.count % 7 != 0 { cells.append(nil) }
        return cells
    }

    var body: some View {
        let counts = store.calendarCounts(month: month, limit: settings.dailyLimit)
        VStack(spacing: 10) {
            HStack {
                Button { shift(-1) } label: { Image(systemName: "chevron.left") }
                Spacer()
                Text(month.yearMonthJa).font(LFont.heading(17)).foregroundStyle(Palette.text)
                Spacer()
                Button { shift(1) } label: { Image(systemName: "chevron.right") }
            }
            .font(.system(size: 14, weight: .bold)).foregroundStyle(Palette.text)
            .buttonStyle(.plain)

            HStack {
                ForEach(0..<7, id: \.self) { i in
                    Text(weekdays[i]).font(LFont.caption(12))
                        .foregroundStyle(i == 0 ? Palette.stageRed : (i == 6 ? Palette.stageBlue : Palette.subText))
                        .frame(maxWidth: .infinity)
                }
            }
            let rows = days.chunked(into: 7)
            ForEach(0..<rows.count, id: \.self) { r in
                HStack {
                    ForEach(0..<7, id: \.self) { c in
                        dayCell(rows[r][c], count: rows[r][c].flatMap { counts[cal.component(.day, from: $0)] } ?? 0)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            Text("数字はその日に復習する単語の数（過去の日は ✓ と復習した数）")
                .font(LFont.caption(11)).foregroundStyle(Palette.faint)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .sketchCard(padding: 14)
    }

    @ViewBuilder
    private func dayCell(_ date: Date?, count: Int) -> some View {
        if let date {
            let isToday = date.isToday
            let isSelected = cal.isDate(date, inSameDayAs: selectedDay)
            let past = date < Date().startOfDay
            Button { selectedDay = date } label: {
                VStack(spacing: 3) {
                    Text("\(cal.component(.day, from: date))")
                        .font(LFont.caption(12)).fontWeight(isToday ? .heavy : .medium)
                        .foregroundStyle(Palette.text)
                    ZStack {
                        if past && count > 0 {
                            // 過去の日: その日に答えたカードの数（緑の✓つき）
                            VStack(spacing: 0) {
                                Image(systemName: "checkmark").font(.system(size: 9, weight: .heavy))
                                Text("\(count)").font(.system(size: 10, weight: .bold, design: .rounded))
                            }
                            .foregroundStyle(Palette.green)
                            .overlay { if isSelected { Circle().stroke(Palette.ink, lineWidth: 1.6).frame(width: 30, height: 30) } }
                        } else if count > 0 {
                            Circle()
                                .fill(isToday ? Palette.green : Palette.tagYellow)
                                .overlay(Circle().stroke(Palette.ink, lineWidth: isSelected ? 2.2 : 1.2))
                            Text("\(count)")
                                .font(.system(size: 12, weight: .heavy, design: .rounded))
                                .foregroundStyle(isToday ? .white : Palette.text)
                        } else if past && store.stats.studied(on: date) {
                            Image(systemName: "checkmark").font(.system(size: 11, weight: .bold)).foregroundStyle(Palette.green)
                        } else if isSelected {
                            Circle().stroke(Palette.ink, style: StrokeStyle(lineWidth: 1.4, dash: [3, 2]))
                        }
                    }
                    .frame(width: 30, height: 30)
                }
            }
            .buttonStyle(.plain)
        } else {
            Color.clear.frame(height: 46)
        }
    }

    private func shift(_ n: Int) {
        if let m = cal.date(byAdding: .month, value: n, to: month) { month = m }
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map { Array(self[$0..<Swift.min($0 + size, count)]) }
    }
}
