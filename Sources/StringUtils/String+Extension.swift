//
//  String+Extension.swift
//  
//
//  Created by YueTing Weng on 2022/3/2.
//

/// subString methods collection, that creates a sub-string
/// from the given string, which uses the subscript(range:)
/// to validate array index and generate desired results.
extension String {

    func subString(fromIndex index: Int) -> String {
        return self[min(index, count) ..< count]
    }

    func subString(toIndex index: Int) -> String {
        return self[0 ..< max(0, index)]
    }
    
    func subString(fromIndex from: Int, toIndex to: Int) -> String {
        return self[min(from, count) ..< max(0, to)]
    }
    
    func subString(fromRange range: Range<Int>) -> String {
        return self[range]
    }
}


/// a subscript collection. Using String[offset:] or
/// String[range:] to access character or sub-string
/// like array style.
extension String {
    
    subscript (offset: Int) -> String {
        return String(self[index(startIndex, offsetBy: offset)])
    }

    subscript (range: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(count, range.lowerBound)), upper: min(count, max(0, range.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
