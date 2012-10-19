#import "AdManagerRepository.h"


@implementation AdManagerRepository {

}
- (void)registerWithAdManager {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Register AdManager called" message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}


@end