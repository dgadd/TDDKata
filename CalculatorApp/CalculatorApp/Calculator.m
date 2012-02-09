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

- (NSString *)handleNewLineDelimiters:(NSString *)numbers {
    numbers = [numbers stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbers;
}

- (int)add:(NSString *)numbers {
    numbers = [self handleNewLineDelimiters:numbers];
    if ([numbers rangeOfString:@","].location != NSNotFound)
        return [self sum:numbers];
    return [numbers length] > 0 ? [numbers intValue] : 0;
}
@end