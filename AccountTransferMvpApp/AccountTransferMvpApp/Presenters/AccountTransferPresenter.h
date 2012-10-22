#import <Foundation/Foundation.h>
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"

@interface AccountTransferPresenter : NSObject
@property(nonatomic, strong) id <IAccountTransferView> accountTransferView;
@property(nonatomic, strong) id <IRemoteAccountRepository> remoteAccountRepository;
@property(nonatomic, strong) id <ILocalAccountRepository> localAccountRepository;

- (void)setup;
@end