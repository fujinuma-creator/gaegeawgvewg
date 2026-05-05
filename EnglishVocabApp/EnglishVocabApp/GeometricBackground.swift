import SwiftUI

/// Soft, monochrome geometric pattern that drifts and rotates slowly.
/// Pure SwiftUI — no images, no GPU-heavy effects. Designed to sit
/// behind translucent or system-colored cards in any tab.
struct GeometricBackground: View {
    var body: some View {
        TimelineView(.animation) { context in
            let t = context.date.timeIntervalSinceReferenceDate
            ZStack {
                // Use a very light gray base so the existing white card
                // backgrounds in the rest of the app still pop visually.
                Color(.systemGroupedBackground)
                concentricCircles(t: t)
                rotatingPolygons(t: t)
                gridLines(t: t)
                drifters(t: t)
            }
        }
    }

    private func concentricCircles(t: TimeInterval) -> some View {
        ZStack {
            ForEach(0..<10, id: \.self) { i in
                Circle()
                    .stroke(Color.black.opacity(0.05), lineWidth: 0.6)
                    .frame(width: CGFloat(80 + i * 50), height: CGFloat(80 + i * 50))
                    .offset(
                        x: CGFloat(sin(t * 0.18 + Double(i) * 0.6) * 28),
                        y: CGFloat(cos(t * 0.14 + Double(i) * 0.45) * 22)
                    )
            }
        }
    }

    private func rotatingPolygons(t: TimeInterval) -> some View {
        ZStack {
            ForEach(0..<3, id: \.self) { i in
                GeometricPolygon(sides: 6)
                    .stroke(Color.black.opacity(0.08), lineWidth: 0.8)
                    .frame(width: CGFloat(220 + i * 120), height: CGFloat(220 + i * 120))
                    .rotationEffect(.degrees(t * (4 + Double(i) * 1.5)))
                    .opacity(0.9)
            }
            ForEach(0..<2, id: \.self) { i in
                GeometricPolygon(sides: 3)
                    .stroke(Color.black.opacity(0.07), lineWidth: 0.8)
                    .frame(width: CGFloat(180 + i * 80), height: CGFloat(180 + i * 80))
                    .rotationEffect(.degrees(-t * (3 + Double(i) * 1.2)))
            }
        }
    }

    private func gridLines(t: TimeInterval) -> some View {
        Canvas { ctx, size in
            let drift = CGFloat((sin(t * 0.05) + 1) * 20)
            let step: CGFloat = 60
            ctx.opacity = 0.04
            for x in stride(from: 0 - drift, through: size.width + step, by: step) {
                var path = Path()
                path.move(to: CGPoint(x: x, y: 0))
                path.addLine(to: CGPoint(x: x, y: size.height))
                ctx.stroke(path, with: .color(.black), lineWidth: 0.5)
            }
            for y in stride(from: 0 - drift, through: size.height + step, by: step) {
                var path = Path()
                path.move(to: CGPoint(x: 0, y: y))
                path.addLine(to: CGPoint(x: size.width, y: y))
                ctx.stroke(path, with: .color(.black), lineWidth: 0.5)
            }
        }
    }

    private func drifters(t: TimeInterval) -> some View {
        Canvas { ctx, size in
            let centerX = size.width / 2
            let centerY = size.height / 2
            for i in 0..<14 {
                let phase = Double(i) * 0.7
                let radius = 80 + Double(i) * 18
                let x = centerX + CGFloat(cos(t * 0.25 + phase) * radius)
                let y = centerY + CGFloat(sin(t * 0.18 + phase * 1.2) * radius)
                let r: CGFloat = CGFloat(2 + (i % 3))
                let rect = CGRect(x: x - r, y: y - r, width: r * 2, height: r * 2)
                ctx.fill(Path(ellipseIn: rect), with: .color(Color.black.opacity(0.18)))
            }
        }
    }
}

struct GeometricPolygon: Shape {
    let sides: Int

    func path(in rect: CGRect) -> Path {
        var path = Path()
        guard sides >= 3 else { return path }
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        for i in 0..<sides {
            let angle = (Double(i) / Double(sides)) * .pi * 2 - .pi / 2
            let point = CGPoint(
                x: center.x + CGFloat(cos(angle)) * radius,
                y: center.y + CGFloat(sin(angle)) * radius
            )
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.closeSubpath()
        return path
    }
}
