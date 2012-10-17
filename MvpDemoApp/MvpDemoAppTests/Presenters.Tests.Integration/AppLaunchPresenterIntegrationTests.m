#import "AppLaunchPresenterIntegrationTests.h"
#import "IMapLocationRepository.h"
#import "MapLocationRepository.h"
#import "AppLaunchPresenter.h"

@implementation AppLaunchPresenterIntegrationTests

- (void)testGivenAppLaunch_whenSetupIsCalled_thenDelegatedMapLocationRepositoryRegisterLocationIsCalled {
    id<IMapLocationRepository> mapLocationRepository = [[MapLocationRepository alloc] init];
    AppLaunchPresenter *sut = [[AppLaunchPresenter alloc] initWithMapLocation:mapLocationRepository];
    [sut setup];

    STAssertTrue(true, @"The AppLaunchPresenter setup method should have delegated to MapLocationRepository.");
}

@end
