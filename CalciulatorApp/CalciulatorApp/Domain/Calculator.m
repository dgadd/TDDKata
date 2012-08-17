#import <Foundation/Foundation.h>
#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)sum:(NSString *)numbersToAdd {
    NSArray *const numbersArray = [numbersToAdd componentsSeparatedByString:@","];
    int total = 0;
    for (NSString *numberString in numbersArray) {
            total += [numberString integerValue];
        }
    return total;
}

- (NSInteger)add:(NSString *)numbersToAdd {
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}
@end