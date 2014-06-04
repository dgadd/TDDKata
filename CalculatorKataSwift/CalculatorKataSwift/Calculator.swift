import UIKit

class Calculator: NSObject {
    func add(numbersToAdd: NSString) -> Int {
        if(numbersToAdd.containsString(",")) {
            var numberInputs = numbersToAdd.componentsSeparatedByString(",")
            return numberInputs[0].integerValue + numberInputs[1].integerValue
        }
        return sumSimpleCase(numbersToAdd)
    }
    
    func sumSimpleCase(numbersToAdd: NSString) -> Int {
        if numbersToAdd.length > 0 {
            return numbersToAdd.integerValue
        }
        return 0
    }
}
