#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)contains:(NSString *)input theString:(NSString *)searchString {
    return [input rangeOfString:searchString].location != NSNotFound;
}

- (void)guardCondition_RejectNegativeNumber:(int)number {
    if (number < 0)
                [NSException raise:@"NegativeNumbersException" format:@"You cannot input negative numbers."];
}

- (int)sum:(NSString *)commaDelimitedString {
        int total = 0;
        NSArray *numbersArray = [commaDelimitedString componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray)
        {
            int number = [numberString intValue];
            [self guardCondition_RejectNegativeNumber:number];
            total += number;
        }
            
        return total;
    }

- (NSString *)handleNewLineDelimiter:(NSString *)input {
    input = [input stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return input;
}

- (void)guardCondition_RejectDuplicateDelimiters:(NSString *)numbersToAdd {
    if ([self contains:numbersToAdd theString:@",,"])
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot input duplicate delimiters"];
}

- (NSString *)handleCustomDelimiter:(NSString *)input {
    if ([input hasPrefix:@"//"])
    {
        NSString *customDelimiter = [input substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [input substringWithRange:NSMakeRange(4, [input length] - 4)];
        input = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    }
    return input;
}

- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiter:numbersToAdd];
    numbersToAdd = [self handleNewLineDelimiter:numbersToAdd];
    [self guardCondition_RejectDuplicateDelimiters:numbersToAdd];
    if ([self contains:numbersToAdd theString:@","])
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end