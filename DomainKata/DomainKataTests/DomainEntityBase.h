#import <Foundation/Foundation.h>


@interface DomainEntityBase : NSObject
@property(nonatomic, assign) int key;

- (DomainEntityBase *)initWithKey:(int)eky;
@end