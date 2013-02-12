#import "Given_that_I_have_a_Calculator.h"
#import "Calculator.h"

@implementation Given_that_I_have_a_Calculator
@synthesize sut = _sut;


// given
- (void)setUp {
    [super setUp];
    self.sut = [[Calculator alloc] init];
}


@end
