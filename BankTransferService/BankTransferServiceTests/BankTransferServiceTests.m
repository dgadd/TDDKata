#import <OCMock/OCMock.h>
#import "BankTransferServiceTests.h"
#import "BankTransferService.h"

@implementation BankTransferServiceTests

- (void)setUp {
    [super setUp];  
    sut = [[BankTransferService alloc] init];
}

- (void)testInit_NoInputs_SutIsNotNil {
    STAssertTrue(sut != nil, @"The sut is not null.");
}

- (void)testAuthentication {
    id mock = [OCMockObject partialMockForObject:sut];
    [[mock stub] andCall:@selector(fakeAuthenticationPost:) onObject:self];

    [sut authenticateWithUsername:@"dan" password:@"password"];
}
- (NSString *)fakeAuthenticationPost:(NSString *)request {
    NSArray *d = [request componentsSeparatedByString:@"&"];

    STAssertTrue([d containsObject:@"Email=dan"], @"Username not set correclty into request");
    STAssertTrue([d containsObject:@"Passwd=password"], @"Password not set correctly in request");

    return @"SID=mysid\nLSID=mylsid\nAuth=myauth";
}


@end
