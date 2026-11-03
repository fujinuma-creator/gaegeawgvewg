import SwiftUI

// MARK: - Palette (sampled from the Lingro screen design)

enum Palette {
    static let ink        = Color(red: 0.26, green: 0.20, blue: 0.17)   // 線・濃い文字
    static let text       = Color(red: 0.23, green: 0.18, blue: 0.16)
    static let subText    = Color(red: 0.46, green: 0.41, blue: 0.38)
    static let faint      = Color(red: 0.62, green: 0.58, blue: 0.55)
    static let green      = Color(red: 0.21, green: 0.55, blue: 0.44)   // ボタン・アクセント
    static let greenDark  = Color(red: 0.16, green: 0.45, blue: 0.36)
    static let hatch      = Color(red: 0.55, green: 0.76, blue: 0.90)   // 背景の斜線
    static let hatchPale  = Color(red: 0.93, green: 0.97, blue: 1.00)
    static let paper      = Color.white
    static let cream      = Color(red: 1.00, green: 0.98, blue: 0.93)

    // マーカー（見出しの下に引く色）
    static let markerGreen  = Color(red: 0.45, green: 0.78, blue: 0.62).opacity(0.55)
    static let markerOrange = Color(red: 0.98, green: 0.72, blue: 0.33).opacity(0.6)
    static let markerBlue   = Color(red: 0.55, green: 0.80, blue: 0.93).opacity(0.6)
    static let markerRed    = Color(red: 0.95, green: 0.55, blue: 0.52).opacity(0.5)
    static let markerYellow = Color(red: 1.00, green: 0.86, blue: 0.40).opacity(0.65)

    // 復習段階の色（1日後 / 1週間後 / 2週間後 / 1ヶ月後）
    static let stageRed    = Color(red: 0.84, green: 0.43, blue: 0.38)
    static let stageYellow = Color(red: 0.95, green: 0.70, blue: 0.22)
    static let stageBlue   = Color(red: 0.31, green: 0.69, blue: 0.85)
    static let stageTeal   = Color(red: 0.23, green: 0.60, blue: 0.49)

    static let coinOrange  = Color(red: 0.93, green: 0.56, blue: 0.22)
    static let tagYellow   = Color(red: 1.00, green: 0.93, blue: 0.70)
    static let bubbleGreen = Color(red: 0.24, green: 0.56, blue: 0.46)
}

// MARK: - Fonts (丸ゴシック寄り)

enum LFont {
    static func title(_ size: CGFloat = 26) -> Font { .system(size: size, weight: .black, design: .rounded) }
    static func heading(_ size: CGFloat = 18) -> Font { .system(size: size, weight: .bold, design: .rounded) }
    static func body(_ size: CGFloat = 15) -> Font { .system(size: size, weight: .medium, design: .rounded) }
    static func caption(_ size: CGFloat = 12) -> Font { .system(size: size, weight: .medium, design: .rounded) }
    static func number(_ size: CGFloat = 34) -> Font { .system(size: size, weight: .black, design: .rounded) }
    static func word(_ size: CGFloat = 24) -> Font { .system(size: size, weight: .heavy, design: .rounded) }
}

// MARK: - Hatched sky background (手描きの斜線)

/// The light-blue diagonal pencil hatching used behind every screen. Drawn
/// with a Canvas so it is seamless at any size; strokes are placed with a
/// fixed pseudo-random sequence so they look hand-drawn but never flicker.
struct HatchBackground: View {
    var body: some View {
        Canvas { context, size in
            var rng = HatchRNG(seed: 20261102)
            let spacing: CGFloat = 7
            let angle: CGFloat = 1.15 // ≈66°
            let dx = cos(angle), dy = sin(angle)
            let total = size.width + size.height
            var offset: CGFloat = -size.height
            while offset < total {
                // Each hatch line is broken into short strokes of varying length.
                var t: CGFloat = -size.height
                while t < total {
                    let len = 40 + rng.next() * 160
                    let gap = 6 + rng.next() * 40
                    let start = CGPoint(x: offset + t * dx, y: t * dy)
                    let end = CGPoint(x: offset + (t + len) * dx, y: (t + len) * dy)
                    if start.y <= size.height || end.y <= size.height {
                        var path = Path()
                        path.move(to: start)
                        path.addLine(to: end)
                        let alpha = 0.35 + rng.next() * 0.45
                        context.stroke(path, with: .color(Palette.hatch.opacity(alpha)),
                                       lineWidth: 0.8 + rng.next() * 0.9)
                    }
                    t += len + gap
                }
                offset += spacing + rng.next() * 3
            }
        }
        .background(Palette.hatchPale)
        .ignoresSafeArea()
    }
}

