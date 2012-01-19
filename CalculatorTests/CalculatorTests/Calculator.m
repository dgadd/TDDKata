#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)numbersToAdd theValue:(NSString *)value {
    return [numbersToAdd rangeOfString:value].location != NSNotFound;
}

- (void)guardCondtion_RejectNegativeNumbers:(int)number {
    if (number < 0)
                [NSException raise:@"NegativeNumbersException" format:@"You cannot input negative numbers."];
}

- (int)sum:(NSString *)numbersToAdd {
        int total = 0;
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray) {
            int number = [numberString intValue];
            [self guardCondtion_RejectNegativeNumbers:number];
            if (number < 1001)
                total += number;
        }
        return total;
    }

- (void)guardCondition_RejectDuplicateDelimiters:(NSString *)numbersToAdd {
    if ([self containsWithin:numbersToAdd theValue:@",,"])
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot input duplicate delimiters."];
}

- (NSString *)handleMultiLengthCustomDelimiter:(NSString *)numbersToAdd {
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"/[]"];
            NSArray *delimiters = [numbersToAdd componentsSeparatedByCharactersInSet:set];
            NSMutableArray *delimitersM = [NSMutableArray arrayWithArray:delimiters];
            NSString *suffix = delimitersM.lastObject;
            [delimitersM removeLastObject];
            for(NSString *customDelimiter in delimitersM) {
                suffix = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
            }
            return suffix;
        }

- (NSString *)handleCustomDelimiter:(NSString *)numbersToAdd {
    if ([numbersToAdd hasPrefix:@"//"]) {
        if ([numbersToAdd hasPrefix:@"//["])
            return [self handleMultiLengthCustomDelimiter:numbersToAdd];
        NSString *customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [numbersToAdd substringWithRange:NSMakeRange(4, [numbersToAdd length] -4)];
        return [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    }
    return numbersToAdd;
}

- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiter:numbersToAdd];
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    [self guardCondition_RejectDuplicateDelimiters:numbersToAdd];
    if ([self containsWithin:numbersToAdd theValue:@","])
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end