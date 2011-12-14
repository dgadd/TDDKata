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

- (int)add:(NSString *)numbersToAdd {
    NSString *searchString = @",";
    if ([self containsWithin:numbersToAdd searchString:searchString])
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end