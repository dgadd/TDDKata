package com.gaddzeit.presenters.tests.unit;

import org.jmock.Mockery;
import org.junit.Test;

public class SanityCheckTests {

    @Test
    public void sanityCheck() {
        Mockery mockingContext = new Mockery();

        mockingContext.assertIsSatisfied();
    }
}
