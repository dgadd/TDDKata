using DomainModel.Entities;
using NUnit.Framework;

namespace Tests.Unit
{
    [TestFixture]
    public class DomainEntityTests
    {
        [Test]
        public void TwoInstances_SameId_AreEqual()
        {
            const int tempId = 351325;
            var sut1 = new DomainEntity { Id = tempId };
            var sut2 = new DomainEntity { Id = tempId };

            Assert.AreEqual(sut1, sut2);
        }

        [Test]
        public void TwoInstances_DifferentIds_AreNotEqual()
        {
            var sut1 = new DomainEntity { Id = 11235 };
            var sut2 = new DomainEntity { Id = 2439898 };

            Assert.AreNotEqual(sut1, sut2);
        }

        [Test]
        public void TwoInstances_ZeroId_AreNtEqual()
        {
            const int tempId = 0;
            var sut1 = new DomainEntity { Id = tempId };
            var sut2 = new DomainEntity { Id = tempId };

            Assert.AreNotEqual(sut1, sut2);
        }

    }
}
