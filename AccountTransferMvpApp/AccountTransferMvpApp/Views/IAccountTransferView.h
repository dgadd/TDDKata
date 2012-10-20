@protocol IAccountTransferView <NSObject>

@required
-(NSNumber *)getTransferAmount;
-(void)setResultMessage:(NSString *)message;
@end