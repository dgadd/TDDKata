#import <Foundation/Foundation.h>
#import "IExternalAdvertisementManagerRepository.h"


@interface ExternalAdvertisementManagerRepository : NSObject <IExternalAdvertisementManagerRepository>
- (void)setUpConnectionToAdvertisementManager;


@end