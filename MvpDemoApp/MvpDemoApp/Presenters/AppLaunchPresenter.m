#import "AppLaunchPresenter.h"
#import "IMapLocationRepository.h"


@implementation AppLaunchPresenter {

}
@synthesize mapLocationRepository = _mapLocationRepository;


- (void)setup {
    [_mapLocationRepository registerLocation];
}

- (id)initWithMapLocation:(id <IMapLocationRepository>)mapLocationRepository {
    if(self = [super init]) {
        _mapLocationRepository = mapLocationRepository;
    }
    return self;
}
@end