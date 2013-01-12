package com.gaddzeit.presenters.tests.unit;

import org.jmock.Mockery;
import org.junit.Test;

import static org.junit.Assert.assertTrue;

public class SanityCheckTests {
    @Test
    public void sanityCheckJUnit() {
        assertTrue("this should be true", true);
    }

    @Test
    public void sanityCheckJMock() {
        final Mockery mockingContext = new Mockery();

        mockingContext.assertIsSatisfied();
    }
}


