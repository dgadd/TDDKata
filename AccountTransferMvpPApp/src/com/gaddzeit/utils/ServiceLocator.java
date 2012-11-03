package com.gaddzeit.utils;

import com.gaddzeit.presenters.AccountTransferPresenter;
import com.gaddzeit.presenters.Presenterable;
import com.gaddzeit.repositories.ILocalAccountRepository;
import com.gaddzeit.repositories.IRemoteAccountRepository;
import com.gaddzeit.repositories.LocalAccountRepository;
import com.gaddzeit.repositories.RemoteAccountRepository;

public class ServiceLocator {
    public static Presenterable resolve(PresenterTypeEnum presenterTypeEnum) {
        switch(presenterTypeEnum) {
            case AccountTransfer:
                return createAccountTransferPresenter();
        }
        return null;
    }

    private static Presenterable createAccountTransferPresenter() {
        IRemoteAccountRepository remoteAccountRepository = new RemoteAccountRepository();
        ILocalAccountRepository localAccountRepository = new LocalAccountRepository();
        return new AccountTransferPresenter(remoteAccountRepository, localAccountRepository);
    }
}
