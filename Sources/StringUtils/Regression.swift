//
//  Regression.swift
//  
//
//  Created by YueTing Weng on 2022/3/8.
//

import Foundation

extension String {
    
    /// Returns an array containing all the matches of the regular expression in the string.
    ///
    /// - Parameters:
    ///   - pattern: The string to search.
    ///   - range: The specified range of string to search.
    ///   - options: The regular expression options that are applied to the expression during matching
    ///   - matchingOptions: The matching options to use.
    public func matches(withPattern pattern: String, inRange range: NSRange, options: NSRegularExpression.Options = [], matchingOptions: NSRegularExpression.MatchingOptions = []) -> [[String]] {
        guard let expression = try? NSRegularExpression(pattern: pattern, options: options) else {
            return []
        }
        
        let matches = expression.matches(in: self, options: matchingOptions, range: range)
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
    
    /// Returns true if there are any matches of the regular expression in the string.
    ///
    /// - Parameters:
    ///   - pattern: The string to search.
    ///   - range: The specified range of string to search.
    ///   - options: The regular expression options that are applied to the expression during matching
    ///   - matchingOptions: The matching options to use.
    public func matches(withPattern pattern: String, inRange range: NSRange, options: NSRegularExpression.Options = [], matchingOptions: NSRegularExpression.MatchingOptions = [] ) -> Bool {
        guard let expression = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        
        let matches = expression.matches(in: self, options: matchingOptions, range: range)
        return !matches.isEmpty
    }
    
    /// Returns the first match of the regular expression in the string.
    ///
    /// - Parameters:
    ///   - pattern: The string to search.
    ///   - range: The specified range of string to search.
    ///   - options: The regular expression options that are applied to the expression during matching
    ///   - matchingOptions: The matching options to use.
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
    
    /// Returns an interget indicating the numbers of matches of the regular expression in the string.
    ///
    /// - Parameters:
    ///   - pattern: The string to search.
    ///   - range: The specified range of string to search.
    ///   - options: The regular expression options that are applied to the expression during matching
    ///   - matchingOptions: The matching options to use.
    public func numbersOfMatches(withPattern pattern: String, inRange range: NSRange, options: NSRegularExpression.Options = [], matchOptions: NSRegularExpression.MatchingOptions = []) -> Int {
        guard let expression = try? NSRegularExpression(pattern: pattern, options: options) else {
            return 0
        }
        
        return expression.numberOfMatches(in: self, options: matchOptions, range: range)
    }
    
    /// Returns a new string which replaces regular expression matches within the mutable string using the template string.
    ///
    /// - Parameters:
    ///   - pattern: The string to search.
    ///   - range: The specified range of string to search.
    ///   - options: The regular expression options that are applied to the expression during matching
    ///   - matchingOptions: The matching options to use.
    public func replaceMatches(withPattern pattern: String, byTemplate template: String, inRange range: NSRange, options: NSRegularExpression.Options = [], matchOptions: NSRegularExpression.MatchingOptions = []) -> String {
        guard let expression = try? NSRegularExpression(pattern: pattern, options: options) else {
            return ""
        }
        
        let mString = NSMutableString(string: self)
        expression.replaceMatches(in: mString, options: matchOptions, range: range, withTemplate: template)
        return String(mString)
    }
    
    /// Returns an array containing all the matches of the regular expression in the string.
    ///
    /// - Parameters:
    ///   - pattern: The string to search.
    ///   - options: The regular expression options that are applied to the expression during matching
    ///   - matchingOptions: The matching options to use.
    public func matches(withPattern pattern: String, options: NSRegularExpression.Options = [], matchingOptions: NSRegularExpression.MatchingOptions = []) -> [[String]] {
        return matches(withPattern: pattern, inRange: NSRange(startIndex..., in: self), options: options, matchingOptions: matchingOptions)
    }
    
    /// Returns true if there are any matches of the regular expression in the string.
    ///
    /// - Parameters:
    ///   - pattern: The string to search.
    ///   - options: The regular expression options that are applied to the expression during matching
    ///   - matchingOptions: The matching options to use.
    public func matches(withPattern pattern: String, options: NSRegularExpression.Options = [], matchingOptions: NSRegularExpression.MatchingOptions = []) -> Bool {
        return matches(withPattern: pattern, inRange: NSRange(startIndex..., in: self), options: options, matchingOptions: matchingOptions)
    }
    
    /// Returns the first match of the regular expression in the string.
    ///
    /// - Parameters:
    ///   - pattern: The string to search.
    ///   - options: The regular expression options that are applied to the expression during matching
    ///   - matchingOptions: The matching options to use.
    public func firstMatch(withPattern pattern: String, options: NSRegularExpression.Options = [], matchOptions: NSRegularExpression.MatchingOptions = []) -> String {
        return firstMatch(withPattern: pattern, inRange: NSRange(startIndex..., in: self), options: options, matchOptions: matchOptions)
    }
    
    /// Returns an interget indicating the numbers of matches of the regular expression in the string.
    ///
    /// - Parameters:
    ///   - pattern: The string to search.
    ///   - options: The regular expression options that are applied to the expression during matching
    ///   - matchingOptions: The matching options to use.
    public func numbersOfMatches(withPattern pattern: String, options: NSRegularExpression.Options = [], matchOptions: NSRegularExpression.MatchingOptions = []) -> Int {
        return numbersOfMatches(withPattern: pattern, inRange: NSRange(startIndex..., in: self), options: options, matchOptions: matchOptions)
    }
    
    /// Returns a new string which replaces regular expression matches within the mutable string using the template string.
    ///
    /// - Parameters:
    ///   - pattern: The string to search.
    ///   - options: The regular expression options that are applied to the expression during matching
    ///   - matchingOptions: The matching options to use.
    public func replaceMatches(withPattern pattern: String, byTemplate template: String, options: NSRegularExpression.Options = [], matchOptions: NSRegularExpression.MatchingOptions = []) -> String {
        return replaceMatches(withPattern: pattern, byTemplate: template, inRange: NSRange(startIndex..., in: self), options: options, matchOptions: matchOptions)
    }
}
