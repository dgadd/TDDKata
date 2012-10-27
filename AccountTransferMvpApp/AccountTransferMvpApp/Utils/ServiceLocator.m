#import "ServiceLocator.h"
#import "PresenterTypeEnum.h"
#import "LocalAccountRepository.h"
#import "RemoteAccountRepository.h"
#import "AccountTransferPresenter.h"


@implementation ServiceLocator {

}

+ (id)resolve:(PresenterTypeEnum)presenterTypeEnum {
    switch (presenterTypeEnum) {
        case AppLaunch:
            return nil;
        case AccountTransfer:
            return [self newAccountTransferPresenter];
    }
    return nil;
}

+ (AccountTransferPresenter *)newAccountTransferPresenter {
    id<IRemoteAccountRepository> remoteAccountRepository = [[RemoteAccountRepository alloc] init];
    id<ILocalAccountRepository> localAccountRepository = [[LocalAccountRepository alloc] init];
    return [[AccountTransferPresenter alloc] initWithRemoteAccountRepository:remoteAccountRepository
                                                                               localAccountRepository:localAccountRepository];
}
@end