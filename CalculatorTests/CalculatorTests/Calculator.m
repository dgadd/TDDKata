#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)thisPhrase aSubstring:(NSString *)thisValue {
    return [thisPhrase rangeOfString:thisValue].location != NSNotFound;
}

- (int)add:(NSString *)numbersToAdd {
    if ([self containsWithin:numbersToAdd aSubstring:@","])
    {
        int total = 0;
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end