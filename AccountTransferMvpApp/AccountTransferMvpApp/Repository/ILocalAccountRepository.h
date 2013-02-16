@protocol ILocalAccountRepository <NSObject>

@required
-(void)transferToAmount:(NSNumber *)amount;
@end