package com.gaddzeit.utils.tests.unit;

import com.gaddzeit.presenters.AccountTransferPresenter;
import com.gaddzeit.presenters.Presenterable;
import com.gaddzeit.utils.PresenterTypeEnum;
import com.gaddzeit.utils.ServiceLocator;
import org.junit.Test;

import static org.junit.Assert.assertTrue;

public class ServiceLocatorTests {
    @Test
    public void givenSut_whenResolveMethodPassedAnEnumValue_thenMatchingPresenterReturned() {
        PresenterTypeEnum presenterTypeEnum = PresenterTypeEnum.AccountTransfer;
        Presenterable accountTransferPresenter = ServiceLocator.resolve(presenterTypeEnum);

        assertTrue("Returned type should match", accountTransferPresenter instanceof AccountTransferPresenter);
    }
}
