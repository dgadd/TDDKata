package com.gaddzeit.presenters;

import com.gaddzeit.repositories.ISanityCheckRepository;

public class SanityCheckPresenter {
    private final ISanityCheckRepository _sanityCheckRepository;

    public SanityCheckPresenter(ISanityCheckRepository sanityCheckRepository) {
        _sanityCheckRepository = sanityCheckRepository;
    }

    public void doSomethingBig() {
        _sanityCheckRepository.doSomethingSmall();
    }
}
