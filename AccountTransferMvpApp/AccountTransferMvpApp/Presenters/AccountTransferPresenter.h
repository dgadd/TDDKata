#import <Foundation/Foundation.h>
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"

@interface AccountTransferPresenter : NSObject
@property(nonatomic, strong, readonly) id <IAccountTransferView> accountTransferView;
@property(nonatomic, strong, readonly) id <IRemoteAccountRepository> remoteAccountRepository;
@property(nonatomic, strong, readonly) id <ILocalAccountRepository> localAccountRepository;

- (void)setup;

- (id)initWithView:(id <IAccountTransferView>)accountTransferView andRemoteAccount:(id <IRemoteAccountRepository>)remoteAccountRepository andLocalAccount:(id <ILocalAccountRepository>)localAccountRepository;
@end