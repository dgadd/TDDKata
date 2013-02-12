#import "When_I_add_any_length_value.h"
#import "Calculator.h"

@implementation When_I_add_any_length_value {
    NSInteger _result;
    NSInteger _expected;
}


// when
- (void)setUp {
    [super setUp];
    
    NSInteger randomNumberOneTo999 = arc4random() % 999;
    _expected = 0;
    NSMutableString *numbersToAdd = [NSMutableString string];
    for (NSInteger i = 0; i < randomNumberOneTo999; i++) {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        _expected += i;
    }

    _result = [super.sut add:numbersToAdd];
}

-(void)test_it_should_sum_any_length_value_correctly {
    STAssertEquals(_expected, _result, @"see test title");
}
@end
