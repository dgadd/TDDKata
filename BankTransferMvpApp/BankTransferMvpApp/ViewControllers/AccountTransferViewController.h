#import <UIKit/UIKit.h>
#import "IAccountTransferView.h"

@class AccountTransferPresenter;

@interface AccountTransferViewController : UIViewController  <IAccountTransferView> {
    AccountTransferPresenter *accountTransferPresenter;
}
@property (strong, nonatomic) IBOutlet UITextField *transferAmountText;
- (IBAction)transferFunds:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *transferResultMessage;

@end