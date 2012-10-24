#import <Foundation/Foundation.h>

@protocol IMapLocationRepository;
@protocol IAdManagerRepository;


@interface AppLaunchPresenter : NSObject
@property(nonatomic, strong, readonly) id <IMapLocationRepository> mapLocationRepository;
@property(nonatomic, strong, readonly) id <IAdManagerRepository> adManagerRepository;

- (void)setup;

- (id)initWithMap:(id <IMapLocationRepository>)mapLocationRepository andAdManager:(id <IAdManagerRepository>)adManagerRepository;
@end