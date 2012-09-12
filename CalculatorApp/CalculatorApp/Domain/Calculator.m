#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiters:numbersToAdd];
    numbersToAdd = [self handleNewLineDelimiter:numbersToAdd];
    [self guardCondition_duplicateDelimitersAreRejectedFor:numbersToAdd];
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}

- (NSString *)handleCustomDelimiters:(NSString *)numbersToAdd {
    if (![numbersToAdd hasPrefix:@"//"])
        return numbersToAdd;

    NSInteger rightBrace = [numbersToAdd rangeOfString:@"]"].location;
    if (rightBrace != NSNotFound)
        return [self handleMultiLengthIn:numbersToAdd from:rightBrace];

    NSString *customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(2, 1)];
    NSString *suffix = [numbersToAdd substringFromIndex:4];
    return [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
}

- (NSString *)handleMultiLengthIn:(NSString *)numbersToAdd from:(NSInteger)rightBrace {
        NSString *prefix = [numbersToAdd substringToIndex:rightBrace];
        NSString *suffix = [numbersToAdd substringFromIndex:rightBrace + 2];
        NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"[]"];
        NSArray *customDelimiters = [prefix componentsSeparatedByCharactersInSet:characterSet];
        for (NSString *customDelimiter in customDelimiters) {
            suffix = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
        }
        return suffix;
    }

- (void)guardCondition_duplicateDelimitersAreRejectedFor:(NSString *)numbersToAdd {
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
        [self checkFor:negativeNumbers in:number];
        if(number < 1001)
            total += number;
    }
    [self guardCondition_negativeNumbersAreRejectedFor:negativeNumbers];
    return total;
}

- (void)guardCondition_negativeNumbersAreRejectedFor:(NSMutableString *)negativeNumbers {
    if ([negativeNumbers length] > 0)
        [NSException raise:@"NegativeNumbersException" format:@"You cannot input negative numbers: %@", negativeNumbers];
}

- (void)checkFor:(NSMutableString *)negativeNumbers in:(NSInteger)number {
    if (number < 0)
            [negativeNumbers appendString:[NSString stringWithFormat:@"%i,", number]];
}
@end