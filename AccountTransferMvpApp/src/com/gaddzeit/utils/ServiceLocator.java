package com.gaddzeit.utils;

import com.gaddzeit.presenters.AccountTransferPresenter;
import com.gaddzeit.presenters.IPresenter;
import com.gaddzeit.repositories.ILocalAccountRepository;
import com.gaddzeit.repositories.IRemoteAccountRepository;
import com.gaddzeit.repositories.LocalAccountRepository;
import com.gaddzeit.repositories.RemoteAccountRepository;

public class ServiceLocator {
    public static IPresenter resolve(PresenterTypeEnum presenterTypeEnum) {
        switch(presenterTypeEnum) {
            case AppLaunch:
                return null;
            case AccountTransfer:
                return createAccountTransferPresenter();
        }
        return null;
    }

    private static IPresenter createAccountTransferPresenter() {
        IRemoteAccountRepository remoteAccountRepository = new RemoteAccountRepository();
        ILocalAccountRepository localAccountRepository = new LocalAccountRepository();
        return new AccountTransferPresenter(remoteAccountRepository, localAccountRepository);
    }
}
