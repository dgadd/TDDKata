import XCTest
import CalculatorKataSwift

class CalculatorTests: XCTestCase {
    
    func test_givenSut_whenZeroLengthInput_thenReturnZero() {
        var expected = 0
        var calculator = Calculator()
        var result = calculator.add("")
        XCTAssertEqualObjects(expected, result)
        
    }
    
    func test_givenSut_whenOneLengthInput_thenReturnNumericEquivalent() {
        var expected = 4
        var calculator = Calculator()
        var result = calculator.add("4")
        XCTAssertEqualObjects(expected, result)
    }
    
}
