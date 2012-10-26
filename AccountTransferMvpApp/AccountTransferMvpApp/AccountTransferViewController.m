#import "AccountTransferViewController.h"
#import "ServiceLocator.h"
#import "AccountTransferPresenter.h"

@implementation AccountTransferViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    AccountTransferPresenter *accountTransferPresenter = [ServiceLocator register:AccountTransfer];
    accountTransferPresenter.accountTransferView = self;
    [accountTransferPresenter transferAmount];
}

- (NSNumber *)getTransferAmount {
    return [NSNumber numberWithDouble:150.0];
}

- (void)setMessage:(NSString *)message {
    NSLog(@"Here is the 'set' message in the view controller: %@", message);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end