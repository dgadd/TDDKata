package com.gaddzeit.presenters.tests.integration;

import com.gaddzeit.presenters.AccountTransferPresenter;
import com.gaddzeit.repositories.ILocalAccountRepository;
import com.gaddzeit.repositories.IRemoteAccountRepository;
import com.gaddzeit.repositories.LocalAccountRepository;
import com.gaddzeit.repositories.RemoteAccountRepository;
import com.gaddzeit.views.IAccountTransferView;
import org.jmock.Expectations;
import org.jmock.Mockery;
import org.junit.Test;

public class AccountTransferPresenterIntegrationTests {

    @Test
    public void givenSut_whenTransferAmountIsRequested_thenDelegatedInterfacesAreCalled() {
        Mockery mockingContext = new Mockery();
        final IAccountTransferView accountTransferView = mockingContext.mock(IAccountTransferView.class);
        IRemoteAccountRepository remoteAccountRepository = new RemoteAccountRepository();
        ILocalAccountRepository localAccountRepository = new LocalAccountRepository();

        final double amount = 150.0;

        mockingContext.checking(new Expectations() {
            {
                one(accountTransferView).getTransferAmount();
                will(returnValue(amount));
                one(accountTransferView).setDisplayMessage("$150.0 transferred.");
            }
        });

        final AccountTransferPresenter sut = new AccountTransferPresenter(remoteAccountRepository, localAccountRepository);
        sut.setAccountTransferView(accountTransferView);
        sut.transferAmount();

        mockingContext.assertIsSatisfied();
    }
}
