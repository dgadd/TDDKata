package com.gaddzeit.repositories;

public class RemoteAccountRepository implements IRemoteAccountRepository {
    @Override
    public void withdrawAmount(double amount) {
        System.out.printf("%s.withdrawAmount(%s) called.%n", this.getClass().toString(), amount);
    }
}