struct HatchRNG {
    private var state: UInt64
    init(seed: UInt64) { state = seed }
    mutating func next() -> CGFloat {
        state &+= 0x9E3779B97F4A7C15
        var z = state
        z = (z ^ (z >> 30)) &* 0xBF58476D1CE4E5B9
        z = (z ^ (z >> 27)) &* 0x94D049BB133111EB
        z = z ^ (z >> 31)
        return CGFloat(z % 10_000) / 10_000
    }
}

// MARK: - Sketch card (白いカード + 手描きの枠 + ずれた影)

struct SketchCard: ViewModifier {
    var padding: CGFloat = 16
    var lineWidth: CGFloat = 1.6
    var fill: Color = Palette.paper
    var emphasized: Bool = false

    func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(
                ZStack {
                    // offset "double line" shadow seen in the design
                    Rectangle()
                        .fill(Palette.ink.opacity(0.9))
                        .offset(x: 3, y: 4)
                    Rectangle()
                        .fill(fill)
                    Rectangle()
                        .strokeBorder(Palette.ink, lineWidth: emphasized ? lineWidth + 1.2 : lineWidth)
                }
            )
    }
}

extension View {
    func sketchCard(padding: CGFloat = 16, emphasized: Bool = false, fill: Color = Palette.paper) -> some View {
        modifier(SketchCard(padding: padding, fill: fill, emphasized: emphasized))
    }

    /// Marker highlight drawn behind text (半透明の蛍光ペン).
    func marker(_ color: Color, height: CGFloat = 10, yOffset: CGFloat = 6) -> some View {
        background(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 2)
                .fill(color)
                .frame(height: height)
                .offset(y: yOffset)
                .padding(.horizontal, -3)
        }
    }
}

// MARK: - Buttons & chips

/// Solid green button with the sketchy offset shadow (「はじめる →」).
struct GreenButtonStyle: ButtonStyle {
    var fullWidth: Bool = true
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(LFont.heading(15))
            .foregroundStyle(.white)
            .padding(.vertical, 11)
            .padding(.horizontal, 18)
            .frame(maxWidth: fullWidth ? .infinity : nil)
            .background(
                ZStack {
                    Rectangle().fill(Palette.ink).offset(x: 3, y: 3)
                    Rectangle().fill(configuration.isPressed ? Palette.greenDark : Palette.green)
                    Rectangle().strokeBorder(Palette.ink, lineWidth: 1.4)
                }
            )
            .opacity(configuration.isPressed ? 0.9 : 1)
    }
}

/// White outlined button (「思い出せなかった」「閉じる」).
struct OutlineButtonStyle: ButtonStyle {
    var fullWidth: Bool = true
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(LFont.heading(15))
            .foregroundStyle(Palette.text)
            .padding(.vertical, 11)
            .padding(.horizontal, 18)
            .frame(maxWidth: fullWidth ? .infinity : nil)
            .background(
                ZStack {
                    Rectangle().fill(Palette.ink).offset(x: 3, y: 3)
                    Rectangle().fill(configuration.isPressed ? Palette.cream : Palette.paper)
                    Rectangle().strokeBorder(Palette.ink, lineWidth: 1.4)
                }
            )
    }
}

/// Small selectable chip (「すべて 60」「子音」「入門」…).
struct SketchChip: View {
    let title: String
    var selected: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(LFont.heading(13))
                .foregroundStyle(selected ? .white : Palette.text)
                .padding(.vertical, 6)
                .padding(.horizontal, 12)
                .background(
                    ZStack {
                        Rectangle().fill(Palette.ink).offset(x: 2, y: 2)
                        Rectangle().fill(selected ? Palette.green : Palette.paper)
                        Rectangle().strokeBorder(Palette.ink, lineWidth: 1.2)
                    }
                )
        }
        .buttonStyle(.plain)
    }
}

/// Tiny outlined label (level badges 「入門」, key-expression chips).
struct SketchTag: View {
    let text: String
    var fill: Color = Palette.paper
    var body: some View {
        Text(text)
            .font(LFont.caption(11))
            .foregroundStyle(Palette.text)
            .padding(.vertical, 3)
            .padding(.horizontal, 7)
            .background(
                ZStack {
                    Rectangle().fill(Palette.ink).offset(x: 1.5, y: 1.5)
                    Rectangle().fill(fill)
                    Rectangle().strokeBorder(Palette.ink, lineWidth: 1)
                }
            )
    }
}

