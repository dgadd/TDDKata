#import "ILocalAccountRepository.h"
#import "LocalAccountRepository.h"


@implementation LocalAccountRepository {

}

- (void)depositAmount:(NSNumber *)amount {
    NSLog(@"%@ despositAmount method called with amount: %@", [[self class] description], amount);
}


@end