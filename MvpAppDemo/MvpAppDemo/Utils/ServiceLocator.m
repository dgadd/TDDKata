#import "ServiceLocator.h"
#import "AppLaunchPresenter.h"
#import "PresenterTypeEnum.h"
#import "IMapLocationRepository.h"
#import "MapLocationRepository.h"


@implementation ServiceLocator {

}

+ (AppLaunchPresenter *)register:(PresenterTypeEnum)presenterTypeEnum {
    id<IMapLocationRepository> mapLocationRepository = [[MapLocationRepository alloc] init];
    return [[AppLaunchPresenter alloc] initWithMapLocation:mapLocationRepository];
}
@end