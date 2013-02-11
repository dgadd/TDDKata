#import "Given_that_I_have_a_Calculator_with_an_array_of_3_inputs.h"
#import "Calculator.h"

@implementation Given_that_I_have_a_Calculator_with_an_array_of_3_inputs {
    Calculator *_sut;
}
@synthesize sut = _sut;

// given
- (void)setUp {
    [super setUp];
    NSArray *inputs = [NSArray arrayWithObjects:[NSNumber numberWithDouble:35.0], [NSNumber numberWithDouble:22.5], [NSNumber numberWithDouble:12.0], nil];
    _sut = [[Calculator alloc] initWithArrayOfInputs:inputs];
}


@end
