#import "RemoteAccountRepository.h"


@implementation RemoteAccountRepository {

}
- (void)withdrawAmount:(NSNumber *)amount {
    NSLog(@"%@ withdrawAmount: %@ called.", [self class], amount);
}

@end