#import <Foundation/Foundation.h>
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"


@interface AccountTransferPresenter : NSObject
@property(nonatomic, strong) id <IAccountTransferView> accountTransferView;

- (id)initWithRemote:(id <IRemoteAccountRepository>)remoteAccountRepository andLocal:(id <ILocalAccountRepository>)localAccountRepository;

- (void)transferAmount;
@end