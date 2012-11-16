#import "AccountTransferViewController.h"
#import "ServiceLocator.h"
#import "AccountTransferPresenter.h"

@interface AccountTransferViewController ()

@end

@implementation AccountTransferViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    AccountTransferPresenter *accountTransferPresenter = [ServiceLocator resolve:AccountTransfer];
    accountTransferPresenter.accountTransferView = self;
    [accountTransferPresenter transferAmount];
}

- (NSNumber *)getTransferAmount {
    return @150.0;
}

- (void)setDisplayMessage:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Transfer Completed"
                                                        message:message
                                                       delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end