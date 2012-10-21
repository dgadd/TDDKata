#import "RemoteAccountRepository.h"


@implementation RemoteAccountRepository {

}
- (void)withdrawAmount:(NSNumber *)amount {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Amount Has Been Withdrawn"
                                                        message:[NSString stringWithFormat:@"Amount: %@", amount]
                                                       delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}


@end