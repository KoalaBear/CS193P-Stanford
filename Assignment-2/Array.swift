//
//  Array.swift
//  CS193P-Memorize-AS1
//
//  Created by TheKoalaBear on 24/06/2021.
//

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var uniquesArray = [Element]()
        for element in self {
            if !uniquesArray.contains(element) {
                uniquesArray.append(element)
            }
        }
        return uniquesArray
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
