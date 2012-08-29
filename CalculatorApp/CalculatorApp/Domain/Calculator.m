#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiters:numbersToAdd];
    numbersToAdd = [self handleNewLineDelimiters:numbersToAdd];
    [self guardCondition_rejectDuplicateDelimiters:numbersToAdd];
    if([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}

- (NSString *)handleCustomDelimiters:(NSString *)numbersToAdd {
    if([numbersToAdd hasPrefix:@"//"]) {
        NSString *customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [numbersToAdd substringFromIndex:4];
        numbersToAdd = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    }
    return numbersToAdd;
}

- (void)guardCondition_rejectDuplicateDelimiters:(NSString *)numbersToAdd {
    if([numbersToAdd rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot input duplicate delimiters."];
}

- (NSString *)handleNewLineDelimiters:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (NSInteger)sum:(NSString *)numbersToAdd {
    NSInteger total = 0;
    NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
    NSMutableString *negativeNumbers = [NSMutableString string];
    for (NSString *numberString in numbersArray ) {
        NSInteger number = [numberString integerValue];
        [self checkFor:negativeNumbers in:number];
        total += number;
    }
    [self guardCondition_rejectNegativeNumbers:negativeNumbers];
    return total;
}

- (void)guardCondition_rejectNegativeNumbers:(NSMutableString *)negativeNumbers {
    if ([negativeNumbers length] > 0)
        [NSException raise:@"NegativeNumbersException" format:@"You cannot input negative numbers: %@", negativeNumbers];
}

- (void)checkFor:(NSMutableString *)negativeNumbers in:(NSInteger)number {
    if (number < 0)
            [negativeNumbers appendString:[NSString stringWithFormat:@"%i,",number]];
}
@end