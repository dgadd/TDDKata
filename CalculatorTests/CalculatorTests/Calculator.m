//
//  Created by dgadd on 11-12-09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)numbersToAdd theFollowing:(NSString *)value {
    return [numbersToAdd rangeOfString:value].location != NSNotFound;
}

- (int)sum:(NSArray *)numbersArray {
    int total = 0;
    for(NSString *numberString in numbersArray)
            total += [numberString intValue];
    return total;
}

- (NSString *)handleNewLineDelimiters:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleNewLineDelimiters:numbersToAdd];
    if ([self containsWithin:numbersToAdd theFollowing:@","])
    {
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        return [self sum:numbersArray];
    }
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}

@end