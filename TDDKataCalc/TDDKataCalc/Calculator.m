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
    return [numbersToAdd rangeOfString:@","].location != NSNotFound;
}

- (void)handleNewLineDelimiter:(NSString **)numbersToAdd {
    (*numbersToAdd) = [*numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (int)add:(NSString *)numbersToAdd {
    [self handleNewLineDelimiter:&numbersToAdd];
    if ([self contains:numbersToAdd]) {
        return [self sum:numbersToAdd];
    }
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end