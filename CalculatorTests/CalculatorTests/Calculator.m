#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)thisPhrase aSubstring:(NSString *)thisValue {
    return [thisPhrase rangeOfString:thisValue].location != NSNotFound;
}

- (int)sum:(NSString *)input {
        int total = 0;
        NSArray *numbersArray = [input componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }

- (NSString *)handleNewLineDelimiters:(NSString *)input {
    input = [input stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return input;
}

- (void)guardCondition_RejectDuplicateDelimiters:(NSString *)input {
    if ([self containsWithin:input aSubstring:@",,"])
        [NSException raise:@"DuplicateDelimiterException" format:@"You cannot input duplicate delimiters"];
}

- (NSString *)handleCustomDelimiter:(NSString *)input {
    if ([input hasPrefix:@"//"]) {
        NSString *customDelimiter = [input substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [input substringWithRange:NSMakeRange(4, [input length]-4)];
        input = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    }
    return input;
}

- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiter:numbersToAdd];
    numbersToAdd = [self handleNewLineDelimiters:numbersToAdd];
    [self guardCondition_RejectDuplicateDelimiters:numbersToAdd];
    if ([self containsWithin:numbersToAdd aSubstring:@","])
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end