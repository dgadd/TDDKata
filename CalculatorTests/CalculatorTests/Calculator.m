#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)numbersToAdd theValue:(NSString *)value {
    return [numbersToAdd rangeOfString:value].location != NSNotFound;
}

- (int)add:(NSString *)numbersToAdd {
    if ([self containsWithin:numbersToAdd theValue:@","])
        return 10;
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end