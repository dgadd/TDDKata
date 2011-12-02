//
//  Created by dgadd on 11-12-01.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Calculator.h"


@implementation Calculator

- (BOOL)containsWithin:(NSString *)numbersToAdd searchString:(NSString *)searchString {
    return [numbersToAdd rangeOfString:searchString].location != NSNotFound;
}

- (int)sum:(NSString *)numbersToAdd {
    int total = 0;
    NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
    for (NSString *numberString in numbersArray)
            total += [numberString intValue];
    return total;
}

- (int) add:(NSString *) numbersToAdd {
    if([self containsWithin:numbersToAdd searchString:@","])
    {
        NSString * numberString;
        return [self sum:numbersToAdd];
    }
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}

@end