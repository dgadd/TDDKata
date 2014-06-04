import UIKit

class Calculator: NSObject {
    func add(numbersToAdd: String) -> Int {
        var replacedNumbers = handleNewLineDelimiters(numbersToAdd)
        rejectDuplicateDelimiters(replacedNumbers)
        if replacedNumbers.containsString(",") {
            return sum(replacedNumbers)
        }

        return sumSimpleCase(replacedNumbers)
    }
    
    func rejectDuplicateDelimiters(replacedNumbers: NSString) {
        assert(!replacedNumbers.containsString(",,"), "cannot contain duplicate delimiter inputs")
    }
    
    func handleNewLineDelimiters(numbersToAdd: NSString) -> NSString {
        return numbersToAdd.stringByReplacingOccurrencesOfString("\n", withString: ",")
    }
    
    func sum(numbersToAdd: NSString) -> Int {
        var total = 0
        var numberInputs = numbersToAdd.componentsSeparatedByString(",")
        for numberInput in numberInputs {
            total += numberInput.integerValue
        }
        return total
    }
    
    func sumSimpleCase(numbersToAdd: NSString) -> Int {
        if numbersToAdd.length > 0 {
            return numbersToAdd.integerValue
        }
        return 0
    }
}
