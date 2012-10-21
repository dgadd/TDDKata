#import "ServiceLocator.h"
#import "AccountTransferPresenter.h"
#import "PresenterTypeEnum.h"
#import "LocalAccountRepository.h"
#import "RemoteAccountRepository.h"
#import "AppLaunchPresenter.h"
#import "AdManagerLocationRepository.h"
#import "MapLocationRepository.h"


@implementation ServiceLocator {

}

+ (id)register:(PresenterTypeEnum)presenterType {
    switch (presenterType) {
        case AppLaunch:
            return [self generateAppLaunchPresenter];
        case AccountTransfer:
            return [self generateAccountTransferPresenter];
    }
    return nil;
}

+ (AccountTransferPresenter *)generateAccountTransferPresenter {
    id<IRemoteAccountRepository> remoteAccountRepository = [[RemoteAccountRepository alloc] init];
    id<ILocalAccountRepository> localAccountRepository = [[LocalAccountRepository alloc] init];
    return [[AccountTransferPresenter alloc] initWithRemote:remoteAccountRepository
                                                                                                 andLocal:localAccountRepository];
}

+ (AppLaunchPresenter *)generateAppLaunchPresenter {
    id<IMapLocationRepository> mapLocationRepository = [[MapLocationRepository alloc] init];
    id<IAdManagerRepository> adManagerRepository = [[AdManagerLocationRepository alloc] init];

    return [[AppLaunchPresenter alloc] initWithMap:mapLocationRepository andAdManager:adManagerRepository];
}

@end