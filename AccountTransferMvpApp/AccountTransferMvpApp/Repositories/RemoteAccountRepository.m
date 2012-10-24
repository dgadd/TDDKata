#import "RemoteAccountRepository.h"


@implementation RemoteAccountRepository {

}
- (void)withdrawAmount:(NSNumber *)amount {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Withdrawn Amount Called"
                                                        message:[NSString stringWithFormat:@"Amount: %@", amount]
                                                       delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}

@end