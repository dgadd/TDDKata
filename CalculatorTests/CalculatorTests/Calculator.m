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

- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleNewLineDelimiters:numbersToAdd];
    if ([self containsWithin:numbersToAdd aSubstring:@","])
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end