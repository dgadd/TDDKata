#import <Foundation/Foundation.h>

@protocol IAccountTransferView;
@protocol IRemoteAccountRepository;
@protocol ILocalAccountRepository;


@interface AccountTransferPresenter : NSObject
@property(nonatomic, strong) id <IAccountTransferView> accountTransferView;

@property(nonatomic, strong) id <IRemoteAccountRepository> remoteAccountRepository;

@property(nonatomic, strong) id <ILocalAccountRepository> localAccountRepository;

- (id)initWithRemote:(id <IRemoteAccountRepository>)remoteAccountRepository andLocal:(id <ILocalAccountRepository>)localAccountRepository;

- (void)transferAmount;
@end