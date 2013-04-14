#import "When_I_ask_to_transfer_amount.h"
#import "AccountTransferPresenter.h"
#import "FakeAccountTransferView.h"

@implementation When_I_ask_to_transfer_amount

// when
- (void)setUp {
    [super setUp];
    [super.accountTransferPresenter transferAmount];
}

-(void)test_it_should_display_the_amount_transferred {
    STAssertEqualObjects(@"$2.5 transferred.", self.fakeAccountTransferView.displayMessage, @"see test title");
}

@end
