#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
    if([numbersToAdd rangeOfString:@","].location != NSNotFound) {
        NSInteger total = 0;
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        for (NSString *numberString in numbersArray)
            total += [numberString integerValue];
        return total;
    }
    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}
@end