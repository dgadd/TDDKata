#import "ServiceLocator.h"
#import "AccountTransferPresenter.h"
#import "PresenterTypeEnum.h"
#import "LocalAccountRepository.h"
#import "RemoteAccountRepository.h"


@implementation ServiceLocator {

}

+ (id)register:(PresenterTypeEnum)presenterType {
    id<IRemoteAccountRepository> remoteAccountRepository = [[RemoteAccountRepository alloc] init];
    id<ILocalAccountRepository> localAccountRepository = [[LocalAccountRepository alloc] init];

    switch (presenterType) {
        case AppLaunch:
            return nil;
        case AccountTransfer:
            return [[AccountTransferPresenter alloc] initWithRemote:remoteAccountRepository
                                                    andLocal:localAccountRepository];
    }
    return nil;
}
@end