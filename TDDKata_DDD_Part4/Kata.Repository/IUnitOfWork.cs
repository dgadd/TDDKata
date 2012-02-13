using System;

namespace Kata.Repository
{
    public interface IUnitOfWork : IDisposable
    {
        void Commit();
        TransactionStateEnum TransactionState { get; }
    }
}