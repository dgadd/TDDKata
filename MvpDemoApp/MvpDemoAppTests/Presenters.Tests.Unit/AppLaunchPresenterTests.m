#import "AppLaunchPresenterTests.h"
#import "OCMockObject.h"
#import "IMapLocationRepository.h"
#import "AppLaunchPresenter.h"

@implementation AppLaunchPresenterTests

- (void)testGivenAppLaunch_whenSetupIsCalled_thenDelegatedMapLocationRepositoryRegisterLocationIsCalled {
    id mapLocationRepository = [OCMockObject mockForProtocol:@protocol(IMapLocationRepository)];
    [[mapLocationRepository expect] registerLocation];

    AppLaunchPresenter *sut = [[AppLaunchPresenter alloc] initWithMapLocation:mapLocationRepository];
    [sut setup];

    [mapLocationRepository verify];
}

@end
