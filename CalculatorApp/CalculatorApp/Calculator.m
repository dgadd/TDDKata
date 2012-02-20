#import "Calculator.h"


@implementation Calculator {

}

- (int)sum:(NSString *)numbersToAdd {
        int total = 0;
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray) {
            total += [numberString intValue];
        }
        return total;
    }

- (NSString *)handleNewLineDelimiter:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (void)guardCondition_RejectDuplicateDelimiters:(NSString *)numbersToAdd {
    if ([numbersToAdd rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimitersException" format:@""];
}

- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleNewLineDelimiter:numbersToAdd];
    [self guardCondition_RejectDuplicateDelimiters:numbersToAdd];
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];
    return [numbersToAdd length]  > 0 ? [numbersToAdd intValue] : 0;
}
@end