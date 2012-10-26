#import "ServiceLocator.h"
#import "PresenterTypeEnum.h"
#import "LocalAccountRepository.h"
#import "RemoteAccountRepository.h"
#import "AccountTransferPresenter.h"


@implementation ServiceLocator {

}

+ (id)register:(PresenterTypeEnum)presenterTypeEnum {
    switch (presenterTypeEnum) {
        case AppLaunch:
            return nil;
            break;
        case AccountTransfer:
            return [self accountTransferPresenter];
            break;
    }
    return nil;
}

+ (id)accountTransferPresenter {
    id<IRemoteAccountRepository> remoteAccountRepository = [[RemoteAccountRepository alloc] init];
    id<ILocalAccountRepository> localAccountRepository = [[LocalAccountRepository alloc] init];
    AccountTransferPresenter *accountTransferPresenter = [[AccountTransferPresenter alloc] initWithRemote:remoteAccountRepository
                                                                            andLocal:localAccountRepository];
    return accountTransferPresenter;
}
@end