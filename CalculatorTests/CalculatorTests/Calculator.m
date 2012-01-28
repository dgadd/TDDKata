#import "Calculator.h"


@implementation Calculator {

}

- (int)add:(NSString *)numbersToAdd {
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound) {
        int total = 0;
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        for(NSString *numberString in numbersArray) {
            total += [numberString intValue];
        }
        return total;
    }
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end