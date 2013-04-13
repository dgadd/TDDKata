#import <Foundation/Foundation.h>

@protocol ILocalAccountRepository <NSObject>
-(void)depositAmount:(NSNumber *)amount;
@end