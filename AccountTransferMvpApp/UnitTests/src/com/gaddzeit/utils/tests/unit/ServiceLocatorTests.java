package com.gaddzeit.utils.tests.unit;

import com.gaddzeit.presenters.IPresenter;
import com.gaddzeit.utils.PresenterTypeEnum;
import com.gaddzeit.utils.ServiceLocator;
import org.junit.Test;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public class ServiceLocatorTests {

    @Test
    public void givenSut_whenResolveMethodIsPassedAnEnumValue_thenMatchingPresenterIsReturned() {
        PresenterTypeEnum presenterTypeEnum = PresenterTypeEnum.AccountTransfer;
        IPresenter accountTransferPresenter = ServiceLocator.resolve(presenterTypeEnum);
        assertNotNull("The returned type should not be null", accountTransferPresenter);
        assertTrue("The expected return type should be returned.", accountTransferPresenter instanceof IPresenter);
    }
}
