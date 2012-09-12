#import <Foundation/Foundation.h>


@interface AppDelegateTabRepository : NSObject <IAppDelegateTabRepository>


@property(nonatomic, strong) UIWindow *window;
@property(nonatomic, strong) UITabBarController *tabBarController;

- (id)initWithWindow:(UIWindow *)window andTabBarController:(UITabBarController *)tabBarController;
@end