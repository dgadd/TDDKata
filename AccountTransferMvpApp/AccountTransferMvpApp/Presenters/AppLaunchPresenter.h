#import <Foundation/Foundation.h>

@protocol IMapLocationRepository;
@protocol IAdManagerRepository;


@interface AppLaunchPresenter : NSObject
@property(nonatomic, strong) id <IMapLocationRepository> mapLocationRepository;
@property(nonatomic, strong) id <IAdManagerRepository> adManagerRepository;

- (void)setup;
@end