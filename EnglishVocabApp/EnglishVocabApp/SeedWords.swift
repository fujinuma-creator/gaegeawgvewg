import Foundation

/// The built-in vocabulary: every `make(...)` entry in `SeedData`, given a
/// stable id so progress can be saved against it. The id is "s:" + the
/// English spelling; the rare duplicate spelling gets "#2", "#3" … appended
/// so no two entries share an id.
enum SeedWords {
    static let all: [Word] = {
        var seen: [String: Int] = [:]
        var out = SeedData.additionalWords
        out.reserveCapacity(out.count)
        for i in out.indices {
            let key = out[i].word
            let n = (seen[key] ?? 0) + 1
            seen[key] = n
            out[i].id = n == 1 ? "s:\(key)" : "s:\(key)#\(n)"
        }
        return out
    }()

    /// Quick lookup by English spelling (case-insensitive), used by the
    /// pronunciation screen to attach IPA and meaning to example words.
    static let byWord: [String: Word] = {
        var d: [String: Word] = [:]
        d.reserveCapacity(all.count)
        for w in all where d[w.word.lowercased()] == nil { d[w.word.lowercased()] = w }
        return d
    }()
}
