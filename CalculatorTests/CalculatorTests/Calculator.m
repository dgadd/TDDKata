#import "Calculator.h"


@implementation Calculator {

}

- (int)sum:(NSString *)inputValue {
        NSArray *numbersArray = [inputValue componentsSeparatedByString:@","];
        int total = 0;
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }

- (BOOL)containsWithin:(NSString *)thisPhrase theFollowing:(NSString *)value {
    return [thisPhrase rangeOfString:value].location != NSNotFound;
}

- (int)add:(NSString *)numbersToAdd {
    if ([self containsWithin:numbersToAdd theFollowing:@","])
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end