#import "AccountTransferViewController.h"
#import "ServiceLocator.h"
#import "AccountTransferPresenter.h"

@interface AccountTransferViewController ()

@end

@implementation AccountTransferViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    AccountTransferPresenter *accountTransferPresenter = [ServiceLocator register:AccountTransfer];
    accountTransferPresenter.accountTransferView = self;
    [accountTransferPresenter transferAmount];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSNumber *)getTransferAmount {
    return [NSNumber numberWithDouble:150.0];
}

- (void)setMessage:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"View controller message called." message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}


@end