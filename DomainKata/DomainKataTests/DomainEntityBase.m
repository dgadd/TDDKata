#import "DomainEntityBase.h"


@implementation DomainEntityBase {

}
@synthesize key = _key;


- (DomainEntityBase *)initWithKey:(int)key {
    self = [super init];
    if (self) {
        _key = key;
    }
    return self;
}

- (BOOL)isEqual:(id)object {
    DomainEntityBase *other = (DomainEntityBase *)object;
    return other.key > 0 && _key > 0 && other.key == _key;
}

- (NSUInteger)hash {
    NSNumber *numberForKey = [NSNumber numberWithInt:_key];
    return [numberForKey hash];
}


@end