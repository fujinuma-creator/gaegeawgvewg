import SwiftUI

/// White-based mathematical geometry: a faint dot-grid like math paper, a
/// Fibonacci-style spiral in the corner, rotating regular polygons, a clean
/// sun-and-rays at the centre, and planets travelling along orbital rings
/// with thin vector lines connecting each one back to the sun. Pure
/// SwiftUI + TimelineView so it costs nothing while the user is reading.
struct GeometricBackground: View {
    var body: some View {
        TimelineView(.animation) { context in
            let t = context.date.timeIntervalSinceReferenceDate
            GeometryReader { geo in
                let center = CGPoint(x: geo.size.width / 2, y: geo.size.height / 2.1)
                ZStack {
                    Color.white

                    // Math-paper dot grid
                    dotGrid(t: t, size: geo.size)

                    // Background rotating polygons (octagon + triangle)
                    rotatingPolygon(sides: 8, t: t, speed: 0.05, sizeMultiplier: 0.85, in: geo.size)
                    rotatingPolygon(sides: 3, t: t, speed: -0.07, sizeMultiplier: 0.55, in: geo.size)

                    // Concentric orbital rings
                    orbitalRings(center: center, count: 5)

                    // Vectors from sun to each planet
                    vectorLines(t: t, center: center, count: 5)

                    // Central sun
                    sun(t: t)
                        .position(center)

                    // Planets traveling along the orbits
                    planets(t: t, center: center, count: 5)

                    // Crisp Fibonacci spiral in a corner for a math-paper accent
                    FibonacciSpiral()
                        .stroke(Color.black.opacity(0.10), lineWidth: 0.7)
                        .frame(width: 220, height: 220)
                        .position(x: geo.size.width - 80, y: geo.size.height - 100)
                }
            }
        }
    }

    // MARK: - Layers

    private func dotGrid(t: TimeInterval, size: CGSize) -> some View {
        Canvas { ctx, _ in
            let step: CGFloat = 28
            let drift = CGFloat((sin(t * 0.05) + 1) * 6)
            ctx.opacity = 0.18
            for x in stride(from: -drift, through: size.width + step, by: step) {
                for y in stride(from: -drift, through: size.height + step, by: step) {
                    let r: CGFloat = 1.0
                    ctx.fill(
                        Path(ellipseIn: CGRect(x: x - r, y: y - r, width: r * 2, height: r * 2)),
                        with: .color(.black)
                    )
                }
            }
        }
        .allowsHitTesting(false)
    }

    private func rotatingPolygon(
        sides: Int,
        t: TimeInterval,
        speed: Double,
        sizeMultiplier: CGFloat,
        in size: CGSize
    ) -> some View {
        let dimension = min(size.width, size.height) * sizeMultiplier
        return GeometryPolygon(sides: sides)
            .stroke(Color.black.opacity(0.16), lineWidth: 0.8)
            .frame(width: dimension, height: dimension)
            .rotationEffect(.degrees(t * speed * 60))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func orbitalRings(center: CGPoint, count: Int) -> some View {
        ZStack {
            ForEach(1...count, id: \.self) { i in
                Circle()
                    .stroke(Color.black.opacity(0.18), lineWidth: 0.6)
                    .frame(width: CGFloat(i) * 110, height: CGFloat(i) * 110)
                    .position(center)
            }
        }
        .allowsHitTesting(false)
    }

    private func vectorLines(t: TimeInterval, center: CGPoint, count: Int) -> some View {
        Canvas { ctx, _ in
            for i in 1...count {
                let radius = Double(i) * 55
                let speed = 0.55 / Double(i)
                let phase = Double(i) * 1.7
                let angle = t * speed + phase
                let endX = center.x + CGFloat(cos(angle) * radius)
                let endY = center.y + CGFloat(sin(angle) * radius)
                var path = Path()
                path.move(to: center)
                path.addLine(to: CGPoint(x: endX, y: endY))
                ctx.stroke(path, with: .color(Color.black.opacity(0.18)), lineWidth: 0.6)
            }
        }
        .allowsHitTesting(false)
    }

    private func sun(t: TimeInterval) -> some View {
        let pulse = CGFloat(1.0 + sin(t * 1.6) * 0.05)
        return ZStack {
            // Soft halo
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color.black.opacity(0.18), Color.black.opacity(0)],
                        center: .center,
                        startRadius: 4,
                        endRadius: 80
                    )
                )
                .frame(width: 200, height: 200)
            // Eight thin rays
            ForEach(0..<8, id: \.self) { i in
                Capsule()
                    .fill(Color.black.opacity(0.35))
                    .frame(width: 1, height: 28)
                    .offset(y: -22)
                    .rotationEffect(.degrees(Double(i) * 45))
            }
            // Core
            Circle()
                .fill(Color.black.opacity(0.6))
                .frame(width: 18, height: 18)
        }
        .scaleEffect(pulse)
    }

    private func planets(t: TimeInterval, center: CGPoint, count: Int) -> some View {
        ZStack {
            ForEach(1...count, id: \.self) { i in
                planet(index: i, t: t)
                    .position(center)
            }
        }
        .allowsHitTesting(false)
    }

    @ViewBuilder
    private func planet(index i: Int, t: TimeInterval) -> some View {
        let radius: CGFloat = CGFloat(i) * 55
        let speed: Double = 0.55 / Double(i)
        let phase: Double = Double(i) * 1.7
        let angle = t * speed + phase
        let x = CGFloat(cos(angle)) * radius
        let y = CGFloat(sin(angle)) * radius

        let diameter: CGFloat = CGFloat(7 + (i % 3) * 3)
        let opacity: Double = 0.30 + Double(i % 3) * 0.10

        Circle()
            .fill(Color.black.opacity(opacity))
            .frame(width: diameter, height: diameter)
            .offset(x: x, y: y)
    }
}

// MARK: - Helper shapes

struct GeometryPolygon: Shape {
    let sides: Int
    func path(in rect: CGRect) -> Path {
        var path = Path()
        guard sides >= 3 else { return path }
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        for i in 0..<sides {
            let angle = (Double(i) / Double(sides)) * .pi * 2 - .pi / 2
            let p = CGPoint(
                x: center.x + CGFloat(cos(angle)) * radius,
                y: center.y + CGFloat(sin(angle)) * radius
            )
            if i == 0 { path.move(to: p) } else { path.addLine(to: p) }
        }
        path.closeSubpath()
        return path
    }
}

struct FibonacciSpiral: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let phi = 1.618
        var a: Double = 0
        var b: Double = 1
        var x = rect.midX
        var y = rect.midY
        var size = min(rect.width, rect.height) / 30
        path.move(to: CGPoint(x: x, y: y))
        var angle: Double = 0
        for _ in 0..<10 {
            let next = a + b
            a = b
            b = next
            let stepRadius = CGFloat(size * b)
            let endX = x + CGFloat(cos(angle)) * stepRadius
            let endY = y + CGFloat(sin(angle)) * stepRadius
            path.addQuadCurve(
                to: CGPoint(x: endX, y: endY),
                control: CGPoint(
                    x: x + CGFloat(cos(angle - .pi / 4)) * stepRadius,
                    y: y + CGFloat(sin(angle - .pi / 4)) * stepRadius
                )
            )
            x = endX
            y = endY
            angle += .pi / 2
            size *= CGFloat(1.0 / phi)
        }
        return path
    }
}
