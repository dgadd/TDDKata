#import <Foundation/Foundation.h>
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"

@interface AccountTransferPresenter : NSObject
@property(nonatomic, strong) id <IAccountTransferView> accountTransferView;
@property(nonatomic, strong, readonly) id <IRemoteAccountRepository> remoteAccountRepository;
@property(nonatomic, strong, readonly) id <ILocalAccountRepository> localAccountRepository;

- (id)initWithRemoteAccountRepository:(id <IRemoteAccountRepository>)remoteAccountRepository localAccountRepository:(id <ILocalAccountRepository>)localAccountRepository;


- (void)transferAmount;
@end