#import "FakeRemoteAccountRepository.h"


@implementation FakeRemoteAccountRepository {

}
- (void)withdrawAmount:(NSNumber *)amount {
    NSLog(@"FakeRemoteAccountRepository withdrawAmount:%@ called.", amount);
}

@end