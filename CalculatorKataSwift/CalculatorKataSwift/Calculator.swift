import Foundation

class Calculator: NSObject {
    
    func add(numbersToAdd: String) -> Int {
        return numbersToAdd.bridgeToObjectiveC().length > 0 ? numbersToAdd.bridgeToObjectiveC().integerValue : 0;
    }

}
