import Foundation

/// Deterministic random number generator used to produce a stable,
/// "rotates once per day" shuffle of the vocabulary list.
struct SeededGenerator: RandomNumberGenerator {
    private var state: UInt64

    init(seed: UInt64) {
        // Avoid degenerate state == 0; mix the seed.
        self.state = seed == 0 ? 0x9E3779B97F4A7C15 : seed
    }

    mutating func next() -> UInt64 {
        // Splitmix64 — short, fast, decent quality for shuffling.
        state &+= 0x9E3779B97F4A7C15
        var z = state
        z = (z ^ (z >> 30)) &* 0xBF58476D1CE4E5B9
        z = (z ^ (z >> 27)) &* 0x94D049BB133111EB
        return z ^ (z >> 31)
    }
}

extension Array {
    /// Shuffles the array deterministically using a seed derived from today's
    /// calendar day. The order stays the same all day and rotates at midnight
    /// (local time).
    func dailyShuffled(date: Date = Date()) -> [Element] {
        let startOfDay = Calendar.current.startOfDay(for: date)
        let seed = UInt64(bitPattern: Int64(startOfDay.timeIntervalSince1970))
        var gen = SeededGenerator(seed: seed)
        return shuffled(using: &gen)
    }
}
