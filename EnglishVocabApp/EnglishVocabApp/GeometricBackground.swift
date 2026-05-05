import SwiftUI

/// Monochrome "solar system" backdrop: a glowing white sun in the center,
/// concentric orbital rings, planets orbiting at different speeds, and a
/// scattering of subtle starfield specks. Pure SwiftUI, animated via
/// TimelineView so it costs nothing at rest.
struct GeometricBackground: View {
    var body: some View {
        TimelineView(.animation) { context in
            let t = context.date.timeIntervalSinceReferenceDate
            GeometryReader { geo in
                let center = CGPoint(x: geo.size.width / 2, y: geo.size.height / 2)
                ZStack {
                    // Deep-space base
                    Color.black

                    // Faint twinkling stars
                    starField(t: t, size: geo.size)

                    // Orbital rings
                    orbits(center: center, in: geo.size)

                    // Glowing central sun
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
            // Pseudo-random but stable layout: derive coords from indices.
            for i in 0..<80 {
                let xSeed = Double((i * 97 + 13) % 1000) / 1000.0
                let ySeed = Double((i * 53 + 41) % 1000) / 1000.0
                let x = CGFloat(xSeed) * size.width
                let y = CGFloat(ySeed) * size.height
                let twinkle = 0.3 + (sin(t * 1.3 + Double(i) * 0.7) + 1) * 0.25
                let r: CGFloat = CGFloat(0.8 + Double(i % 3) * 0.5)
                ctx.opacity = max(0, min(0.9, twinkle))
                ctx.fill(
                    Path(ellipseIn: CGRect(x: x - r, y: y - r, width: r * 2, height: r * 2)),
                    with: .color(.white)
                )
            }
        }
        .allowsHitTesting(false)
    }

    private func orbits(center: CGPoint, in size: CGSize) -> some View {
        ZStack {
            ForEach(1...5, id: \.self) { i in
                Circle()
                    .stroke(Color.white.opacity(0.10), lineWidth: 0.6)
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
        let pulse = CGFloat(1.0 + sin(t * 1.6) * 0.08)
        return ZStack {
            // Outer glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color.white.opacity(0.35), Color.white.opacity(0)],
                        center: .center,
                        startRadius: 6,
                        endRadius: 90
                    )
                )
                .frame(width: 220, height: 220)
            // Core
            Circle()
                .fill(Color.white)
                .frame(width: 26, height: 26)
                .shadow(color: .white.opacity(0.6), radius: 20)
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
        // Each planet has a different orbit radius, speed and starting angle.
        let radius: CGFloat = CGFloat(i) * 60
        let speed: Double = 0.6 / Double(i)             // outer planets are slower
        let phase: Double = Double(i) * 1.7
        let angle = t * speed + phase
        let x = CGFloat(cos(angle)) * radius
        let y = CGFloat(sin(angle)) * radius

        let diameter: CGFloat = CGFloat(8 + (i % 3) * 3)
        let opacity: Double = 0.6 + Double(i % 3) * 0.12

        Circle()
            .fill(Color.white.opacity(opacity))
            .frame(width: diameter, height: diameter)
            .shadow(color: .white.opacity(0.4), radius: 4)
            .offset(x: x, y: y)
    }
}
