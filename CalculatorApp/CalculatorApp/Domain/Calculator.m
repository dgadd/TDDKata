#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleNewLineDelimiter:numbersToAdd];
    [self guardCondition_rejectDuplicateDelimiters:numbersToAdd];
    if([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}

- (void)guardCondition_rejectDuplicateDelimiters:(NSString *)numbersToAdd {
    if([numbersToAdd rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot input duplicate delimiters"];
}

- (NSString *)handleNewLineDelimiter:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (NSInteger)sum:(NSString *)numbersToAdd {
    NSInteger total = 0;
    NSArray *array = [numbersToAdd componentsSeparatedByString:@","];
    for (NSString *numberString in array) {
            total += [numberString integerValue];
        }
    return total;
}
@end