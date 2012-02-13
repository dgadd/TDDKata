namespace Kata.Repository
{
    public interface IUnitOfWorkFactory
    {
        IUnitOfWork Create();
    }
}