#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimitersFor:numbersToAdd];
    numbersToAdd = [self handleNewLineDelimiter:numbersToAdd];
    [self guardCondition_rejectDuplicateDelimitersFor:numbersToAdd];
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}

- (NSString *)handleCustomDelimitersFor:(NSString *)numbersToAdd {
    if (![numbersToAdd hasPrefix:@"//"])
        return numbersToAdd;

    NSString *customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(2, 1)];
    NSString *suffix = [numbersToAdd substringFromIndex:4];
    return [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
}

- (void)guardCondition_rejectDuplicateDelimitersFor:(NSString *)numbersToAdd {
    if ([numbersToAdd rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot input duplicate delimiters."];
}

- (NSString *)handleNewLineDelimiter:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (NSInteger)sum:(NSString *)numbersToAdd {
    NSInteger total = 0;
    NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
    NSMutableString *negativeNumbers = [NSMutableString string];
    for (NSString *numberString in numbersArray) {
        NSInteger number = [numberString integerValue];
        [self check:negativeNumbers for:number];
        total += number;
    }
    [self guardCondition_rejectNegativeNumbersFor:negativeNumbers];
    return total;
}

- (void)check:(NSMutableString *)negativeNumbers for:(NSInteger)number {
    if (number < 0)
            [negativeNumbers appendString:[NSString stringWithFormat:@"%i,", number]];
}

- (void)guardCondition_rejectNegativeNumbersFor:(NSMutableString *)negativeNumbers {
    if ([negativeNumbers length] > 0)
        [NSException raise:@"NegativeNumbersException" format:@"You cannot input negative numbers: -5,-7,"];
}
@end