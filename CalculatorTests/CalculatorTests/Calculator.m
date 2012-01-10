#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)numbersToAdd theValue:(NSString *)value {
    return [numbersToAdd rangeOfString:value].location != NSNotFound;
}

- (int)sum:(NSString *)numbersToAdd {
        int total= 0;
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }

- (void)handleNewLineDelimiter:(NSString **)numbersToAdd {
    (*numbersToAdd) = [*numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (int)add:(NSString *)numbersToAdd {
    [self handleNewLineDelimiter:&numbersToAdd];
    if ([self containsWithin:numbersToAdd theValue:@","])
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end