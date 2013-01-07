package com.gaddzeit.repositories;

public class LocalAccountRepository implements ILocalAccountRepository {
    @Override
    public void depositAmount(double amount) {
        System.out.printf("LocalAccountRepository.depositAmount() called with amount %s%n", amount);
    }
}
