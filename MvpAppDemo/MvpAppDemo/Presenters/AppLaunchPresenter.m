#import "AppLaunchPresenter.h"


@implementation AppLaunchPresenter {

}
@synthesize mapLocationRepository = _mapLocationRepository;
@synthesize adManagerRepository = _adManagerRepository;


- (void)setup {
    [_mapLocationRepository registerLocation];
    [_adManagerRepository registerWithAdManager];
}
@end