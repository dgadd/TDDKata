#import "ServiceLocator.h"
#import "PresenterTypeEnum.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "RemoteAccountRepository.h"
#import "LocalAccountRepository.h"
#import "AccountTransferPresenter.h"


@implementation ServiceLocator {

}

+ (id)register:(PresenterTypeEnum)presenterTypeEnum {
    switch (presenterTypeEnum) {
        case AppLaunch:
            return nil;
            break;
        case AccountTransfer:
            return [self instantiateAccountTransferPresenter];
            break;
    }
    return nil;
}

+ (id)instantiateAccountTransferPresenter {
    id<IRemoteAccountRepository> remoteAccountRepository = [[RemoteAccountRepository alloc] init];
    id<ILocalAccountRepository> localAccountRepository = [[LocalAccountRepository alloc] init];

    AccountTransferPresenter *accountTransferPresenter = [[AccountTransferPresenter alloc] initWithRemote:remoteAccountRepository
                                                                            andLocal:localAccountRepository];
    return accountTransferPresenter;
}
@end