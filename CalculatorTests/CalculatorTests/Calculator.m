#import "Calculator.h"


@implementation Calculator {

}

- (int)sum:(NSString *)numbersToAdd {
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        int total = 0;
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }

- (BOOL)contains:(NSString *)thisPhrase searchString:(NSString *)theString {
    return [thisPhrase rangeOfString:theString].location != NSNotFound;
}

- (NSString *)handleNewlineDelimiter:(NSString *)inputString {
    return [inputString stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleNewlineDelimiter:numbersToAdd];
    if ([self contains:numbersToAdd searchString:@","])
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end