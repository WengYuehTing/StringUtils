//
//  Algorithm.swift
//  
//
//  Created by YueTing Weng on 2022/3/5.
//

import Foundation

extension String {
    
    /// Returns the index of first occurrence of substring in recevier.
    ///
    /// if substring is empty, return 0.
    /// if substring is not part of receiver, return nil.
    ///
    /// - Parameter substring: The string which is possibly a part of the receiver.
    ///
    /// - Important: We can use `KMP (Knuth Morris Pratt)` algorithm to solve
    ///   this issue. The core idea of the KMP is: whenever we detect a mismatch
    ///   (after some matches), we already know some of the characters in the
    ///   text of the next window. We take advantage of this information to avoid
    ///   matching the characters that we know will anyway match.
    ///
    /// Complexity: O (m + n), where m is the count of recevier, n is the count
    /// of substring.
    public func contains(_ substring: String) -> Int? {
        let n = self.count, m = substring.count
        guard !substring.isEmpty else {
            return 0
        }
        
        let sarr = Array(self)
        let carr = Array(substring)
        var next = Array(repeating: 0, count: m)
        var j = 0
        for i in 1 ..< m {
            while j > 0 && carr[i] != carr[j] {
                j = next[j-1]
            }
            if carr[i] == carr[j] {
                j += 1
            }
            next[i] = j
        }
        
        j = 0
        for i in 0 ..< n {
            while j > 0 && sarr[i] != carr[j] {
                j = next[j-1]
            }
            if sarr[i] == carr[j] {
                j += 1
            }
            if j == m {
                return i - m + 1
            }
        }
        
        return nil
    }
    
    /// Returns the first character that is not repeated in the receiver.
    ///
    /// if all characters are repeated, returns nil.
    public func firstUniqChar() -> Character? {
        var table = Array(repeating: 0, count: 256) // ascii
        for c in self {
            let ascii = Int(c.asciiValue!)
            table[ascii] += 1
        }
        
        for c in self where table[Int(c.asciiValue!)] == 1 {
            return c
        }
        
        return nil
    }
    
    
    /// Returns the count of the last real-world word in the receiver,
    /// which should be separated by spaces.
    public func lengthOfLastWord() -> Int {
        var result = ""
        var found = false
        for c in self {
            if c == " " {
                found = true
            } else {
                if found {
                    result = ""
                    found = false
                }

                result.append(c)
            }
        }

        return result.count
    }
    
    /// Returns true if the receiver equals to its reversed order.
    public func isPalindrome() -> Bool {
        let carr = Array(self.lowercased().filter { $0.isLetter || $0.isNumber })
        var front = 0
        var end = carr.count - 1
        while front < end {
            if carr[front] != carr[end] {
                return false
            }

            front += 1
            end -= 1
        }

        return true
    }
}
