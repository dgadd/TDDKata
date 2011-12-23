#import <Foundation/Foundation.h>

@protocol animationNotification

- (void)animationHasFinishedWithView:(UIView *)animatedView;

@optional
- (void)animationStartedWithView:(UIView *)animatedView;

@end

@interface DGAnimationView : UIView {
    id <animationNotification> delegate;
    UIView *boxView;
}

@property(nonatomic, assign) id delegate;

-(void)animate;

@end