#import "Calculator.h"


@implementation Calculator {

}
- (NSInteger)add:(NSString *)numbersToAdd {
    if(numbersToAdd.length > 0)
        return [numbersToAdd integerValue];
    return 0;
}
@end