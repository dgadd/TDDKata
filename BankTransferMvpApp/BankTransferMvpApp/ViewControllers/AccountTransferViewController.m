#import "AccountTransferViewController.h"
#import "ServiceLocator.h"
#import "AccountTransferPresenter.h"

@interface AccountTransferViewController ()

@end

@implementation AccountTransferViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    AccountTransferPresenter * accountTransferPresenter = [ServiceLocator register:AccountTransfer];
    accountTransferPresenter.accountTransferView = self;
    [accountTransferPresenter transferBetweenAccounts];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSNumber *)getTransferAmount {
    return [NSNumber numberWithDouble:150.0];
}

- (void)setResultMessage:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"View method setResultMessage hit."
                                                        message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}


@end