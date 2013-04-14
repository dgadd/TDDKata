#import <SenTestingKit/SenTestingKit.h>

@class AccountTransferPresenter;
@class FakeAccountTransferView;

@interface Given_an_account_transfer_presenter : SenTestCase

@property(nonatomic, strong) AccountTransferPresenter *accountTransferPresenter;
@property(nonatomic, strong) FakeAccountTransferView *fakeAccountTransferView;
@end
