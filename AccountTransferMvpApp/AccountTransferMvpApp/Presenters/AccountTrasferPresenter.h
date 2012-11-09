#import <Foundation/Foundation.h>
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "IAccountTransferView.h"

@interface AccountTrasferPresenter : NSObject
@property(nonatomic, strong) id <IRemoteAccountRepository> remoteAccountRepository;

@property(nonatomic, strong) id <ILocalAccountRepository> localAccountRepository;

@property(nonatomic, strong) id <IAccountTransferView> accountTransferView;

- (id)initWithRemote:(id <IRemoteAccountRepository>)remoteAccountRepository andLocal:(id <ILocalAccountRepository>)localAccountRepository;

- (void)transferAmount;
@end