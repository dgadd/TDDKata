#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
 return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}
@end