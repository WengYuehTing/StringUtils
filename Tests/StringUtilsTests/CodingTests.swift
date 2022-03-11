import XCTest
@testable import StringUtils

final class CodingTests: XCTestCase {
    
    func testBase64() throws {
        let string = "Hello World"
        let base64String = string.base64Encoded()
        XCTAssertEqual(base64String, "SGVsbG8gV29ybGQ=")
        XCTAssertEqual(base64String.base64Decoded(), string)
    }
    
    func testUrl() throws {
        let google = "https://www.google.com"
        let googleUrl = google.urlEncoded()
        XCTAssertEqual(googleUrl, "https%3A%2F%2Fwww.google.com")
        XCTAssertEqual(googleUrl.urlDecoded(), google)
        
        let stackoverflow = "https://stackoverflow.com/questions/24551816/swift-encode-url/39767927#39767927"
        let stackoverflowUrl = stackoverflow.urlEncoded()
        XCTAssertEqual(stackoverflowUrl, "https%3A%2F%2Fstackoverflow.com%2Fquestions%2F24551816%2Fswift-encode-url%2F39767927%2339767927")
        XCTAssertEqual(stackoverflowUrl.urlDecoded(), stackoverflow)
    }
    
    func testMD5() throws {
        let password = "12345678"
        let cryptedPassword = password.md5()
        XCTAssertEqual(cryptedPassword, "25d55ad283aa400af464c76d713c07ad")
    }
}
