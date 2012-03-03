#import "Money.h"


@implementation Money {

@private
    NSDecimalNumber *_amount;
    NSString *_currency;
}

@synthesize amount = _amount;
@synthesize currency = _currency;


- (Money *)initWithAmount:(NSDecimalNumber *)amount andCurrency:(NSString *)currency {
    if (self = [super init])
    {
        _amount = amount;
        _currency = currency;
    }
    return self;

}

- (BOOL)isEqual:(id)object {
    if (object == nil) return false;
    Money *other = (Money *)object;
    return [other.currency isEqualToString:self.currency] && [other.amount isEqualToNumber:self.amount];
}

- (NSUInteger)hash {
    return [super hash];  //To change the template use AppCode | Preferences | File Templates.
}

@end