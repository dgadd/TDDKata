//
//  Created by dgadd on 11-12-03.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Calculator.h"


@implementation Calculator {

}

- (int)sum:(NSString *)numbersToAdd {
        int total = 0;
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }

- (BOOL)contains:(NSString *)numbersToAdd {
    return ;
}

- (void)handleNewLineDelimiter:(NSString **)numbersToAdd {
    (*numbersToAdd) = [*numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (BOOL)contains:(NSString *)numbersToAdd searchString:(NSString *)searchString {
    return [numbersToAdd rangeOfString:searchString].location != NSNotFound;
}

- (void)guardCondition_rejectDuplicateDelimiters:(NSString *)numbersToAdd {
    if ([self contains:numbersToAdd searchString:@",,"]) {
        [NSException raise:@"Duplicate delimiters" format:@"You cannot use duplicate delimiters"];
    }
}

- (int)add:(NSString *)numbersToAdd {
    [self handleNewLineDelimiter:&numbersToAdd];
    [self guardCondition_rejectDuplicateDelimiters:numbersToAdd];
    if ([self contains:numbersToAdd searchString:@","]) {
        return [self sum:numbersToAdd];
    }
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end