/// Speaker icon button used next to every Cantonese string.
struct SpeakerButton: View {
    let text: String
    var size: CGFloat = 14
    var color: Color = Palette.green
    var body: some View {
        Button {
            SpeechManager.shared.speak(text)
        } label: {
            Image(systemName: "speaker.wave.2")
                .font(.system(size: size, weight: .semibold))
                .foregroundStyle(color)
                .padding(4)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

/// Dashed hand-drawn divider.
struct SketchDivider: View {
    var dashed: Bool = false
    var body: some View {
        Rectangle()
            .fill(Palette.ink.opacity(dashed ? 0.0 : 0.85))
            .frame(height: 1.4)
            .overlay {
                if dashed {
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 1.2, dash: [4, 4]))
                        .foregroundStyle(Palette.ink.opacity(0.35))
                }
            }
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.move(to: CGPoint(x: rect.minX, y: rect.midY))
        p.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return p
    }
}

// MARK: - Screen scaffolding shared by the sub screens

/// 「‹ ホーム」 back chip + the small birds doodle on the right.
struct ScreenTopBar: View {
    var backTitle: String = "ホーム"
    var onBack: () -> Void
    var body: some View {
        HStack {
            Button(action: onBack) {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 12, weight: .bold))
                    Text(backTitle)
                        .font(LFont.heading(15))
                }
                .foregroundStyle(Palette.text)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(
                    ZStack {
                        Rectangle().fill(Palette.ink).offset(x: 2, y: 2)
                        Rectangle().fill(Palette.paper)
                        Rectangle().strokeBorder(Palette.ink, lineWidth: 1.3)
                    }
                )
            }
            .buttonStyle(.plain)
            Spacer()
            Image("birds")
                .resizable()
                .scaledToFit()
                .frame(height: 22)
                .padding(.trailing, 12)
                .floating(amplitude: 3, duration: 2.8, rotate: 2)
        }
    }
}

/// The big title card at the top of each screen: title with a marker,
/// two-line tagline and an illustration on the right.
struct ScreenHeaderCard: View {
    let title: String
    let tagline: String
    let image: String
    var markerColor: Color = Palette.markerGreen
    var imageHeight: CGFloat = 86

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(LFont.title(26))
                    .foregroundStyle(Palette.text)
                    .marker(markerColor, height: 11, yOffset: 4)
                if !tagline.isEmpty {
                    Text(tagline)
                        .font(LFont.heading(16))
                        .foregroundStyle(Palette.text)
                        .lineSpacing(5)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            Spacer(minLength: 4)
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: imageHeight)
                .floating(amplitude: 4, duration: 3.4, rotate: 1.5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .sketchCard(padding: 18)
    }
}

/// Section label drawn as a small white tag (「音声」「学習メニュー」).
struct SectionLabel: View {
    let text: String
    var body: some View {
        Text(text)
            .font(LFont.heading(14))
            .foregroundStyle(Palette.text)
            .padding(.vertical, 4)
            .padding(.horizontal, 10)
            .background(Palette.paper.opacity(0.9))
            .overlay(alignment: .bottom) {
                Rectangle().fill(Palette.markerGreen).frame(height: 3)
            }
    }
}

/// Stage dots ●●○○ shown on review rows.
struct StageDots: View {
    let stage: Int
    var size: CGFloat = 9
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<4, id: \.self) { i in
                Circle()
                    .fill(i <= stage ? ReviewStage(rawValue: i)!.color : Color.clear)
                    .overlay(Circle().stroke(Palette.ink.opacity(0.7), lineWidth: 1))
                    .frame(width: size, height: size)
            }
        }
    }
}

/// Coloured dot + stage label (● 1日後).
struct StageBadge: View {
    let stage: ReviewStage
    var body: some View {
        HStack(spacing: 5) {
            Circle().fill(stage.color).frame(width: 9, height: 9)
            Text(stage.label)
                .font(LFont.caption(12))
                .foregroundStyle(Palette.text)
        }
    }
}

/// Search field in the sketch style.
struct SketchSearchField: View {
    let placeholder: String
    @Binding var text: String
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Palette.subText)
            TextField(placeholder, text: $text)
                .font(LFont.body(15))
                .foregroundStyle(Palette.text)
                .autocorrectionDisabled()
            if !text.isEmpty {
                Button { text = "" } label: {
                    Image(systemName: "xmark.circle.fill").foregroundStyle(Palette.faint)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .background(
            ZStack {
                Rectangle().fill(Palette.ink).offset(x: 2, y: 2)
                Rectangle().fill(Palette.paper)
                Rectangle().strokeBorder(Palette.ink, lineWidth: 1.3)
            }
        )
    }
}

