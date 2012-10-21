#import "AccountTransferViewController.h"
#import "ServiceLocator.h"
#import "AccountTransferPresenter.h"

@interface AccountTransferViewController ()

@end

@implementation AccountTransferViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    accountTransferPresenter = [ServiceLocator register:AccountTransfer];
    accountTransferPresenter.accountTransferView = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSNumber *)getTransferAmount {
    NSNumberFormatter *numberFormat = [[NSNumberFormatter alloc] init];
    [numberFormat setNumberStyle:NSNumberFormatterDecimalStyle];
    return [numberFormat numberFromString:self.transferAmountText.text];
}

- (void)setResultMessage:(NSString *)message {
    self.transferResultMessage.text = message;
}


- (IBAction)transferFunds:(id)sender {
    [accountTransferPresenter transferBetweenAccounts];
}
@end