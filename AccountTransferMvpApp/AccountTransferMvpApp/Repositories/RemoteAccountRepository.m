#import "RemoteAccountRepository.h"


@implementation RemoteAccountRepository {

}
- (void)withdrawAmount:(NSNumber *)amount {
    NSLog(@"%@ withdrawAmount for amount: %@", [[self class] description], amount);
}

@end