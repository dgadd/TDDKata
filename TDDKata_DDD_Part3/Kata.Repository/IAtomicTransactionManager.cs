namespace Kata.Repository
{
    public interface IAtomicTransactionManager
    {
        void Commit();
        TransactionStateEnum TransactionState { get; }
    }
}