//
//  Created by dgadd on 11-12-12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)contains:(NSString *)input searchString:(NSString *)value {
    return [input rangeOfString:value].location != NSNotFound;
}

- (int)sum:(NSString *)numbersToAdd {
        int total = 0;
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
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
    if ([self contains:numbersToAdd searchString:@","])
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end