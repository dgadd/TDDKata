#import "MapLocationRepository.h"


@implementation MapLocationRepository {

}
- (void)registerLocation {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"MapLocation Registered."
                                                        message:@""
                                                       delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}


@end