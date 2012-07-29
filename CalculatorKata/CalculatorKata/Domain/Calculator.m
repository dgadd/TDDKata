#import <Foundation/Foundation.h>
#import "Calculator.h"


@interface Calculator ()
- (int)sum:(NSString *)numbersToAdd;

@end

@implementation Calculator {

}

- (int)add:(NSString *)numbersToAdd {
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}

- (int)sum:(NSString *)numbersToAdd {
    NSArray *const numbersArray = [numbersToAdd componentsSeparatedByString:@","];
    int total = 0;
    for(NSString *numberString in numbersArray)
            total += [numberString intValue];
    return total;
}

@end