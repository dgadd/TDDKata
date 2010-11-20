using DomainModel.Entities;
using NUnit.Framework;

namespace Tests.Unit
{
    [TestFixture]
    public class ProductTests
    {
        [Test]
        public void Constructor_NoInputs_IsInstanceOfDomainEntity()
        {
            var sut = new Product();
            Assert.IsInstanceOf(typeof(DomainEntity), sut);
        }

        [Test]
        public void Properties_SetValues_MatchGets()
        {
            const int id = 2;
            const string name = "Computer";
            const string desc = "Toshiba laptop";
            const decimal price = 35.00M;
            const string category = "Computers";

            var sut = new Product
                          {
                              Id = id, 
                              Name = name, 
                              Description = desc,
                              Price = price,
                              Category = category
                          };

            Assert.AreEqual(id, sut.Id);
            Assert.AreEqual(name, sut.Name);
            Assert.AreEqual(desc, sut.Description);
            Assert.AreEqual(price, sut.Price);
            Assert.AreEqual(category, sut.Category);
        }
    }
}
