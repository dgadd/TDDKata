#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
    if([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}

- (NSInteger)sum:(NSString *)numbersToAdd {
        int total = 0;
        NSArray *array = [numbersToAdd componentsSeparatedByString:@","];
        for (NSString *number in array)
            total += [number integerValue];
        return total;
    }
@end