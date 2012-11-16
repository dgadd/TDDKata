#import "LocalAccountRepository.h"


@implementation LocalAccountRepository {

}
- (void)depositAmount:(NSNumber *)amount {
    NSLog(@"%@ depositAmount for amount: %@", [[self class] description], amount);
}


@end