/// Hand-drawn style check box.
struct SketchCheckbox: View {
    let checked: Bool
    var body: some View {
        ZStack {
            Rectangle().fill(Palette.paper)
            Rectangle().strokeBorder(Palette.ink, lineWidth: 1.4)
            if checked {
                Image(systemName: "checkmark")
                    .font(.system(size: 15, weight: .heavy))
                    .foregroundStyle(Palette.green)
            }
        }
        .frame(width: 24, height: 24)
    }
}

// MARK: - Date helpers

extension Date {
    var startOfDay: Date { Calendar.current.startOfDay(for: self) }
    func adding(days: Int) -> Date { Calendar.current.date(byAdding: .day, value: days, to: self) ?? self }
    var isToday: Bool { Calendar.current.isDateInToday(self) }

    /// 11月2日
    var shortJa: String {
        let f = DateFormatter(); f.locale = Locale(identifier: "ja_JP"); f.dateFormat = "M月d日"; return f.string(from: self)
    }
    /// 11月2日 月曜日
    var longJa: String {
        let f = DateFormatter(); f.locale = Locale(identifier: "ja_JP"); f.dateFormat = "M月d日 EEEE"; return f.string(from: self)
    }
    /// 11月2日（月）
    var withWeekdayJa: String {
        let f = DateFormatter(); f.locale = Locale(identifier: "ja_JP"); f.dateFormat = "M月d日（E）"; return f.string(from: self)
    }
    /// 2026年 11月
    var yearMonthJa: String {
        let f = DateFormatter(); f.locale = Locale(identifier: "ja_JP"); f.dateFormat = "yyyy年 M月"; return f.string(from: self)
    }
    /// 火
    var weekdayJa: String {
        let f = DateFormatter(); f.locale = Locale(identifier: "ja_JP"); f.dateFormat = "E"; return f.string(from: self)
    }
}

// MARK: - Motion (ゆっくり動く挿絵・雲)

/// Gentle up-and-down bob, like a sketch floating on paper. Each view gets
/// its own phase so illustrations don't move in lockstep.
struct FloatingModifier: ViewModifier {
    var amplitude: CGFloat = 5
    var duration: Double = 3.2
    var delay: Double = 0
    var rotate: Double = 0
    @State private var up = false

    func body(content: Content) -> some View {
        content
            .offset(y: up ? -amplitude : amplitude)
            .rotationEffect(.degrees(up ? -rotate : rotate))
            .onAppear {
                withAnimation(.easeInOut(duration: duration).repeatForever(autoreverses: true).delay(delay)) {
                    up = true
                }
            }
    }
}

extension View {
    func floating(amplitude: CGFloat = 5, duration: Double = 3.2, delay: Double = 0, rotate: Double = 0) -> some View {
        modifier(FloatingModifier(amplitude: amplitude, duration: duration, delay: delay, rotate: rotate))
    }
}

/// A cloud that drifts slowly across the full width and wraps around.
struct DriftingCloud: View {
    var image: String = "cloud_big"
    var height: CGFloat = 40
    var y: CGFloat = 60
    var duration: Double = 38
    var startFraction: Double = 0
    var opacity: Double = 0.95

    var body: some View {
        GeometryReader { geo in
            TimelineView(.animation(minimumInterval: 1.0 / 30)) { context in
                let t = context.date.timeIntervalSinceReferenceDate / duration + startFraction
                let f = t - floor(t)                              // 0 … 1
                let x = -height * 2 + CGFloat(f) * (geo.size.width + height * 4)
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: height)
                    .opacity(opacity)
                    .position(x: x, y: y + CGFloat(sin(t * 2 * .pi * 3)) * 4)
            }
        }
        .allowsHitTesting(false)
    }
}


// MARK: - 学習時間の計測（学習画面に付ける）

struct StudyScreenModifier: ViewModifier {
    @EnvironmentObject var store: WordStore
    func body(content: Content) -> some View {
        content
            .onAppear { store.studyScreenAppeared() }
            .onDisappear { store.studyScreenDisappeared() }
    }
}

extension View {
    /// Marks a screen whose time counts toward 本日の学習時間.
    func studyScreen() -> some View { modifier(StudyScreenModifier()) }
}
