#import <Foundation/Foundation.h>


@interface Calculator : NSObject
@property(nonatomic, strong) NSArray *inputs;

@property(nonatomic, strong) NSMutableArray *changedInputs;

- (id)initWithArrayOfInputs:(NSArray *)inputs;

- (void)addToInputs:(NSNumber *)number;

- (NSNumber *)sum;
@end