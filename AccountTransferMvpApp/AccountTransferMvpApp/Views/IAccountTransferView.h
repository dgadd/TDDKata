#import <Foundation/Foundation.h>

@protocol IAccountTransferView <NSObject>
-(NSNumber *)getTransferAmount;
-(void)setDisplayMessage:(NSString *)message;
@end