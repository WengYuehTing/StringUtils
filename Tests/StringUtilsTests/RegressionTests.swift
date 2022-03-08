import XCTest
@testable import StringUtils

final class RegressionTests: XCTestCase {
    
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
        
        let numbersOfMatches = email.numbersOfMatches(withPattern: emailPattern)
        XCTAssertEqual(numbersOfMatches, 1)
        
        let emailUserPattern = "^[A-Z0-9a-z._%+-]+"
        let newAccount = "newAccount"
        let anotherEmail = email.replaceMatches(withPattern: emailUserPattern, byTemplate: newAccount)
        XCTAssertEqual(anotherEmail, newAccount + "@gmail.com")
    }
}
