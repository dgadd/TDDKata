#import "AppDelegatePresenter.h"
#import "IAppDelegateTabRepository.h"
#import "IExternalAdvertisementManagerRepository.h"


@implementation AppDelegatePresenter {

}
@synthesize appDelegateTabRepository = _appDelegateTabRepository;
@synthesize externalAdvertisementManagerRepository = _externalAdvertisementManagerRepository;


- (id)initWithTabRepository:(id <IAppDelegateTabRepository>)appDelegateTabRepository
    andAdvertisementManager:(id <IExternalAdvertisementManagerRepository>)externalAdvertisementManagerRepository {
    if (self = [super init]) {
        _appDelegateTabRepository = appDelegateTabRepository;
        _externalAdvertisementManagerRepository = externalAdvertisementManagerRepository;
    }

    return self;
}

- (void)applicationSetup {
    [_appDelegateTabRepository configureControllersAtRoot];
    [_externalAdvertisementManagerRepository setUpConnectionToAdvertisementManager];
}
@end