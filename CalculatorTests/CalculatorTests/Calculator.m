#import "Calculator.h"


@implementation Calculator {

}

- (int)sum:(NSString *)numbersToAdd {
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        int total = 0;
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }

- (BOOL)contains:(NSString *)thisPhrase searchString:(NSString *)theString {
    return [thisPhrase rangeOfString:theString].location != NSNotFound;
}

- (int)add:(NSString *)numbersToAdd {
    if ([self contains:numbersToAdd searchString:@","])
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end