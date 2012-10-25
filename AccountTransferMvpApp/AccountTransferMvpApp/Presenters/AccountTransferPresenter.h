#import <Foundation/Foundation.h>
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"

@interface AccountTransferPresenter : NSObject
@property(nonatomic, strong) id <IAccountTransferView> accountTransferView;
@property(nonatomic, strong, readonly) id <IRemoteAccountRepository> remoteAccountRepository;
@property(nonatomic, strong, readonly) id <ILocalAccountRepository> localAccountRepository;

- (void)transferAmount;

- (id)initWithRemote:(id <IRemoteAccountRepository>)remoteAccountRepository andLocal:(id <ILocalAccountRepository>)localAccountRepository;
@end