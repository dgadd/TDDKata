#import "AppLaunchPresenter.h"
#import "IMapLocationRepository.h"


@implementation AppLaunchPresenter {

}
@synthesize mapLocationRepository = _mapLocationRepository;


- (void)setup {
    [_mapLocationRepository registerLocation];
}
@end