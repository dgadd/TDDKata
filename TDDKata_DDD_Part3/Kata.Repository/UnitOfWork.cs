using System;

namespace Kata.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private TransactionStateEnum _transactionState;

        public UnitOfWork()
        {
            _transactionState = TransactionStateEnum.IsBegun;
        }

        public TransactionStateEnum TransactionState
        {
            get {
                return _transactionState;
            }
        }

        public void Commit()
        {
            _transactionState = TransactionStateEnum.CommitRequested;
        }

        public void Dispose()
        {
            _transactionState = TransactionStateEnum.RolledBack;
        }
    }
}