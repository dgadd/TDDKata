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
    return [NSNumber numberWithDouble:150.0];
}

- (void)setDisplayMessage:(NSString *)message {
    NSLog(@"AccountTransferViewController is passed result message: %@", message);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end