package com.gaddzeit.presenters.tests.unit;

import com.gaddzeit.presenters.AccountTransferPresenter;
import com.gaddzeit.repositories.ILocalAccountRepository;
import com.gaddzeit.repositories.IRemoteAccountRepository;
import com.gaddzeit.views.IAccountTransferView;
import org.jmock.Expectations;
import org.jmock.Mockery;
import org.junit.Test;

public class AccountTransferPresenterTests {

    @Test
    public void givenSut_whenTransferAmountRequested_thenAllDelegatedInterfacesCalled() {
        Mockery mockingContext = new Mockery();
        final IAccountTransferView accountTransferView = mockingContext.mock(IAccountTransferView.class);
        final IRemoteAccountRepository remoteAccountRepository = mockingContext.mock(IRemoteAccountRepository.class);
        final ILocalAccountRepository localAccountRepository = mockingContext.mock(ILocalAccountRepository.class);

        final double amount = 150.0;
        mockingContext.checking(new Expectations() {
            {
                one(accountTransferView).getTransferAmount();
                will(returnValue(amount));
                one(remoteAccountRepository).withdrawAmount(amount);
                one(localAccountRepository).depositAmount(amount);
                one(accountTransferView).setDisplayMessage("$150.0 transferred.");
            }
        });

        final AccountTransferPresenter sut = new AccountTransferPresenter(remoteAccountRepository, localAccountRepository);
        sut.setAccountTransferView(accountTransferView);
        sut.transferAmount();

        mockingContext.assertIsSatisfied();
    }
}
