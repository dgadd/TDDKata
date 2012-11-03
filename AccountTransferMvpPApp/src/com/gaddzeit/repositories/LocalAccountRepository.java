package com.gaddzeit.repositories;

public class LocalAccountRepository implements ILocalAccountRepository {
    @Override
    public void depositAmount(double amount) {
        System.out.printf("%s.depositAmount(%s) called.%n", this.getClass().toString(), amount);
    }
}
