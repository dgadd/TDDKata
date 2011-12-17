#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)thisString theValue:(NSString *)value {
    return [thisString rangeOfString:value].location != NSNotFound;
}

- (int)add:(NSString *)numbersToAdd {
    if ([self containsWithin:numbersToAdd theValue:@","])
    {
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        int total = 0;
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end