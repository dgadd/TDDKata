#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)thePhrase searchString:(NSString *)theString {
    return [thePhrase rangeOfString:theString].location != NSNotFound;
}

- (int)sum:(NSString *)numbersToAdd {
        int total = 0;
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }

- (NSString *)handleNewlineDelimiter:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleNewlineDelimiter:numbersToAdd];
    if ([self containsWithin:numbersToAdd searchString:@",,"])
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot use duplicate delimiters"];
    if ([self containsWithin:numbersToAdd searchString:@","])
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end