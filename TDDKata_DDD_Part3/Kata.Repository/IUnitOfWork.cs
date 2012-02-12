namespace Kata.Repository
{
    public interface IUnitOfWork
    {
        void Commit();
        TransactionStateEnum TransactionState { get; }
    }
}