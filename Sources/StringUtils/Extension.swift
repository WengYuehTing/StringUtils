//
//  Extension.swift
//  
//
//  Created by YueTing Weng on 2022/3/2.
//

import Foundation

extension String {
    
    /// Returns a string at n-th position of the receiver.
    ///
    /// Throw exception if the offset is out of bound.
    ///
    /// - Parameter offset: The n-th character of receiver.
    public subscript (offset: Int) -> String {
        return String(self[index(startIndex, offsetBy: offset)])
    }

    /// Returns a substring at a given range of the receiver.
    ///
    /// - Parameter range: The substring range of the receiver.
    public subscript (range: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(count, range.lowerBound)), upper: min(count, max(0, range.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

extension String {
    
    /// Inserts a new character at the specified position.
    ///
    /// - Parameters:
    ///   - character: The new character to insert into the string.
    ///   - i: A valid index of the string. If `i` is equal to the string's end
    ///     index, this methods appends `character` to the string.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the string.
    public mutating func insert(_ character: Character, at i: Int) {
        self.insert(character, at: index(startIndex, offsetBy: i))
    }
    
    /// Inserts a collection of characters at the specified position.
    ///
    /// - Parameters:
    ///   - string: A collection of `String` elements to insert into the string.
    ///   - i: A valid index of the string. If `i` is equal to the string's end
    ///     index, this methods appends the contents of `string` to the
    ///     string.
    ///
    /// - Complexity: O(*n*), where *n* is the combined length of receiver and `string`.
    public mutating func insert(_ string: String, at i: Int) {
        self.insert(contentsOf: string, at: index(startIndex, offsetBy: i))
    }
}

extension String {
    
    /// Removes and returns the character at the specified position.
    ///
    /// - Parameter i: The position of the character to remove. `i` must be a
    ///   valid index of the string that is not equal to the string's end index.
    /// - Returns: The character that was removed.
    public mutating func remove(at i: Int) -> Character {
        return self.remove(at: index(startIndex, offsetBy: i))
    }
    
    /// Removes the characters in the given range.
    ///
    /// - Parameter range: The range of the elements to remove. The upper and
    ///   lower bounds of `bounds` must be valid indices of the string and not
    ///   equal to the string's end index.
    public mutating func remove(range: Range<Int>) {
        let lowerBound = index(startIndex, offsetBy: range.lowerBound)
        let upperbound = index(startIndex, offsetBy: range.upperBound)
        self.removeSubrange(Range<String.Index>(uncheckedBounds: (lowerBound, upperbound)))
    }
}

extension String {

    /// Returns a substring from the receiver.
    ///
    /// - Parameter index: The started index to the end.
    public func subString(fromIndex index: Int) -> String {
        return self[min(index, count) ..< count]
    }

    /// Returns a substring from the receiver.
    ///
    /// - Parameter index: The first index to the ended index.
    public func subString(toIndex index: Int) -> String {
        return self[0 ..< max(0, index)]
    }
    
    /// Returns a substring from the receiver.
    ///
    /// - Parameters:
    ///   - from: The started index.
    ///   - to: The ended index.
    public func subString(fromIndex from: Int, toIndex to: Int) -> String {
        return self[min(from, count) ..< max(0, to)]
    }
}

extension String {
    
    /// Returns an array containing substrings from the receiver
    ///
    /// - Parameter separator: The separator string.
    public func split(_ separator: String) -> [String] {
        return self.components(separatedBy: separator)
    }
    
    /// Returns an array containing substrings from the receiver
    ///
    /// - Parameter separator: The separator character set.
    public func split(_ separator: CharacterSet) -> [String] {
        return self.components(separatedBy: separator)
    }
}

/// Returns a new string made by removing from both ends of
/// the receiver characters contained in a given character set.
extension String {
    
    /// Returns a new string made by removing from both ends of the receiver chracters
    /// contained in a given character set.
    ///
    /// - Parameter cset: The character set to remove.
    public func trim(_ cset: CharacterSet = .whitespacesAndNewlines) -> String {
        return self.trimmingCharacters(in: cset)
    }
    
    /// Returns a new string made by removing only trailing of the receiver chracters
    /// contained in a given character set.
    ///
    /// - Parameter cset: The character set to remove.
    public func rtrim(_ cset : CharacterSet = .whitespacesAndNewlines) -> String {
        if let range = rangeOfCharacter(from: cset, options: [.anchored, .backwards]) {
            return String(self[..<range.lowerBound]).rtrim(cset)
        }
        
        return self
    }
    
    /// Returns a new string made by removing only leading of the receiver chracters
    /// contained in a given character set.
    ///
    /// - Parameter cset: The character set from which the receiver to remove.
    public func ltrim(_ cset : CharacterSet = .whitespacesAndNewlines) -> String {
        for (i, c) in self.enumerated() {
            if !cset.isSuperset(of: CharacterSet(charactersIn: String(c))) {
                return self[i ..< count]
            }
        }
        
        return self
    }
}

extension String {
    
    /// Returns a new string in which all occurrences of a target string in the receiver
    /// are replaced by another given string.
    ///
    /// - Parameters:
    ///   - target: The string to replace.
    ///   - replacement: The string with which to replace target.
    public func replace(ofTarget target: String, with replacement: String) -> String {
        return replacingOccurrences(of: target, with: replacement)
    }
    
    /// Returns a new string in which the characters in a specified range of the receiver
    /// are replaced by a given string.
    ///
    /// - Parameters:
    ///   - range: A `String.Index` range of characters in the receiver.
    ///   - replacement: The string with which to replace target in range.
    public func replace(inRange range: Range<String.Index>, with replacement: String) -> String {
        return replacingCharacters(in: range, with: replacement)
    }
    
    /// Returns a new string in which the characters in a specified range of the receiver
    /// are replaced by a given string.
    ///
    /// - Parameters:
    ///   - range: A `Int` range of characters in the receiver.
    ///   - replacement: The string with which to replace target in range.
    public func replace(inRange range: Range<Int>, with replacement: String) -> String {
        let lowerBound = index(startIndex, offsetBy: range.lowerBound)
        let upperbound = index(startIndex, offsetBy: range.upperBound)
        return replacingCharacters(in: Range<String.Index>(uncheckedBounds: (lowerBound, upperbound)), with: replacement)
    }
}

extension String {
    
    /// Returns a new string with reversed order.
    func reversed() -> String {
        let reversedString: [Character] = self.reversed()
        return String(reversedString)
    }
}


