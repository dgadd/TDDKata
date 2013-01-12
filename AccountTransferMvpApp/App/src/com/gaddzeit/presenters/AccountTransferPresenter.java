package com.gaddzeit.presenters;

import com.gaddzeit.repositories.ILocalAccountRepository;
import com.gaddzeit.repositories.IRemoteAccountRepository;
import com.gaddzeit.views.IAccountTransferView;

public class AccountTransferPresenter {
    private final IRemoteAccountRepository _remoteAccountRepository;
    private final ILocalAccountRepository _localAccountRepository;
    private IAccountTransferView _accountTransferView;

    public AccountTransferPresenter(IRemoteAccountRepository remoteAccountRepository, ILocalAccountRepository localAccountRepository) {
        _remoteAccountRepository = remoteAccountRepository;
        _localAccountRepository = localAccountRepository;
    }

    public void setView(IAccountTransferView accountTransferView) {

        _accountTransferView = accountTransferView;
    }

    public void transferAmount() {
        final double amount = _accountTransferView.getTransferAmount();
        _remoteAccountRepository.withdrawAmount(amount);
        _localAccountRepository.depositAmount(amount);
        _accountTransferView.setDisplayMessage(String.format("$%s transferred.", amount));
    }
}
