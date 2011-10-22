using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using NUnit.Framework;

namespace Gaddzeit.Kata.Domain.Tests.Unit
{
    [TestFixture]
    public class GymTests
    {
        [Test]
        public void Constructors_Public_ShouldBeNone()
        {
            var publicConstructors = typeof(Gym).GetConstructors().Where(constructorInfo => constructorInfo.IsPublic);
            Assert.AreEqual(0, publicConstructors.Count());
        }

        [Test]
        public void Constructor_NoInput_IsInstanceOfDomainEntityBase()
        {
            var sut = Gym.Create("Bob's Gym");
            Assert.IsInstanceOf(typeof(DomainEntityBase), sut);
        }
    }
}
