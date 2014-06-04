import UIKit

class Calculator: NSObject {
    func add(numbersToAdd: NSString) -> Int {
        if numbersToAdd.containsString(",") {
            return sum(numbersToAdd)            
        }

        return sumSimpleCase(numbersToAdd)
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
