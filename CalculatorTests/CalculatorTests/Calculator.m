#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)thisPhrase aSubstring:(NSString *)thisValue {
    return [thisPhrase rangeOfString:thisValue].location != NSNotFound;
}

- (int)sum:(NSString *)input {
        int total = 0;
        NSArray *numbersArray = [input componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }

- (int)add:(NSString *)numbersToAdd {
    if ([self containsWithin:numbersToAdd aSubstring:@","])
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end