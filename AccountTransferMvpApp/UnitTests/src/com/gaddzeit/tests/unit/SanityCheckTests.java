package com.gaddzeit.tests.unit;

import com.gaddzeit.repositories.ISanityCheck;
import org.jmock.Expectations;
import org.jmock.Mockery;
import org.junit.Test;

import static org.junit.Assert.assertTrue;


public class SanityCheckTests {

    @Test
    public void testSanityCheckForJUnit() {
        assertTrue("Test should be true", true);
    }

    @Test
    public void testSanityCheckForJMock() {
        Mockery mockingContext = new Mockery();
        final ISanityCheck sanityCheck = mockingContext.mock(ISanityCheck.class);
        final Expectations expectations = new Expectations() {
            {
                one(sanityCheck).doSomething();
                will(returnValue(true));
            }
        };
        mockingContext.checking(expectations);

        //mockingContext.assertIsSatisfied();
    }
}
