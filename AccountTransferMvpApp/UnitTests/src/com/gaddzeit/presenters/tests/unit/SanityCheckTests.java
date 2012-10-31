package com.gaddzeit.presenters.tests.unit;

import com.gaddzeit.presenters.ISanityCheck;
import org.jmock.Expectations;
import org.jmock.Mockery;
import org.junit.Test;

public class SanityCheckTests {

    @Test
    public void sanityCheck() {
        Mockery mockingContext = new Mockery();
        final ISanityCheck sanityCheck = mockingContext.mock(ISanityCheck.class);
        mockingContext.checking(new Expectations() {
            {

            }
        });

        mockingContext.assertIsSatisfied();
    }
}
