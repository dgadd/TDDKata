#import "AppLaunchPresenter.h"
#import "IMapLocationReository.h"
#import "IAdManagerRepository.h"


@implementation AppLaunchPresenter {

}
@synthesize mapLocationRepository = _mapLocationRepository;
@synthesize adManagerRepository = _adManagerRepository;


- (void)setup {
    [_mapLocationRepository registerLocation];
    [_adManagerRepository registerAdvertising];
}

- (id)initWithMap:(id <IMapLocationReository>)mapLocationRepository andAdManager:(id <IAdManagerRepository>)adManagerRepository {
    if (self = [super init]) {
        _mapLocationRepository = mapLocationRepository;
        _adManagerRepository = adManagerRepository;
    }
    return self;
}
@end