using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DomainModel.Entities;
using NUnit.Framework;

namespace Tests
{
    [TestFixture]
    public class ProductTests
    {
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
                              ProductId = id, 
                              Name = name, 
                              Description = desc,
                              Price = price,
                              Category = category
                          };

            Assert.AreEqual(id, sut.ProductId);
            Assert.AreEqual(name, sut.Name);
            Assert.AreEqual(desc, sut.Description);
            Assert.AreEqual(price, sut.Price);
            Assert.AreEqual(category, sut.Category);
        }
    }
}
