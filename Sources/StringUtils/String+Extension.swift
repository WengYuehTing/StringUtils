//
//  String+Extension.swift
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


/// Returns the results of regular expression matching.
extension String {
    
    public func matches(withPattern pattern: String, options: NSRegularExpression.Options = []) -> [[String]] {
        return matches(withPattern: pattern, inRange: NSRange(startIndex..., in: self), options: options)
    }
    
    public func matches(withPattern pattern: String, options: NSRegularExpression.Options = []) -> Bool {
        return matches(withPattern: pattern, inRange: NSRange(startIndex..., in: self), options: options)
    }
    
    public func firstMatch(withPattern pattern: String, options: NSRegularExpression.Options = [], matchOptions: NSRegularExpression.MatchingOptions = []) -> String {
        return firstMatch(withPattern: pattern, inRange: NSRange(startIndex..., in: self), options: options, matchOptions: matchOptions)
    }
    
    public func numbersOfMatches(withPattern pattern: String, options: NSRegularExpression.Options = [], matchOptions: NSRegularExpression.MatchingOptions = []) -> Int {
        return numbersOfMatches(withPattern: pattern, inRange: NSRange(startIndex..., in: self), options: options, matchOptions: matchOptions)
    }
    
    public func replaceMatches(withPattern pattern: String, byTemplate template: String, options: NSRegularExpression.Options = [], matchOptions: NSRegularExpression.MatchingOptions = []) -> String {
        return replaceMatches(withPattern: pattern, byTemplate: template, inRange: NSRange(startIndex..., in: self), options: options, matchOptions: matchOptions)
    }
    
    public func matches(withPattern pattern: String, inRange range: NSRange, options: NSRegularExpression.Options = []) -> [[String]] {
        guard let expression = try? NSRegularExpression(pattern: pattern, options: options) else {
            return []
        }
        
        let matches = expression.matches(in: self, range: range)
        return matches.map { match in
            return (0 ..< match.numberOfRanges).map {
                let rangeBounds = match.range(at: $0)
                guard let range = Range(rangeBounds, in: self) else {
                    return ""
                }
                
                return String(self[range])
            }
        }
    }
    
    public func matches(withPattern pattern: String, inRange range: NSRange, options: NSRegularExpression.Options = []) -> Bool {
        guard let expression = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        
        let matches = expression.matches(in: self, range: range)
        return !matches.isEmpty
    }
    
    public func firstMatch(withPattern pattern: String, inRange range: NSRange, options: NSRegularExpression.Options = [], matchOptions: NSRegularExpression.MatchingOptions = []) -> String {
        guard let expression = try? NSRegularExpression(pattern: pattern, options: options),
              let match = expression.firstMatch(in: self, options: matchOptions, range: range)else {
            return ""
        }
        
        guard match.numberOfRanges > 0 else {
            return ""
        }
        
        let outRange = match.range(at: 0)
        return self[outRange.lowerBound ..< outRange.upperBound]
    }
    
    public func numbersOfMatches(withPattern pattern: String, inRange range: NSRange, options: NSRegularExpression.Options = [], matchOptions: NSRegularExpression.MatchingOptions = []) -> Int {
        guard let expression = try? NSRegularExpression(pattern: pattern, options: options) else {
            return 0
        }
        
        return expression.numberOfMatches(in: self, options: matchOptions, range: range)
    }
    
    public func replaceMatches(withPattern pattern: String, byTemplate template: String, inRange range: NSRange, options: NSRegularExpression.Options = [], matchOptions: NSRegularExpression.MatchingOptions = []) -> String {
        guard let expression = try? NSRegularExpression(pattern: pattern, options: options) else {
            return ""
        }
        
        let mString = NSMutableString(string: self)
        expression.replaceMatches(in: mString, options: matchOptions, range: range, withTemplate: template)
        return String(mString)
    }
}

extension String {
    
    func trim(character: CharacterSet = .whitespacesAndNewlines) -> String {
        return self.trimmingCharacters(in: character)
    }
}
