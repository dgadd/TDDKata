using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;

namespace Kata.Repository.Tests.Unit
{
    [TestFixture]
    public class AtomicTransactionManagerTests
    {
        [Test]
        public void Constructor_NoInputs_IsInstanceOfInterface()
        {
            var sut = new AtomicTransactionManager();
            Assert.IsInstanceOf(typeof(IAtomicTransactionManager), sut);
        }
    }
}
