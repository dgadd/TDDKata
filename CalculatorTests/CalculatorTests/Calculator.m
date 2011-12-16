#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)contains:(NSString *)input theString:(NSString *)searchString {
    return [input rangeOfString:searchString].location != NSNotFound;
}

- (int)sum:(NSString *)commaDelimitedString {
        int total = 0;
        NSArray *numbersArray = [commaDelimitedString componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }

- (int)add:(NSString *)numbersToAdd {
    if ([self contains:numbersToAdd theString:@","])
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end