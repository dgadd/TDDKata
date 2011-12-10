#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)stringToSearch theSubstring:(NSString *)value {
    return [stringToSearch rangeOfString:value].location != NSNotFound;
}

- (int)add:(NSString *)numbersToAdd {
    if ([self containsWithin:numbersToAdd theSubstring:@","])
    {
        int total = 0;
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end