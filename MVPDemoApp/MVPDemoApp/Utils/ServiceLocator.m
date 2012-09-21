#import "ServiceLocator.h"
#import "BasePresenter.h"
#import "AppDelegatePresenter.h"
#import "IAppDelegateTabRepository.h"
#import "AppDelegateTabRepository.h"
#import "AppDelegate.h"
#import "ExternalAdvertisementManagerRepository.h"


@implementation ServiceLocator {

}
@synthesize serviceType = _serviceType;
@synthesize appDelegate = _appDelegate;


- (BasePresenter *)register:(ServiceType)serviceType {
    if (_appDelegate && serviceType == AppDelegateService) {
        id <IAppDelegateTabRepository> appDelegateTabRepository = [[AppDelegateTabRepository alloc] initWithAppDelegate:_appDelegate];
        id<IExternalAdvertisementManagerRepository> externalAdvertisementManagerRepository = [[ExternalAdvertisementManagerRepository alloc] init];
        return [[AppDelegatePresenter alloc] initWithTabRepository:appDelegateTabRepository
                                           andAdvertisementManager:externalAdvertisementManagerRepository];
    }

    return nil;
}

- (id)initWithAppDelegate:(AppDelegate *)appDelegate {
    if (self = [super init]) {
        _appDelegate = appDelegate;
    }

    return self;
}
@end