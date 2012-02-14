#import "Calculator.h"


@implementation Calculator {

}

- (int)add:(NSString *)numbersToAdd {
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end