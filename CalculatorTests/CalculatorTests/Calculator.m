#import "Calculator.h"


@implementation Calculator {

}

- (int)sum:(NSString *)inputValue {
        NSArray *numbersArray = [inputValue componentsSeparatedByString:@","];
        int total = 0;
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }

- (BOOL)containsWithin:(NSString *)thisPhrase theFollowing:(NSString *)value {
    return [thisPhrase rangeOfString:value].location != NSNotFound;
}

- (NSString *)handleNewLineDelimiter:(NSString *)input {
    return [input stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleNewLineDelimiter:numbersToAdd];
    if ([self containsWithin:numbersToAdd theFollowing:@",,"])
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot input duplicate delimiters."];
    if ([self containsWithin:numbersToAdd theFollowing:@","])
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end