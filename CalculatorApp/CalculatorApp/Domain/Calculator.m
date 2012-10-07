#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimitersIn:numbersToAdd];
    numbersToAdd = [self handleNewLineDelimiterIn:numbersToAdd];
    [self guardCondition_rejectDuplicateDelimitersIn:numbersToAdd];
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}

- (NSString *)handleCustomDelimitersIn:(NSString *)numbersToAdd {
    if (![numbersToAdd hasPrefix:@"//"])
        return numbersToAdd;

    NSString *customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(2, 1)];
    NSString *suffix = [numbersToAdd substringFromIndex:4];
    return [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
}

- (void)guardCondition_rejectDuplicateDelimitersIn:(NSString *)numbersToAdd {
    if ([numbersToAdd rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimitersException" format:@""];
}

- (NSString *)handleNewLineDelimiterIn:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (NSInteger)sum:(NSString *)numbersToAdd {
    NSInteger total = 0;
    NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
    NSMutableString *negativeNumbers = [NSMutableString string];
    for (NSString *numberString in numbersArray) {
        NSInteger number = [numberString integerValue];
        [self checkFor:negativeNumbers in:number];
        if(number < 1001)
            total += number;
    }
    [self guardCondition_rejectNegativeNumbersIn:negativeNumbers];
    return total;
}

- (void)guardCondition_rejectNegativeNumbersIn:(NSMutableString *)negativeNumbers {
    if ([negativeNumbers length] > 0)
        [NSException raise:@"NegativeNumbersException" format:@"You cannot input negative numbers: -9,-2,"];
}

- (void)checkFor:(NSMutableString *)negativeNumbers in:(NSInteger)number {
    if (number < 0)
            [negativeNumbers appendString:[NSString stringWithFormat:@"%i,", number]];
}
@end