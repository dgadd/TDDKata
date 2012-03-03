#import "DomainEntityBase.h"


@implementation DomainEntityBase {

@private
    int _Id;
}
@synthesize Id = _Id;

- (BOOL)isEqual:(id)object {
    // if object is null or 0 return false
    // if object is DomainEntityBase and Id equals Id return true
    if (object == nil) return false;
    DomainEntityBase *other = (DomainEntityBase *)object;
    return other.Id == self.Id;
}

- (NSUInteger)hash {
    return (NSUInteger)self.Id;
}


@end