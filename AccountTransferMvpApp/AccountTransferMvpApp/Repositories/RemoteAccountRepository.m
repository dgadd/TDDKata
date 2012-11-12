#import "IRemoteAccountRepository.h"
#import "RemoteAccountRepository.h"


@implementation RemoteAccountRepository {

}
- (void)withdrawAmount:(NSNumber *)amount {
    NSLog(@"%@ withdrawAmount method called with %@ amount", [[self class] description], amount);
}


@end