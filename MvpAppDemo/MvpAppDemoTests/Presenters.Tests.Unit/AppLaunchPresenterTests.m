#import "AppLaunchPresenterTests.h"
#import "OCMockObject.h"
#import "IMapLocationRepository.h"
#import "IAdManagerRepository.h"
#import "AppLaunchPresenter.h"

@implementation AppLaunchPresenterTests

- (void)test_whenSetupIsCalled_thenMapLocationAndAdManagerMethodsAreCalled {
    id mapLocationRepository = [OCMockObject mockForProtocol:@protocol(IMapLocationRepository)];
    [[mapLocationRepository expect] registerLocation];
    id adManagerRepository = [OCMockObject mockForProtocol:@protocol(IAdManagerRepository)];
    [[adManagerRepository expect] registerWithAdManager];

    AppLaunchPresenter *sut = [[AppLaunchPresenter alloc] initWithMapLocation:mapLocationRepository andAdManager:adManagerRepository];
    [sut setup];

    [mapLocationRepository verify];
    [adManagerRepository verify];
}

@end
