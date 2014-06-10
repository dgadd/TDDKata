import XCTest
import CalculatorKataSwift

class CalculatorTests: XCTestCase {

    
    override func setUp() {
        super.setUp()
    }

    func test_given_Sut_when_zeroLengthstringAdded_then_shouldReturn0() {
        var expected = 0
        var sut = Calculator()
        var actual = sut.add("")
        
        XCTAssertEqualObjects(expected, actual)
    }
    
    func test_given_Sut_when_oneLengthstringAdded_then_shouldReturnNumericEquivalent() {
        var expected = 3
        var sut = Calculator()
        var actual = sut.add("3")
        
        XCTAssertEqualObjects(expected, actual)
    }
    
}
