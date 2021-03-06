import XCTest
@testable import StringUtils

final class ExtensionTests: XCTestCase {
    
    func testSubscriptOffset() throws {
        let string = "hello string"
        let character = string[1]
        XCTAssertEqual(character, "e")
    }
    
    func testSubscriptRange() throws {
        let string = "hello string"
        let subString = string[0..<5]
        XCTAssertEqual(subString, "hello")
    }
    
    func testInsert() throws {
        var string = "hello world"
        string.insert("h", at: 0)
        XCTAssertEqual(string, "hhello world")
        
        string.insert(" my", at: 6)
        XCTAssertEqual(string, "hhello my world")
    }
    
    func testRemove() throws {
        var string = "string to delete"
        string.remove(at: 0)
        XCTAssertEqual(string, "tring to delete")
        
        string.remove(range: 0..<6)
        XCTAssertEqual(string, "to delete")
    }
    
    func testSubString() throws {
        let string = "subString test sample"
        let subString1 = string.subString(toIndex: 3)
        XCTAssertEqual(subString1, "sub")
        
        let subString2 = string.subString(toIndex: string.count)
        XCTAssertEqual(subString2, string)
        
        let subString3 = string.subString(toIndex: -1)
        XCTAssertEqual(subString3, "")
        
        let subString4 = string.subString(fromIndex: 7)
        XCTAssertEqual(subString4, "ng test sample")
        
        let subString5 = string.subString(fromIndex: 1, toIndex: 3)
        XCTAssertEqual(subString5, "ub")
    }
    
    func testSplit() throws {
        let string = "hello world"
        let separatedString = string.split(" ")
        XCTAssertEqual(separatedString[0], "hello")
        
        let string2 = "helloworld"
        let separatedString2 = string2.split(" ")
        let separatedString3 = string2.split("ow")
        XCTAssertEqual(separatedString2[0], "helloworld")
        XCTAssertEqual(separatedString3[0], "hell")
    }
    
    func testTrim() throws {
        let string = "hello "
        XCTAssertEqual(string.trim(), "hello")
        
        let string2 = "Orel"
        XCTAssertEqual(string2.trim(.lowercaseLetters), "O")
        XCTAssertEqual(string2.rtrim(CharacterSet(charactersIn: "l")), "Ore")
        XCTAssertEqual(string2.ltrim(.decimalDigits), "Orel")
        
        let string3 = "123@gmail.com"
        XCTAssertEqual(string3.trim(.decimalDigits), "@gmail.com")
        XCTAssertEqual(string3.ltrim(.decimalDigits), "@gmail.com")
        XCTAssertEqual(string3.rtrim(.decimalDigits), "123@gmail.com")
        
        let string4 = "  https://www.google.com/resources/index.php  "
        XCTAssertEqual(string4.rtrim(), "  https://www.google.com/resources/index.php")
        XCTAssertEqual(string4.ltrim(), "https://www.google.com/resources/index.php  ")
    }
    
    func testReplace() throws {
        XCTAssertEqual("hello".replace(ofTarget: "hello", with: "world"), "world")
        XCTAssertEqual("hello".replace(ofTarget: "", with: "world"), "hello")
        XCTAssertEqual("  hello".replace(inRange: 0..<2, with: "Say"), "Sayhello")
    }
    
    func testReverse() throws {
        XCTAssertEqual("hello".reversed(), "olleh")
    }
}
