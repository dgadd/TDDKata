#import "AppLaunchPresenterTests.h"
#import "OCMockObject.h"
#import "IMapLocationRepository.h"
#import "AppLaunchPresenter.h"

@implementation AppLaunchPresenterTests

- (void)test_whenSetupIsCalled_thenDelegatedMapLocationRepositoryRegisterLocationIsCalled {
    id mapLocationRepository = [OCMockObject mockForProtocol:@protocol(IMapLocationRepository)];
    [[mapLocationRepository expect] registerLocation];

    AppLaunchPresenter *sut = [[AppLaunchPresenter alloc] init];
    sut.mapLocationRepository = (id<IMapLocationRepository>)mapLocationRepository;
    [sut setup];

    [mapLocationRepository verify];
}

@end
