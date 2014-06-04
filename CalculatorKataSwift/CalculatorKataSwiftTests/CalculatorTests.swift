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
    
    func test_givenSut_whenTwoLengthInput_thenReturnSum() {
        var expected = 7
        var calculator = Calculator()
        var result = calculator.add("4,3")
        XCTAssertEqualObjects(expected, result)
    }
    
    func test_givenSut_whenAnyLengthInput_thenReturnSum() {
        var expected = 0
        var highNumber = 999
        var numbersToAdd = ""
        for var index = 0; index < highNumber; index++ {
            numbersToAdd += String(index) + ","
            expected += index
        }
        var calculator = Calculator()
        var result = calculator.add(numbersToAdd)
        XCTAssertEqualObjects(expected, result)
    }
    
    func test_givenSut_whenNewLineDelimiterInput_thenReturnSum() {
        var expected = 15
        var calculator = Calculator()
        var result = calculator.add("4,3\n8")
        XCTAssertEqualObjects(expected, result)
    }
}
