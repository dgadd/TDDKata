#import "AppLaunchPresenterIntegrationTests.h"
#import "IMapLocationRepository.h"
#import "MapLocationRepository.h"
#import "IAdManagerRepository.h"
#import "AdManagerLocationRepository.h"
#import "AppLaunchPresenter.h"

@implementation AppLaunchPresenterIntegrationTests

- (void)testNotSure {
    id<IMapLocationRepository> mapLocationRepository = [[MapLocationRepository alloc] init];
    id<IAdManagerRepository> adManagerRepository = [[AdManagerLocationRepository alloc] init];

    AppLaunchPresenter *sut = [[AppLaunchPresenter alloc] initWithMap:mapLocationRepository andAdManager:adManagerRepository];
    [sut setup];

    STAssertTrue(true, @"This test should have completed without errors.");
}

@end
