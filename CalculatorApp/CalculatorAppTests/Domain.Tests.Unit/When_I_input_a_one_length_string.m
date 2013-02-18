#import "When_I_input_a_one_length_string.h"
#import "Calculator.h"

@implementation When_I_input_a_one_length_string {
    NSInteger _result;
}

- (void)setUp {
    [super setUp];
    _result = [_sut add:@"3"];
}

-(void)test_it_should_return_the_numeric_equivalent {
    NSInteger expected = 3;
    STAssertEquals(expected, _result, @"see test title");
}
@end
