namespace Kata.Repository
{
    public enum TransactionStateEnum
    {
        None,
        CommitRequested,
        IsBegun,
        RolledBack
    }
}