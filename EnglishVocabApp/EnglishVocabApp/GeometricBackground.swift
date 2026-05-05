import SwiftUI

/// White-based "solar system" backdrop drawn entirely in soft greys: a
/// subtly pulsing central sun, concentric orbital rings, planets orbiting
/// at different speeds, and a faint scattering of dot "stars". Pure
/// SwiftUI + TimelineView so it stays cheap when idle.
struct GeometricBackground: View {
    var body: some View {
        TimelineView(.animation) { context in
            let t = context.date.timeIntervalSinceReferenceDate
            GeometryReader { geo in
                let center = CGPoint(x: geo.size.width / 2, y: geo.size.height / 2)
                ZStack {
                    // White base
                    Color.white

                    // Faint gray dots scattered across the canvas
                    starField(t: t, size: geo.size)

                    // Concentric orbit rings
                    orbits(center: center, in: geo.size)

                    // Pulsing gray sun in the center
                    sun(t: t)
                        .position(center)

                    // Planets traveling along the orbits
                    planets(t: t, center: center)
                }
            }
        }
    }

    // MARK: - Layers

    private func starField(t: TimeInterval, size: CGSize) -> some View {
        Canvas { ctx, _ in
            for i in 0..<60 {
                let xSeed = Double((i * 97 + 13) % 1000) / 1000.0
                let ySeed = Double((i * 53 + 41) % 1000) / 1000.0
                let x = CGFloat(xSeed) * size.width
                let y = CGFloat(ySeed) * size.height
                let twinkle = 0.10 + (sin(t * 1.0 + Double(i) * 0.7) + 1) * 0.06
                let r: CGFloat = CGFloat(0.7 + Double(i % 3) * 0.4)
                ctx.opacity = max(0, twinkle)
                ctx.fill(
                    Path(ellipseIn: CGRect(x: x - r, y: y - r, width: r * 2, height: r * 2)),
                    with: .color(.black)
                )
            }
        }
        .allowsHitTesting(false)
    }

    private func orbits(center: CGPoint, in size: CGSize) -> some View {
        ZStack {
            ForEach(1...5, id: \.self) { i in
                Circle()
                    .stroke(Color.black.opacity(0.10), lineWidth: 0.6)
                    .frame(
                        width: CGFloat(i) * 120,
                        height: CGFloat(i) * 120
                    )
                    .position(center)
            }
        }
        .frame(width: size.width, height: size.height, alignment: .center)
    }

    private func sun(t: TimeInterval) -> some View {
        let pulse = CGFloat(1.0 + sin(t * 1.6) * 0.06)
        return ZStack {
            // Soft outer halo
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color.black.opacity(0.18), Color.black.opacity(0)],
                        center: .center,
                        startRadius: 4,
                        endRadius: 90
                    )
                )
                .frame(width: 220, height: 220)
            // Core
            Circle()
                .fill(Color.black.opacity(0.55))
                .frame(width: 22, height: 22)
        }
        .scaleEffect(pulse)
    }

    private func planets(t: TimeInterval, center: CGPoint) -> some View {
        ZStack {
            ForEach(1...5, id: \.self) { i in
                planet(index: i, t: t)
                    .position(center)
            }
        }
        .allowsHitTesting(false)
    }

    @ViewBuilder
    private func planet(index i: Int, t: TimeInterval) -> some View {
        let radius: CGFloat = CGFloat(i) * 60
        let speed: Double = 0.6 / Double(i)
        let phase: Double = Double(i) * 1.7
        let angle = t * speed + phase
        let x = CGFloat(cos(angle)) * radius
        let y = CGFloat(sin(angle)) * radius

        let diameter: CGFloat = CGFloat(8 + (i % 3) * 3)
        let opacity: Double = 0.30 + Double(i % 3) * 0.10

        Circle()
            .fill(Color.black.opacity(opacity))
            .frame(width: diameter, height: diameter)
            .offset(x: x, y: y)
    }
}
