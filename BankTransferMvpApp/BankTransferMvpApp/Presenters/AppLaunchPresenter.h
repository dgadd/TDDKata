#import <Foundation/Foundation.h>

@protocol IMapLocationReository;
@protocol IAdManagerRepository;


@interface AppLaunchPresenter : NSObject
@property(nonatomic, strong) id <IMapLocationReository> mapLocationRepository;
@property(nonatomic, strong) id <IAdManagerRepository> adManagerRepository;

- (void)setup;
@end