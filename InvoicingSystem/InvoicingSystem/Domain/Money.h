#import <Foundation/Foundation.h>


@interface Money : NSObject
@property(nonatomic, retain, readonly) NSDecimalNumber *amount;
@property(nonatomic, retain, readonly) NSString *currency;

- (Money *)initWithAmount:(NSDecimalNumber *)amount andCurrency:(NSString *)currency;
@end