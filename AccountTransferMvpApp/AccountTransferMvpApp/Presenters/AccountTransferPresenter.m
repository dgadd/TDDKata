#import "AccountTransferPresenter.h"
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"


@implementation AccountTransferPresenter {

}
@synthesize accountTransferView = _accountTransferView;
@synthesize remoteAccountRepository = _remoteAccountRepository;
@synthesize localAccountRepository = _localAccountRepository;


- (void)transferAmount:(NSNumber *)amount {
    NSNumber *transferAmount = [_accountTransferView getTransferAmount];
    [_remoteAccountRepository withdrawAmount:transferAmount];
    [_localAccountRepository depositAmount:transferAmount];
    [_accountTransferView setResultMessage:[NSString stringWithFormat:@"Transfer of $%@ was successful.",transferAmount]];
}
@end