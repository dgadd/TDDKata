@protocol ILocalAccountRepository <NSObject>

@required
- (void)depositAmount:(NSNumber *)amount;
@end