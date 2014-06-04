import UIKit

class Calculator: NSObject {
    func add(numbersToAdd: NSString) -> Int {
        if numbersToAdd.length > 0 {
            return numbersToAdd.integerValue
        }
        return 0
    }
}
