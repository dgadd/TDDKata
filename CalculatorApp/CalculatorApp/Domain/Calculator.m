#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiters:numbersToAdd];
    numbersToAdd = [self handleNewLineDelimiters:numbersToAdd];
    [self guardCondition_rejectDuplicateDelimiters:numbersToAdd];
    if ([numbersToAdd rangeOfString:@","].location > 0)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}

- (NSString *)handleCustomDelimiters:(NSString *)numbersToAdd {
    if (![numbersToAdd hasPrefix:@"//"])
        return numbersToAdd;

    if ([numbersToAdd rangeOfString:@"["].location != NSNotFound)
        return [self handleMultiLength:numbersToAdd];

    return [self handleSingleLength:numbersToAdd];

}

- (NSString *)handleSingleLength:(NSString *)numbersToAdd {
    NSString *customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(2, 1)];
    NSString *suffix = [numbersToAdd substringWithRange:NSMakeRange(4, [numbersToAdd length] - 4)];
    numbersToAdd = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    return numbersToAdd;
}

- (NSString *)handleMultiLength:(NSString *)numbersToAdd {
    NSInteger leftBrace = [numbersToAdd rangeOfString:@"["].location;
    NSInteger rightBrace = [numbersToAdd rangeOfString:@"]"].location;
    NSString *customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(leftBrace + 1, (rightBrace - leftBrace) - 1)];
    NSString *suffix = [numbersToAdd substringFromIndex:rightBrace];
    numbersToAdd = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    return numbersToAdd;
}

- (void)guardCondition_rejectDuplicateDelimiters:(NSString *)numbersToAdd {
    if ([numbersToAdd rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot input duplicate delimiters."];
}

- (NSString *)handleNewLineDelimiters:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (NSInteger)sum:(NSString *)numbersToAdd {
    NSArray *array = [numbersToAdd componentsSeparatedByString:@","];
    NSInteger total = 0;
    NSMutableString *negativeNumbers = [NSMutableString string];
    for (NSString *numberString in array) {
        NSInteger number = [numberString integerValue];
        [self checkFor:negativeNumbers number:number];
        if (number < 1001)
            total += number;
    }
    [self guardCondition_rejectNegativeNumbers:negativeNumbers];
    return total;
}

- (void)checkFor:(NSMutableString *)negativeNumbers number:(NSInteger)number {
    if (number < 0)
        [negativeNumbers appendString:[NSString stringWithFormat:@"%d,", number]];
}

- (void)guardCondition_rejectNegativeNumbers:(NSMutableString *)negativeNumbers {
    if ([negativeNumbers length] > 0)
        [NSException raise:@"NegativeNumbersException" format:@"You cannot input negative numbers: %@", negativeNumbers];
}
@end