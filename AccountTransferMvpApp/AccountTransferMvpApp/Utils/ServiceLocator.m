#import "ServiceLocator.h"
#import "PresenterTypeEnum.h"
#import "LocalAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "RemoteAccountRepository.h"
#import "AccountTransferPresenter.h"


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
    return [[AccountTransferPresenter alloc] initWithRemote:remoteAccountRepository andLocal:localAccountRepository];
}
@end