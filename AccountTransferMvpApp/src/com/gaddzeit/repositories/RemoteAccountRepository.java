package com.gaddzeit.repositories;

public class RemoteAccountRepository implements IRemoteAccountRepository {
    @Override
    public void withdrawAmount(double amount) {
        System.out.printf("RemoteAccountRepository.withdrawAmount(%s) called.%n", amount);
    }
}