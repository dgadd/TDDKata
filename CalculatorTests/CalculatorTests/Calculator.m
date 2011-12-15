#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)thePhrase searchString:(NSString *)theString {
    return [thePhrase rangeOfString:theString].location != NSNotFound;
}

- (int)sum:(NSString *)numbersToAdd {
    int total = 0;
    NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
    for (NSString *numberString in numbersArray) {
        int number = [numberString intValue];
        if (number < 0)
            [NSException raise:@"NegativeNumbersException" format:@"You cannot submit negative numbers"];
        total += number;
    }
    return total;
}

- (NSString *)handleNewlineDelimiter:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (void)rejectDuplicateDelimiters:(NSString *)numbersToAdd {
    if ([self containsWithin:numbersToAdd searchString:@",,"])
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot use duplicate delimiters"];
}

- (NSString *)handleCustomDelimiters:(NSString *)numbersToAdd {
    if (![numbersToAdd hasPrefix:@"//"])
        return numbersToAdd;

    NSString *customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(2, 1)];
    NSRange suffixRange = NSMakeRange(4, [numbersToAdd length] - 4);
    NSString *suffix = [numbersToAdd substringWithRange:suffixRange];
    return [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
}

- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiters:numbersToAdd];
    numbersToAdd = [self handleNewlineDelimiter:numbersToAdd];
    [self rejectDuplicateDelimiters:numbersToAdd];
    if ([self containsWithin:numbersToAdd searchString:@","])
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end