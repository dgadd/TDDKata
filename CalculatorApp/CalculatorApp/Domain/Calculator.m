#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}

- (NSInteger)sum:(NSString *)numbersToAdd {
    NSArray *array = [numbersToAdd componentsSeparatedByString:@","];
    int total = 0;
    for (NSString *numberString in array) {
            total += [numberString integerValue];
        }
    return total;
}
@end