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
            switch(_transactionState)
            {
                case TransactionStateEnum.CommitRequested:
                    _transactionState = TransactionStateEnum.Committed;
                    break;
                default:
                    _transactionState = TransactionStateEnum.RolledBack;
                    break;
            }
        }
    }
}