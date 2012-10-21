#import <Foundation/Foundation.h>

@protocol IMapLocationReository;
@protocol IAdManagerRepository;


@interface AppLaunchPresenter : NSObject
@property(nonatomic, strong, readonly) id <IMapLocationReository> mapLocationRepository;
@property(nonatomic, strong, readonly) id <IAdManagerRepository> adManagerRepository;

- (void)setup;

- (id)initWithMap:(id <IMapLocationReository>)mapLocationRepository andAdManager:(id <IAdManagerRepository>)adManagerRepository;
@end