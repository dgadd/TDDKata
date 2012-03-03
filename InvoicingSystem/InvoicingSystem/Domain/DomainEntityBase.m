#import "DomainEntityBase.h"


@implementation DomainEntityBase {

@private
    int _Id;
}
@synthesize Id = _Id;

- (BOOL)isEqual:(id)object {
    if (object == nil) return false;
    DomainEntityBase *other = (DomainEntityBase *)object;
    return other.Id > 0 && other.Id == self.Id;
}

- (NSUInteger)hash {
    return (NSUInteger)self.Id;
}


@end