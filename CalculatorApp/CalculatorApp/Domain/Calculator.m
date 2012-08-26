#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
    if([numbersToAdd rangeOfString:@","].location > 0)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}

- (NSInteger)sum:(NSString *)numbersToAdd {
    NSArray *array = [numbersToAdd componentsSeparatedByString:@","];
    NSInteger total = 0;
    for (NSString *numberString in array) {
            total += [numberString integerValue];
        }
    return total;
}
@end