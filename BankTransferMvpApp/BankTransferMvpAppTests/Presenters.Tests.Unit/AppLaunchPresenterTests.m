#import "AppLaunchPresenterTests.h"
#import "OCMockObject.h"
#import "IMapLocationReository.h"
#import "IAdManagerRepository.h"
#import "AppLaunchPresenter.h"

@implementation AppLaunchPresenterTests

-(void)test_whenSetupIsCalled_thenDelegatedProtocolsAreCalledForMapAndAdvertising {
    id mapLocationRepository = [OCMockObject mockForProtocol:@protocol(IMapLocationReository)];
    id adManagerRepository = [OCMockObject mockForProtocol:@protocol(IAdManagerRepository)];
    [[mapLocationRepository expect] registerLocation];
    [[adManagerRepository expect] registerAdvertising];

    AppLaunchPresenter *sut = [[AppLaunchPresenter alloc] initWithMap:mapLocationRepository andAdManager:adManagerRepository];
    [sut setup];

    [mapLocationRepository verify];
    [adManagerRepository verify];
}

@end
