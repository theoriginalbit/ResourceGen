import Foundation

/// String extension to add substring by Int (such as a[i-1])
private extension String {
    subscript(i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

private func levenshtein_distance(a: String, b: String) -> Int {
    // Check for empty strings first
    if a.count == 0 {
        return b.count
    }
    if b.count == 0 {
        return a.count
    }

    // Create an empty distance matrix with dimensions len(a)+1 x len(b)+1
    var dists = Array(repeating: Array(repeating: 0, count: b.count + 1), count: a.count + 1)

    // a's default distances are calculated by removing each character
    for i in 1 ... a.count {
        dists[i][0] = i
    }
    // b's default distances are calulated by adding each character
    for j in 1 ... b.count {
        dists[0][j] = j
    }

    // Find the remaining distances using previous distances
    for i in 1 ... a.count {
        for j in 1 ... b.count {
            // Calculate the substitution cost
            let cost = (a[i - 1] == b[j - 1]) ? 0 : 1

            dists[i][j] = min(
                // Removing a character from a
                dists[i - 1][j] + 1,
                // Adding a character to b
                dists[i][j - 1] + 1,
                // Substituting a character from a to b
                dists[i - 1][j - 1] + cost
            )
        }
    }

    return dists.last!.last!
}

extension String {
    func levenshteinDistance(to other: String) -> Int {
        return levenshtein_distance(a: self, b: other)
    }
}
