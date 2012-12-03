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
    return @150.0;
}

- (void)setDisplayMessage:(NSString *)message {
    NSLog(@"Display message passed to view controller is: %@", message);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end