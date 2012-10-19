#import "ServiceLocator.h"
#import "AppLaunchPresenter.h"
#import "PresenterTypeEnum.h"
#import "MapLocationRepository.h"
#import "AdManagerRepository.h"


@implementation ServiceLocator {

}

+ (AppLaunchPresenter *)register:(PresenterTypeEnum)presenterTypeEnum {
    id<IMapLocationRepository> mapLocationRepository = [[MapLocationRepository alloc] init];
    id<IAdManagerRepository> adManagerRepository = [[AdManagerRepository alloc] init];

    return [[AppLaunchPresenter alloc] initWithMapLocation:mapLocationRepository andAdManager:adManagerRepository];
}
@end