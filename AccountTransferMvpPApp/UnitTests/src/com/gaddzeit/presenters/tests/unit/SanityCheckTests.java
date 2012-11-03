package com.gaddzeit.presenters.tests.unit;

import com.gaddzeit.ISanityCheck;
import org.jmock.Mockery;
import org.junit.Test;

public class SanityCheckTests {

    @Test
    public void testSanityCheck() {
        Mockery mockingContext = new Mockery();
        mockingContext.mock(ISanityCheck.class);

        mockingContext.assertIsSatisfied();
    }
}
