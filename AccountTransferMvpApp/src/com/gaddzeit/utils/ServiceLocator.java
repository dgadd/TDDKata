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
            case AccountTransferPresenter:
                return buildAccountTransferPresenter();
        }
        return null;
    }

    private static IPresenter buildAccountTransferPresenter() {
        IRemoteAccountRepository remoteAccountRepository = new RemoteAccountRepository();
        ILocalAccountRepository localAccountRepository = new LocalAccountRepository();

        final AccountTransferPresenter accountTransferPresenter = new AccountTransferPresenter(remoteAccountRepository, localAccountRepository);
        return accountTransferPresenter;
    }
}
