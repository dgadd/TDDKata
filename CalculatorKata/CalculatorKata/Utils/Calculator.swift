import Foundation

class Calculator: NSObject {
    func add(numbersToAdd: String) -> Int? {
        if countElements(numbersToAdd) > 0 {
            return numbersToAdd.toInt();
        }
        return 0
    }
}
