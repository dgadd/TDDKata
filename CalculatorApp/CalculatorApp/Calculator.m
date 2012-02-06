#import "Calculator.h"


@implementation Calculator {

}

- (int)add:(NSString *)numbersToAdd {
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound) {
        int total = 0;
        NSArray *numberArray = [numbersToAdd componentsSeparatedByString:@","];
        for(NSString *numbersString in numberArray) {
            total += [numbersString intValue];
        }
        return total;
    }
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end