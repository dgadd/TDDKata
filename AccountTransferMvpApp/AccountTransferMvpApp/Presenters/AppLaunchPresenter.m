#import "AppLaunchPresenter.h"
#import "IMapLocationRepository.h"
#import "IAdManagerRepository.h"


@implementation AppLaunchPresenter {

}
@synthesize mapLocationRepository = _mapLocationRepository;
@synthesize adManagerRepository = _adManagerRepository;


- (void)setup {
    [_mapLocationRepository registerLocation];
    [_adManagerRepository registerAdvertising];
}
@end