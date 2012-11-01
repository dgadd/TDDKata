#import "AccountTransferPresenter.h"
#import "ILocalAccountRepository.h"
#import "IRemoteAccountRepository.h"
#import "IAccountTransferView.h"


@interface AccountTransferPresenter ()
@property(nonatomic, strong, readwrite) id <IRemoteAccountRepository> remoteAccountRepository;
@property(nonatomic, strong, readwrite) id <ILocalAccountRepository> localAccountRepository;


@end

@implementation AccountTransferPresenter {

}
@synthesize remoteAccountRepository = _remoteAccountRepository;
@synthesize localAccountRepository = _localAccountRepository;
@synthesize accountTransferView = _accountTransferView;


- (id)initWithRemote:(id <IRemoteAccountRepository>)remoteAccountRepository andLocal:(id <ILocalAccountRepository>)localAccountRepository {
    if (self = [super init]) {
        self.remoteAccountRepository = remoteAccountRepository;
        self.localAccountRepository = localAccountRepository;
    }
    return self;
}

- (void)transferAmount {
    NSNumber *amount = [_accountTransferView getTransferAmount];
    [_remoteAccountRepository withdrawAmount:amount];
    [_localAccountRepository depositAmount:amount];
    [_accountTransferView setDisplayMessage:[NSString stringWithFormat:@"$%@ transferred.", amount]];
}
@end