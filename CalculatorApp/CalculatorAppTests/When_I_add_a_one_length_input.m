#import "When_I_add_a_one_length_input.h"
#import "Calculator.h"

@implementation When_I_add_a_one_length_input {
    NSInteger _result;
}

- (void)setUp {
    [super setUp];
    _result = [super.sut add:@"3"];
}

-(void)test_it_should_return_the_numeric_equivalent {
    STAssertEquals(3, _result, @"see test title");
}
@end
