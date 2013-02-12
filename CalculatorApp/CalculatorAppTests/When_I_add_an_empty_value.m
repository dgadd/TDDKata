#import "When_I_add_an_empty_value.h"
#import "Calculator.h"

@implementation When_I_add_an_empty_value {
    NSInteger _result;
}

// when
- (void)setUp {
    [super setUp];
    _result = [super.sut add:@""];
}

-(void)test_it_should_return_0 {
    STAssertEquals(0, _result, @"see test title");
}

@end
