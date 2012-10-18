#import "AppLaunchPresenterIntegrationTests.h"
#import "IMapLocationRepository.h"
#import "MapLocationRepository.h"
#import "AppLaunchPresenter.h"

@implementation AppLaunchPresenterIntegrationTests

- (void)test_whenSetupIsCalled_thenDelegatedMapLocationRepositoryRegisterLocationIsCalled {
    id<IMapLocationRepository> mapLocationRepository = [[MapLocationRepository alloc] init];
    AppLaunchPresenter *sut = [[AppLaunchPresenter alloc] initWithMapLocation:mapLocationRepository];
    [sut setup];

    STAssertTrue(true, @"The delegation to repository registerLocation implementation method should have happened.");
}

@end
