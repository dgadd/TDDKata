using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;

namespace Kata.Repository.Tests.Unit
{
    [TestFixture]
    public class UnitOfWorkTests
    {
        [Test]
        public void Constructor_NoInputs_IsInstanceOfInterface()
        {
            var sut = new UnitOfWork();
            Assert.IsInstanceOf(typeof(IUnitOfWork), sut);
        }

        [Test]
        public void Constructor_NoInputs_TransactionStatePropertyEqualsIsBegun()
        {
            IUnitOfWork sut = new UnitOfWork();
            TransactionStateEnum transactionStateEnum = TransactionStateEnum.IsBegun;
            Assert.AreEqual(transactionStateEnum, sut.TransactionState);
        }

        [Test]
        public void CommitMethod_NoInputs_TransactionStatePropertyEqualsCommitRequested()
        {
            IUnitOfWork sut = new UnitOfWork();
            sut.Commit();
            TransactionStateEnum transactionStateEnum = TransactionStateEnum.CommitRequested;
            Assert.AreEqual(transactionStateEnum, sut.TransactionState);
        }

        [Test]
        public void Constructor_NoInputs_IsInstanceOfIDisposable()
        {
            IUnitOfWork sut = new UnitOfWork();
            Assert.IsInstanceOf(typeof(IDisposable), sut);
        }

        [Test]
        public void DisposeMethod_NoInputs_TransactionStatePropertyEqualsRolledBack()
        {
            IUnitOfWork sut = new UnitOfWork();
            sut.Dispose();
            TransactionStateEnum transactionStateEnum = TransactionStateEnum.RolledBack;
            Assert.AreEqual(transactionStateEnum, sut.TransactionState);
        }

        [Test]
        public void CommitThenDisposeMethod_NoInputs_TransactionStatePropertyEqualsCommitted()
        {
            IUnitOfWork sut = new UnitOfWork();
            sut.Commit();
            sut.Dispose();
            TransactionStateEnum transactionStateEnum = TransactionStateEnum.Committed;
            Assert.AreEqual(transactionStateEnum, sut.TransactionState);
        }

    }
}
