//
//  Algorithm.swift
//  
//
//  Created by YueTing Weng on 2022/3/5.
//

import Foundation

extension String {
    
    public func contains(_ substring: String) -> Int? {
        let n = self.count, m = substring.count
        guard m > 0 else {
            return 0
        }
        
        var next = Array(repeating: 0, count: m)
        var j = 0
        for i in 1 ..< m {
            while j > 0 && substring[i] != substring[j] {
                j = next[j-1]
            }
            if substring[i] == substring[j] {
                j += 1
            }
            next[i] = j
        }
        
        j = 0
        for i in 0 ..< n {
            while j > 0 && self[i] != substring[j] {
                j = next[j-1]
            }
            if self[i] == substring[j] {
                j += 1
            }
            if j == m {
                return i - m + 1
            }
        }
        
        return nil
    }
    
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
