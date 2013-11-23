#import "Calculator.h"


@implementation Calculator {

}
- (NSInteger)add:(NSString *)numbersToAdd {
    if([self isCommaFoundIn:numbersToAdd])
        return [self sumTotalFrom:numbersToAdd];

    return (numbersToAdd.length > 0) ? [numbersToAdd integerValue] : 0;
}

- (NSInteger)sumTotalFrom:(NSString *)numbersToAdd {
    NSArray *numberStrings = [numbersToAdd componentsSeparatedByString:@","];
    NSInteger total = 0;
    for(NSString *numberString in numberStrings)
            total += [numberString integerValue];

    return total;
}

- (BOOL)isCommaFoundIn:(NSString *)numbersToAdd {
    return [numbersToAdd rangeOfString:@","].location != NSNotFound;
}
@end