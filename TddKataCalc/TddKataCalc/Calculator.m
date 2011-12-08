//
//  Created by dgadd on 11-12-07.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)thisString theFollowing:(NSString *)value {
    return [thisString rangeOfString:value].location != NSNotFound;
}

- (int)sumOf:(NSString *)numbersToAdd {
        int total = 0;
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }

- (void)handleDuplicateDelimiters:(NSString **)numbersToAdd {
    (*numbersToAdd) = [*numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (int)add:(NSString *)numbersToAdd {
    [self handleDuplicateDelimiters:&numbersToAdd];
    if ([self containsWithin:numbersToAdd theFollowing:@","])
        return [self sumOf:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end