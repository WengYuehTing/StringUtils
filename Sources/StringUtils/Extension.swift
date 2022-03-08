//
//  Extension.swift
//  
//
//  Created by YueTing Weng on 2022/3/2.
//

import Foundation


/// Using String[offset:] or String[range:] to access character
/// or sub-string like array style. Note that the app would crash
/// if the given offset or index is out of bound.
extension String {
    
    public subscript (offset: Int) -> String {
        return String(self[index(startIndex, offsetBy: offset)])
    }

    public subscript (range: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(count, range.lowerBound)), upper: min(count, max(0, range.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

/// Returns a part of the string with the given begin and
/// end indexes or range.
extension String {

    public func subString(fromIndex index: Int) -> String {
        return self[min(index, count) ..< count]
    }

    public func subString(toIndex index: Int) -> String {
        return self[0 ..< max(0, index)]
    }
    
    public func subString(fromIndex from: Int, toIndex to: Int) -> String {
        return self[min(from, count) ..< max(0, to)]
    }
    
    public func subString(fromRange range: Range<Int>) -> String {
        return self[range]
    }
}


/// Returns an array containing substrings from the receiver
/// that have been divided by a given separator.
extension String {
    
    public func split(_ separator: String) -> [String] {
        return self.components(separatedBy: separator)
    }
    
    public func split(_ separator: CharacterSet) -> [String] {
        return self.components(separatedBy: separator)
    }
}

/// Returns a new string made by removing from both ends of
/// the receiver characters contained in a given character set.
extension String {
    
    public func trim(_ cset: CharacterSet = .whitespacesAndNewlines) -> String {
        return self.trimmingCharacters(in: cset)
    }
    
    public func rtrim(_ cset : CharacterSet = .whitespacesAndNewlines) -> String {
        if let range = rangeOfCharacter(from: cset, options: [.anchored, .backwards]) {
            return String(self[..<range.lowerBound]).rtrim(cset)
        }
        
        return self
    }
    
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
    
    public func replace(ofTarget target: String, with replacement: String) -> String {
        return replacingOccurrences(of: target, with: replacement)
    }
    
    public func replace(inRange range: Range<String.Index>, with replacement: String) -> String {
        return replacingCharacters(in: range, with: replacement)
    }
    
    public func replace(inRange range: Range<Int>, with replacement: String) -> String {
        let lowerBound = index(startIndex, offsetBy: range.lowerBound)
        let upperbound = index(startIndex, offsetBy: range.upperBound)
        return replacingCharacters(in: Range<String.Index>(uncheckedBounds: (lowerBound, upperbound)), with: replacement)
    }
}


extension String {
    
    func reversed() -> String {
        let reversedString: [Character] = self.reversed()
        return String(reversedString)
    }
}


