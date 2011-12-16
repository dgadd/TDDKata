#import "Calculator.h"


@implementation Calculator {

}

- (int)sum:(NSString *)numbersToAdd {
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        int total = 0;
        for(NSString *numberString in numbersArray) {
            int number = [numberString intValue];
            if (number < 0)
                [NSException raise:@"NegativeNumbersException" format:@"You cannot input negative numbers"];
            total += number;
        }
            
        return total;
    }

- (BOOL)contains:(NSString *)thisPhrase searchString:(NSString *)theString {
    return [thisPhrase rangeOfString:theString].location != NSNotFound;
}

- (NSString *)handleNewlineDelimiter:(NSString *)inputString {
    return [inputString stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (void)guardCondition_RejectDuplicateDelimiters:(NSString *)inputString {
    if ([self contains:inputString searchString:@",,"])
       [NSException raise:@"DuplicateDelimitersException" format:@"You cannot use duplicate delimiters."];
}

- (NSString *)handleCustomDelimiter:(NSString *)inputString {
    if ([inputString hasPrefix:@"//"])
    {
        NSString *customDelimiter = [inputString substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [inputString substringWithRange:NSMakeRange(4, [inputString length] - 4)];
        inputString = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    }
    return inputString;
}

- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiter:numbersToAdd];
    numbersToAdd = [self handleNewlineDelimiter:numbersToAdd];
    [self guardCondition_RejectDuplicateDelimiters:numbersToAdd];
    if ([self contains:numbersToAdd searchString:@","])
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end