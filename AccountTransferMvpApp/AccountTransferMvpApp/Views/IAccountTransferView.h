@protocol IAccountTransferView <NSObject>

@required
-(NSNumber *)getTransferAmount;
-(void)displayMessage:(NSString *)message;
@end