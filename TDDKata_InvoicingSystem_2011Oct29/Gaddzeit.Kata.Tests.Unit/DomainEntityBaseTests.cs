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
        // alternate name: Constructor_SameIdInputs_AreEqual
        public void Two_instances_of_DomainEntityBase_are_equal_when_they_have_the_same_ID_values()
        {
            const int Id = 15253;
            var sut1 = new DomainEntityBase { Id = Id };
            var sut2 = new DomainEntityBase { Id = Id };

            Assert.AreEqual(sut1, sut2);
        }

        [Test]
        // alternate name: Constructor_DifferentIdInputs_AreNotEqual
        public void Two_instances_of_DomainEntityBase_are_not_equal_when_they_have_different_ID_values()
        {
            var sut1 = new DomainEntityBase { Id = 123512 };
            var sut2 = new DomainEntityBase { Id = 1123 };

            Assert.AreNotEqual(sut1, sut2);
        }
    }
}
