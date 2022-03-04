import XCTest
@testable import StringUtils

final class StringUtilsTests: XCTestCase {
    
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
        
        let subString6 = string.subString(fromRange: 1..<3)
        XCTAssertEqual(subString6, "ub")
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
    
    func testMatches() throws {
        let string = "CASEinsensitive"
        XCTAssertEqual(string.matches(withPattern: "[a-z]+", options: [.caseInsensitive]), true)
        
        let email = "WengYuehTing@gmail.com"
        let emailPattern = "([A-Z0-9a-z._%+-]+)@([A-Za-z0-9.-]+\\.[A-Za-z]{2,64})"
        let matchedGroup: [[String]] = email.matches(withPattern: emailPattern)
        XCTAssertEqual(matchedGroup[0][1], "WengYuehTing")
        XCTAssertEqual(matchedGroup[0][2], "gmail.com")
        
        let firstMatch = email.firstMatch(withPattern: "([A-Z0-9a-z._%+-]+)@([A-Za-z0-9.-]+\\.[A-Za-z]{2,64})")
        XCTAssertEqual(firstMatch, matchedGroup[0][0])
        
        let errorFormattedEmail = "WengYuehTing@gmail"
        XCTAssertEqual(errorFormattedEmail.matches(withPattern: emailPattern), false)
    }
}
