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
    /// - Parameter offset: the n-th character of receiver.
    public subscript (offset: Int) -> String {
        return String(self[index(startIndex, offsetBy: offset)])
    }

    /// Returns a substring at a given range of the receiver.
    ///
    /// - Parameter range: the substring range of the receiver.
    public subscript (range: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(count, range.lowerBound)), upper: min(count, max(0, range.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

extension String {

    /// Returns a substring from the receiver.
    ///
    /// - Parameter index: the started index to the end.
    public func subString(fromIndex index: Int) -> String {
        return self[min(index, count) ..< count]
    }

    /// Returns a substring from the receiver.
    ///
    /// - Parameter index: the first index to the ended index.
    public func subString(toIndex index: Int) -> String {
        return self[0 ..< max(0, index)]
    }
    
    /// Returns a substring from the receiver.
    ///
    /// - Parameters:
    ///   - from: the started index.
    ///   - to: the ended index.
    public func subString(fromIndex from: Int, toIndex to: Int) -> String {
        return self[min(from, count) ..< max(0, to)]
    }
}

extension String {
    
    /// Returns an array containing substrings from the receiver
    ///
    /// - Parameter separator: the separator string.
    public func split(_ separator: String) -> [String] {
        return self.components(separatedBy: separator)
    }
    
    /// Returns an array containing substrings from the receiver
    ///
    /// - Parameter separator: the separator character set.
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
    /// - Parameter cset: the character set to remove.
    public func trim(_ cset: CharacterSet = .whitespacesAndNewlines) -> String {
        return self.trimmingCharacters(in: cset)
    }
    
    /// Returns a new string made by removing only trailing of the receiver chracters
    /// contained in a given character set.
    ///
    /// - Parameter cset: the character set to remove.
    public func rtrim(_ cset : CharacterSet = .whitespacesAndNewlines) -> String {
        if let range = rangeOfCharacter(from: cset, options: [.anchored, .backwards]) {
            return String(self[..<range.lowerBound]).rtrim(cset)
        }
        
        return self
    }
    
    /// Returns a new string made by removing only leading of the receiver chracters
    /// contained in a given character set.
    ///
    /// - Parameter cset: the character set from which the receiver to remove.
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
    ///   - target: the string to replace.
    ///   - replacement: the string with which to replace target.
    public func replace(ofTarget target: String, with replacement: String) -> String {
        return replacingOccurrences(of: target, with: replacement)
    }
    
    /// Returns a new string in which the characters in a specified range of the receiver
    /// are replaced by a given string.
    ///
    /// - Parameters:
    ///   - range: a `String.Index` range of characters in the receiver.
    ///   - replacement: the string with which to replace target in range.
    public func replace(inRange range: Range<String.Index>, with replacement: String) -> String {
        return replacingCharacters(in: range, with: replacement)
    }
    
    /// Returns a new string in which the characters in a specified range of the receiver
    /// are replaced by a given string.
    ///
    /// - Parameters:
    ///   - range: a `Int` range of characters in the receiver.
    ///   - replacement: the string with which to replace target in range.
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


