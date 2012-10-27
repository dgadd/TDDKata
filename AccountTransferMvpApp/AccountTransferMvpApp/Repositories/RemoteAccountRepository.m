#import "RemoteAccountRepository.h"


@implementation RemoteAccountRepository {

}
- (void)withdrawAmount:(NSNumber *)amount {
    NSLog([NSString stringWithFormat:@"WithdrawAmount:%@ called",amount]);
}

@end