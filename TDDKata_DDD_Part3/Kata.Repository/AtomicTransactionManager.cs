using System;

namespace Kata.Repository
{
    public class AtomicTransactionManager : IAtomicTransactionManager
    {
        private TransactionStateEnum _transactionState;

        public AtomicTransactionManager()
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
    }
}