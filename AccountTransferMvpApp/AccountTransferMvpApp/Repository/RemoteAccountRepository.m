#import "RemoteAccountRepository.h"


@implementation RemoteAccountRepository {

}
- (void)withdrawAmount:(NSNumber *)amount {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"RemoteAccount WithdrawAmount called."
                                                        message:[NSString stringWithFormat:@"Amount: %@", amount]
                                                       delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];

}


@end