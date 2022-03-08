//
//  Regression.swift
//  
//
//  Created by YueTing Weng on 2022/3/8.
//

import Foundation

/// Returns the results of regular expression matching.
extension String {
    
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
}
