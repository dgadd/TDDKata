//
//  Created by dgadd on 11-11-30.
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

- (void)handleNewLineDelimiter:(NSString **)numbersToAdd {
    (*numbersToAdd) = [*numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (void)guardConditionRejectDuplicateDelimiters:(NSString *)numbersToAdd {
    if ([self containsWithin:numbersToAdd searchString:@",,"])
        [NSException raise:@"Duplicate delimiteres" format:@"You cannot use duplicate delimiters: %d", @",,"];
}

- (int)add:(NSString *)numbersToAdd {
    [self handleNewLineDelimiter:&numbersToAdd];
    [self guardConditionRejectDuplicateDelimiters:numbersToAdd];
    if ([self containsWithin:numbersToAdd searchString:@","])
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}

@end