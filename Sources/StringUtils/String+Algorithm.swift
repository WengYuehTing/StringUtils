//
//  File.swift
//  
//
//  Created by YueTing Weng on 2022/3/5.
//

import Foundation

internal func kmp(_ s: String, p: String) -> Int? {
    let n = s.count, m = p.count
    guard m > 0 else {
        return 0
    }
    
    var next = Array(repeating: 0, count: m)
    var j = 0
    for i in 1 ..< m {
        while j > 0 && p[i] != p[j] {
            j = next[j-1]
        }
        if p[i] == p[j] {
            j += 1
        }
        next[i] = j
    }
    
    j = 0
    for i in 0 ..< n {
        while j > 0 && s[i] != p[j] {
            j = next[j-1]
        }
        if s[i] == p[j] {
            j += 1
        }
        if j == m {
            return i - m + 1
        }
    }
    
    return nil
}
