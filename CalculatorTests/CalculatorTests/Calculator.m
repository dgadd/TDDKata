#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)thisString theValue:(NSString *)thisValue {
    return [thisString rangeOfString:thisValue].location != NSNotFound;
}

- (int)sum:(NSString *)numbersToAdd {
    NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
    int total = 0;
    for (NSString *numberString in numbersArray)
        total += [numberString intValue];
    return total;
}

- (NSString *)handleNewLineDelimiter:(NSString *)inputString {
    inputString = [inputString stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return inputString;
}

- (void)guardCondition_RejectDuplicateDelimiters:(NSString *)numbersToAdd {
    if ([self containsWithin:numbersToAdd theValue:@",,"])
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot use duplicate delimiters: %@", numbersToAdd];
}

- (NSString *)handleCustomDelimiter:(NSString *)numbersToAdd {
    if ([numbersToAdd hasPrefix:@"//"])
    {
        NSString *customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [numbersToAdd substringWithRange:NSMakeRange(4, [numbersToAdd length] - 4)];
        numbersToAdd = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    }
    return numbersToAdd;
}

- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiter:numbersToAdd];
    numbersToAdd = [self handleNewLineDelimiter:numbersToAdd];
    [self guardCondition_RejectDuplicateDelimiters:numbersToAdd];
    if ([self containsWithin:numbersToAdd theValue:@","])
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end