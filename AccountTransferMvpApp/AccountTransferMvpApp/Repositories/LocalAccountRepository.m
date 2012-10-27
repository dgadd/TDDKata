#import "LocalAccountRepository.h"


@implementation LocalAccountRepository {

}
- (void)depositAmount:(NSNumber *)amount {
    NSLog([NSString stringWithFormat:@"DepositAmount:%@ called",amount]);
}

@end