import XCTest
@testable import StringKit

final class StringKitTests: XCTestCase {
    
    func testValidEmail() {
        XCTAssertTrue(StringKit.isValidEmail("anussha@gmail.com"))
        XCTAssertFalse(StringKit.isValidEmail("notanemail"))
        XCTAssertFalse(StringKit.isValidEmail("@gmail.com"))
    }
    
    func testValidPhone() {
        XCTAssertTrue(StringKit.isValidPhone("+919876543210"))
        XCTAssertFalse(StringKit.isValidPhone("123"))
    }
    
    func testIsNumeric() {
        XCTAssertTrue(StringKit.isNumeric("12345"))
        XCTAssertFalse(StringKit.isNumeric("123abc"))
    }
    
    func testIsBlank() {
        XCTAssertTrue(StringKit.isBlank(""))
        XCTAssertTrue(StringKit.isBlank("   "))
        XCTAssertFalse(StringKit.isBlank("hello"))
    }
    
    func testCapitalizeFirst() {
        XCTAssertEqual(StringKit.capitalizeFirst("hello"), "Hello")
        XCTAssertEqual(StringKit.capitalizeFirst(""), "")
    }
    
    func testToCamelCase() {
        XCTAssertEqual(StringKit.toCamelCase("hello world"), "helloWorld")
        XCTAssertEqual(StringKit.toCamelCase("swift string kit"), "swiftStringKit")
    }
    
    func testToSnakeCase() {
        XCTAssertEqual(StringKit.toSnakeCase("Hello World"), "hello_world")
        XCTAssertEqual(StringKit.toSnakeCase("Swift String Kit"), "swift_string_kit")
    }
    
    func testTruncate() {
        XCTAssertEqual(StringKit.truncate("Hello Anussha", limit: 5), "Hello...")
        XCTAssertEqual(StringKit.truncate("Hi", limit: 10), "Hi")
    }
    
    func testRemoveSpaces() {
        XCTAssertEqual(StringKit.removeSpaces("Hello World"), "HelloWorld")
    }
    
    func testRepeatString() {
        XCTAssertEqual(StringKit.repeatString("Hi", times: 3), "HiHiHi")
        XCTAssertEqual(StringKit.repeatString("Ab", times: 0), "")
    }
    
    func testWordCount() {
        XCTAssertEqual(StringKit.wordCount("Hello World"), 2)
        XCTAssertEqual(StringKit.wordCount(""), 0)
    }
    
    func testCountOccurrences() {
        XCTAssertEqual(StringKit.countOccurrences(of: "a", in: "anussha"), 2)
        XCTAssertEqual(StringKit.countOccurrences(of: "z", in: "hello"), 0)
    }
    
    func testReverse() {
        XCTAssertEqual(StringKit.reverse("hello"), "olleh")
        XCTAssertEqual(StringKit.reverse(""), "")
    }
    
    func testIsPalindrome() {
        XCTAssertTrue(StringKit.isPalindrome("racecar"))
        XCTAssertTrue(StringKit.isPalindrome("madam"))
        XCTAssertFalse(StringKit.isPalindrome("hello"))
    }
    
    func testExtractNumbers() {
        XCTAssertEqual(StringKit.extractNumbers("abc123def456"), "123456")
        XCTAssertEqual(StringKit.extractNumbers("noNumbers"), "")
    }
    
    func testExtractLetters() {
        XCTAssertEqual(StringKit.extractLetters("abc123"), "abc")
        XCTAssertEqual(StringKit.extractLetters("Swift4Life"), "SwiftLife")
    }
    
    func testMask() {
        XCTAssertEqual(StringKit.mask("1234567890"), "******7890")
        XCTAssertEqual(StringKit.mask("hi"), "hi")
    }
    
    func testToInt() {
        XCTAssertEqual(StringKit.toInt("42"), 42)
        XCTAssertNil(StringKit.toInt("abc"))
    }
    
    func testToDouble() {
        XCTAssertEqual(StringKit.toDouble("3.14"), 3.14)
        XCTAssertNil(StringKit.toDouble("abc"))
    }
    
    func testToBool() {
        XCTAssertTrue(StringKit.toBool("true"))
        XCTAssertTrue(StringKit.toBool("yes"))
        XCTAssertFalse(StringKit.toBool("false"))
    }
}
