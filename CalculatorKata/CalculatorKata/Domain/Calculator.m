#import "Calculator.h"


@implementation Calculator {

    NSArray *_inputs;
}
@synthesize inputs = _inputs;
@synthesize changedInputs = _changedInputs;


- (id)initWithArrayOfInputs:(NSArray *)inputs {
    if(self = [super init]) {
        _inputs = inputs;
    } return self;
}

- (void)addToInputs:(NSNumber *)number {
    self.changedInputs = [_inputs mutableCopy];
    [self.changedInputs addObject:number];
}

- (NSNumber *)sum {
    double total = 0.0;
    for (NSNumber *number in self.changedInputs) {
        total = total + [number doubleValue];
    }
    return [NSNumber numberWithDouble:total];
}
@end