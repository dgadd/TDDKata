@protocol IAccountTransferView <NSObject>

@required
-(NSNumber *)getTransferAmount;
-(void)setMessage:(NSString *)message;
@end