#import "Calculator.h"


@implementation Calculator {

}

- (int)add:(NSString *)numbers {
    return [numbers length] > 0 ? [numbers intValue] : 0;
}
@end