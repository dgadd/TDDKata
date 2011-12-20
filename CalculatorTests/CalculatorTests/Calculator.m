#import "Calculator.h"


@implementation Calculator {

}

- (int)sum:(NSString *)numbersToOperate {
        int total = 0;
        NSArray *numbersArray = [numbersToOperate componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }

- (BOOL)containsWithin:(NSString *)numbersToOperate theString:(NSString *)searchString {
    return [numbersToOperate rangeOfString:searchString].location != NSNotFound;
}

- (int)add:(NSString *)numbersToOperate {
    if ([self containsWithin:numbersToOperate theString:@","])
        return [self sum:numbersToOperate];

    return [numbersToOperate length] > 0 ? [numbersToOperate intValue] : 0;
}

- (int)doOperation:(CalcOperationType)type onValue:(NSString *)numbersToOperate {
    switch (type) {
        case Add:
            return [self add:numbersToOperate];
            break;
    }
}
@end