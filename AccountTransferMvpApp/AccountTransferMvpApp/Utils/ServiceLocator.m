#import "ServiceLocator.h"
#import "PresenterTypeEnum.h"
#import "AccountTransferPresenter.h"
#import "LocalAccountRepository.h"
#import "RemoteAccountRepository.h"


@implementation ServiceLocator {

}

+ (id)resolve:(PresenterTypeEnum)presenterTypeEnum {
    switch (presenterTypeEnum) {
        case AppLaunch:
            return nil;
        case AccountTransfer:
            return [self createAccountTransferPresenter];
    }
 return nil;
}

+ (id)createAccountTransferPresenter {
    id<IRemoteAccountRepository> remoteAccountRepository = [[RemoteAccountRepository alloc] init];
    id<ILocalAccountRepository> localAccountRepository = [[LocalAccountRepository alloc] init];
    AccountTransferPresenter *presenter = [[AccountTransferPresenter alloc] initWithRemote:remoteAccountRepository andLocal:localAccountRepository];
    return presenter;
}
@end