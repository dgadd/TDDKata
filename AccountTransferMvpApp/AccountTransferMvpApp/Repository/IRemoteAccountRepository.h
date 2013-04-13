#import <Foundation/Foundation.h>

@protocol IRemoteAccountRepository <NSObject>
-(void)withdrawAmount:(NSNumber *)amount;
@end