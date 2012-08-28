#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiter:numbersToAdd];
    numbersToAdd = [self handleNewLineDelimiter:numbersToAdd];
    [self guardCondition_rejectDuplicateDelimiters:numbersToAdd];
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}

- (NSString *)handleCustomDelimiter:(NSString *)numbersToAdd {
    if (![numbersToAdd hasPrefix:@"//"])
        return numbersToAdd;

    if ([numbersToAdd rangeOfString:@"["].location != NSNotFound) {
        NSArray *customDelimiters = [self parseCustomDelimiters:numbersToAdd];

        NSInteger rightBrace = [numbersToAdd rangeOfString:@"]"].location;
        NSString *suffix = [numbersToAdd substringFromIndex:rightBrace + 2];
        for(NSString *delimiter in customDelimiters) {
            suffix = [suffix stringByReplacingOccurrencesOfString:delimiter withString:@","];
        }
        return suffix;
    } else{
        NSString *customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [numbersToAdd substringFromIndex:4];
        return [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    }
}

- (NSArray *)parseCustomDelimiters:(NSString *)numbersToAdd {
    NSInteger endOfPrefix = [numbersToAdd rangeOfString:@"\n"].location;
    NSString *prefix = [numbersToAdd substringWithRange:NSMakeRange(2, endOfPrefix - 2)];
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"[]"];
    NSArray *customDelimiters = [prefix componentsSeparatedByCharactersInSet:characterSet];
    return customDelimiters;
}

- (void)guardCondition_rejectDuplicateDelimiters:(NSString *)numbersToAdd {
    if ([numbersToAdd rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot input duplicate delimiters"];
}

- (NSString *)handleNewLineDelimiter:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (NSInteger)sum:(NSString *)numbersToAdd {
    NSInteger total = 0;
    NSArray *array = [numbersToAdd componentsSeparatedByString:@","];
    NSMutableString *negativeNumbers = [NSMutableString string];
    for (NSString *numberString in array) {
        NSInteger number = [numberString integerValue];
        [self checkForNegativeNumbers:negativeNumbers number:number];
        if (number < 1001)
            total += number;
    }
    [self guardCondition_rejectNegativeNumbers:negativeNumbers];
    return total;
}

- (void)guardCondition_rejectNegativeNumbers:(NSMutableString *)negativeNumbers {
    if ([negativeNumbers length] > 0)
        [NSException raise:@"NegativeNumbersException" format:@"You cannot input negative numbers: %@", negativeNumbers];
}

- (void)checkForNegativeNumbers:(NSMutableString *)negativeNumbers number:(NSInteger)number {
    if (number < 0)
        [negativeNumbers appendString:[NSString stringWithFormat:@"%i,", number]];
}
@end