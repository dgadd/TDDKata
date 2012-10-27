#import "ViewController.h"
#import "ServiceLocator.h"
#import "AccountTransferPresenter.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (void)displayMessage:(NSString *)message {
    NSLog(message);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end