import XCTest
@testable import StringUtils

final class AlgorithmTests: XCTestCase {
    
    func testContains() throws {
        XCTAssertEqual("hello".contains("ll"), 2)
        XCTAssertEqual("aabaabaafa".contains("aabaaf"), 3)
        XCTAssertEqual("invalidInput".contains(""), 0)
        XCTAssertNil("Notfound".contains("find"))
    }
    
    func testFirstUniqChar() throws {
        XCTAssertEqual("hello".firstUniqChar(), "h")
        XCTAssertEqual("abaccdeff".firstUniqChar(), "b")
        XCTAssertNil("aabbcc".firstUniqChar())
    }
    
    func testLengthOfLastWord() throws {
        XCTAssertEqual("hello World".lengthOfLastWord(), 5)
        XCTAssertEqual("   fly me   to   the moon  ".lengthOfLastWord(), 4)
        XCTAssertEqual("luffy is still joyboy".lengthOfLastWord(), 6)
    }
    
    func testIsPalindrome() throws {
        XCTAssertTrue("A man, a plan, a canal: Panama".isPalindrome())
        XCTAssertFalse("race a car".isPalindrome())
    }
}
