#import "AppLaunchPresenter.h"


@implementation AppLaunchPresenter {

}
@synthesize mapLocationRepository = _mapLocationRepository;
@synthesize adManagerRepository = _adManagerRepository;


- (void)setup {
    [_mapLocationRepository registerLocation];
    [_adManagerRepository registerWithAdManager];
}

- (id)initWithMapLocation:(id <IMapLocationRepository>)mapLocationRepository andAdManager:(id <IAdManagerRepository>)adManagerRepository {
    if(self = [super init]) {
        _mapLocationRepository = mapLocationRepository;
        _adManagerRepository = adManagerRepository;
    }
    return self;
}
@end