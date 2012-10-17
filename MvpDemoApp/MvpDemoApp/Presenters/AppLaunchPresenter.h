#import <Foundation/Foundation.h>

@protocol IMapLocationRepository;


@interface AppLaunchPresenter : NSObject
@property(nonatomic, strong, readonly) id <IMapLocationRepository> mapLocationRepository;

- (void)setup;

- (id)initWithMapLocation:(id <IMapLocationRepository>)mapLocationRepository;
@end