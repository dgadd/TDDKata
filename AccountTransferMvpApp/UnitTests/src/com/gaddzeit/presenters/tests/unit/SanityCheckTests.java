package com.gaddzeit.presenters.tests.unit;

import com.gaddzeit.repositories.ISanityCheckRepository;
import com.gaddzeit.presenters.SanityCheckPresenter;
import org.jmock.Expectations;
import org.jmock.Mockery;
import org.junit.Test;

import static org.junit.Assert.assertTrue;

public class SanityCheckTests {
    @Test
    public void sanityCheckForJUnit () {
        assertTrue("SanityCheck passes", true);
    }

    @Test
    public void sanityCheckForJMock () {
        Mockery mockingContext = new Mockery();
        final ISanityCheckRepository sanityCheckRepository = mockingContext.mock(ISanityCheckRepository.class);
        final SanityCheckPresenter sut = new SanityCheckPresenter(sanityCheckRepository);
        mockingContext.checking(new Expectations() {
            {
                one(sanityCheckRepository).doSomethingSmall();
                will(returnValue(true));
            }
        });
        sut.doSomethingBig();

        mockingContext.assertIsSatisfied();
    }
}
