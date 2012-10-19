#import <Foundation/Foundation.h>
#import "IMapLocationRepository.h"
#import "IAdManagerRepository.h"

@interface AppLaunchPresenter : NSObject
@property(nonatomic, strong) id <IMapLocationRepository> mapLocationRepository;

@property(nonatomic, strong) id <IAdManagerRepository> adManagerRepository;

- (void)setup;
@end