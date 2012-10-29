package com.gaddzeit.repositories;

public class LocalAccountRepository implements ILocalAccountRepository {
    @Override
    public void depositAmount(double amount) {
        System.out.printf("LocalAccountRepository.depositAmount(%s) called.%n", amount);
    }
}
