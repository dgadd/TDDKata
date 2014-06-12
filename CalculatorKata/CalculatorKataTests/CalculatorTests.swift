import XCTest
import CalculatorKata

class CalculatorTests: XCTestCase {

    func test_givenSut_whenZeroInput_thenShouldReturn0() {
        var expected = 0;
        var sut = Calculator()
        var result = sut.add("")
        XCTAssertEqualObjects(expected, result)
    }

    func test_givenSut_whenOneInput_thenShouldReturnNumericEquivalent() {
        var expected = 8;
        var sut = Calculator()
        var result = sut.add("8")
        XCTAssertEqualObjects(expected, result)
    }

}
