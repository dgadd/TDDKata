using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Kata.Domain;
using NUnit.Framework;

namespace Gaddzeit.Kata.Tests.Unit
{
    [TestFixture]
    public class DomainEntityBaseTests
    {
        [Test]
        public void TwoInstance_SameIdInput_AreEqual()
        {
            const int id = 1325123;
            var sut1 = new DomainEntityBase { Id = id };
            var sut2 = new DomainEntityBase { Id = id };

            Assert.AreEqual(sut1, sut2);
        }

        [Test]
        public void TwoInstance_DifferentIdInput_AreNotEqual()
        {
            var sut1 = new DomainEntityBase { Id = 123512 };
            var sut2 = new DomainEntityBase { Id = 64236 };

            Assert.AreNotEqual(sut1, sut2);
        }
    }
}
