#import <Foundation/Foundation.h>

@protocol IAccountTransferView;
@protocol IRemoteAccountRepository;
@protocol ILocalAccountRepository;


@interface AccountTransferPresenter : NSObject
@property(nonatomic, strong) id <IAccountTransferView> accountTransferView;

- (id)initWithRemote:(id <IRemoteAccountRepository>)remoteAccountRepository andLocal:(id <ILocalAccountRepository>)localAccountRepository;

- (void)transferAmount;
@end