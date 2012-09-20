#import <Foundation/Foundation.h>

@class AppDelegate;


@interface AppDelegateTabRepository : NSObject <IAppDelegateTabRepository>


@property(nonatomic, strong) AppDelegate *appDelegate;

- (id)initWithAppDelegate:(AppDelegate *)appDelegate;
@end