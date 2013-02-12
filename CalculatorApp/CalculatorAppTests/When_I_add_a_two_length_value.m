#import "When_I_add_a_two_length_value.h"
#import "Calculator.h"

@implementation When_I_add_a_two_length_value
@synthesize result = _result;


//when
- (void)setUp {
    [super setUp];
    self.result = [super.sut add:@"3,5"];
}

-(void)test_it_should_return_a_sum_of_the_inputs {
    STAssertEquals(8, self.result, @"see test title");
}

@end
