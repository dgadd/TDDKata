#import "Calculator.h"


@implementation Calculator {

}

- (int)sum:(NSString *)numbersToAdd {
        int total= 0;
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray) {
            total += [numberString intValue];
        }
        return total;
    }

- (void)handleNewLineDelimiter:(NSString **)numbersToAdd {
    (*numbersToAdd) = [*numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (int)add:(NSString *)numbersToAdd {
    [self handleNewLineDelimiter:&numbersToAdd];
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end