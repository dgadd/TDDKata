#import "Calculator.h"


@interface Calculator ()

@end

@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiter:numbersToAdd];
    numbersToAdd = [self handleNewLineDelimiter:numbersToAdd];
    [self guardCondition_duplicateDelimitersNotAllowed:numbersToAdd];
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}

- (NSString *)handleCustomDelimiter:(NSString *)numbersToAdd {
    if (![numbersToAdd hasPrefix:@"//"])
        return numbersToAdd;

    NSString *customDelimiter = @"";
    NSString *suffix = @"";
    if ([numbersToAdd rangeOfString:@"["].location != NSNotFound) {
        NSInteger leftBrace = [numbersToAdd rangeOfString:@"["].location;
        NSInteger rightBrace = [numbersToAdd rangeOfString:@"]"].location;
        NSInteger afterRightBrace = rightBrace + 2;
        customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(leftBrace + 1, rightBrace - leftBrace - 1)];
        suffix = [numbersToAdd substringWithRange:NSMakeRange(afterRightBrace, [numbersToAdd length] - afterRightBrace)];
    }
    else {
        customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(2, 1)];
        suffix = [numbersToAdd substringWithRange:NSMakeRange(4, [numbersToAdd length] - 4)];
    }
    return [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
}

- (void)guardCondition_duplicateDelimitersNotAllowed:(NSString *)numbersToAdd {
    if ([numbersToAdd rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot input duplicate delimiters."];

}

- (NSString *)handleNewLineDelimiter:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (NSInteger)sum:(NSString *)numbersToAdd {
    int total = 0;
    NSArray *array = [numbersToAdd componentsSeparatedByString:@","];
    NSMutableString *negativeNumbers = [NSMutableString string];
    for (NSString *numberString in array) {
        NSInteger number = [numberString integerValue];
        [self accumulateNegativeNumbersFromString:negativeNumbers number:number];
        total = [self incrementTotalWhenLessThanOneThousand:total number:number];
    }
    [self guardCondition_negativeNumbersNotAllowed:negativeNumbers];
    return total;
}

- (void)accumulateNegativeNumbersFromString:(NSMutableString *)negativeNumbers number:(NSInteger)number {
    if (number < 0)
        [negativeNumbers appendString:[NSString stringWithFormat:@"%i,", number]];
}

- (int)incrementTotalWhenLessThanOneThousand:(int)total number:(NSInteger)number {
    if (number < 1001)
        total += number;
    return total;
}

- (void)guardCondition_negativeNumbersNotAllowed:(NSString *)negativeNumbers {
    if ([negativeNumbers length] > 0)
        [NSException raise:@"NegativeNumbersException" format:@"You cannot input negative numbers: %@", negativeNumbers];

}
@end