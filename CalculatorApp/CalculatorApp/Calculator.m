#import "Calculator.h"


@implementation Calculator {

}

- (int)sum:(NSString *)numbers {
        int total = 0;
        NSArray *numbersArray = [numbers componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray) {
            total += [numberString intValue];
        }
        return total;
    }

- (BOOL)containsWithin:(NSString *)numbers theValue:(NSString *)someValue {
    return [numbers rangeOfString:someValue].location != NSNotFound;
}

- (int)add:(NSString *)numbers {
    if ([self containsWithin:numbers theValue:@","])
        return [self sum:numbers];
    return [numbers length] > 0 ? [numbers intValue] : 0;
}
@end