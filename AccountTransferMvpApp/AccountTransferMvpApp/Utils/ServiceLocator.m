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
            // do nothing
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
    return [[AccountTransferPresenter alloc] initWithRemoteAccount:remoteAccountRepository
                                                                   andLocalAccount:localAccountRepository];

}
@end