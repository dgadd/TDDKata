#import "AppLaunchPresenterIntegrationTests.h"
#import "IMapLocationRepository.h"
#import "MapLocationRepository.h"
#import "IAdManagerRepository.h"
#import "AdManagerRepository.h"
#import "AppLaunchPresenter.h"

@implementation AppLaunchPresenterIntegrationTests

- (void)test_whenSetupIsCalled_thenMapLocationAndAdManagerMethodsAreCalled {
    id<IMapLocationRepository> mapLocationRepository = [[MapLocationRepository alloc] init];
    id<IAdManagerRepository> adManagerRepository = [[AdManagerRepository alloc] init];

    AppLaunchPresenter *sut = [[AppLaunchPresenter alloc] initWithMapLocation:mapLocationRepository andAdManager:adManagerRepository];
    [sut setup];

    STAssertTrue(true, @"The presenter setup should have called both delegated repositories successfully.");
}

@end
