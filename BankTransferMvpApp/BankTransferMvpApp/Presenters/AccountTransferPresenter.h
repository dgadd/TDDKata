#import <Foundation/Foundation.h>
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"


@interface AccountTransferPresenter : NSObject
@property(nonatomic, strong, readonly) id <IAccountTransferView> accountTransferView;

@property(nonatomic, strong, readonly) id <IRemoteAccountRepository> remoteAccountRepository;

@property(nonatomic, strong, readonly) id <ILocalAccountRepository> localAccountRepository;

- (void)transferBetweenAccounts;

- (id)initWithView:(id <IAccountTransferView>)accountTransferView andRemote:(id <IRemoteAccountRepository>)remoteAccountRepository andLocal:(id <ILocalAccountRepository>)localAccountRepository;
@end