#import "FakeLocalAccountRepository.h"


@implementation FakeLocalAccountRepository {

}
- (void)depositAmount:(NSNumber *)amount {
    NSLog(@"FakeLocalAccountRepository depositAmount:%@ called.", amount);
}

@end