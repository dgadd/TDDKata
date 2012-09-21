#import "ExternalAdvertisementManagerRepository.h"


@implementation ExternalAdvertisementManagerRepository {

}
- (void)setUpConnectionToAdvertisementManager {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"External Advertising Manager"
                                                        message:@"The external advertising manager functionality is now being called."
                                                       delegate:nil
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"OK", nil];
    [alertView show];
}


@end