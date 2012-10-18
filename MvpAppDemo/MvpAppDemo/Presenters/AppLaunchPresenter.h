#import <Foundation/Foundation.h>

@protocol IMapLocationRepository;


@interface AppLaunchPresenter : NSObject
@property(nonatomic, strong) id <IMapLocationRepository> mapLocationRepository;

- (void)setup;
@end