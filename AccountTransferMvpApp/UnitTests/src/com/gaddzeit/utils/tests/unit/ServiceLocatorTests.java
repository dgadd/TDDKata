package com.gaddzeit.utils.tests.unit;

import com.gaddzeit.presenters.AccountTransferPresenter;
import com.gaddzeit.presenters.IPresenter;
import com.gaddzeit.utils.PresenterTypeEnum;
import com.gaddzeit.utils.ServiceLocator;
import org.junit.Test;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public class ServiceLocatorTests {

    @Test
    public void givenSut_whenResolveMethodIsPassedEnumValue_thenPresenterIsReturned() {
        PresenterTypeEnum presenterTypeEnum = PresenterTypeEnum.AccountTransferPresenter;
        IPresenter returnedClass = ServiceLocator.resolve(presenterTypeEnum);

        assertNotNull("The returned type should not be null", returnedClass);
        assertTrue("The returned class should match the enum input", returnedClass instanceof AccountTransferPresenter);
    }
}
