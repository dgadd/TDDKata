#import <Foundation/Foundation.h>
#import "IMapLocationRepository.h"
#import "IAdManagerRepository.h"

@interface AppLaunchPresenter : NSObject
@property(nonatomic, strong, readonly) id <IMapLocationRepository> mapLocationRepository;

@property(nonatomic, strong, readonly) id <IAdManagerRepository> adManagerRepository;

- (void)setup;

- (id)initWithMapLocation:(id <IMapLocationRepository>)mapLocationRepository andAdManager:(id <IAdManagerRepository>)adManagerRepository;
@end