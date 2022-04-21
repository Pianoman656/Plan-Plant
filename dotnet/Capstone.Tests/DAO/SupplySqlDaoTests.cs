using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using Capstone.Models;
using Capstone.DAO;

namespace Capstone.Tests.DAO
{
    [TestClass]
    class SupplySqlDaoTests : BaseDaoTests
    {
        private static readonly Supply Supply_1 = new Supply();
        private static readonly Supply Supply_2 = new Supply();
        private static readonly Supply Supply_3 = new Supply();

        private Supply testSupply;

        private SupplySqlDao dao;

        [TestInitialize]
        public override void Setup()
        {
            dao = new SupplySqlDao(ConnectionString);
            testSupply = new Supply();
            base.Setup();
        }

        [TestMethod]
        public void GetAllSupplies_ReturnsAllSupplies()
        {
            IList<Supply> supplies = dao.GetAllSupplies();
            Assert.AreEqual(3, supplies.Count);
        }

        private void AssertSuppliesMatch(Supply expected, Supply actual)
        {
            Assert.AreEqual(expected.SupplyId, actual.SupplyId);
            Assert.AreEqual(expected.Description, actual.Description);
            Assert.AreEqual(expected.ImageUrl, actual.ImageUrl);
            Assert.AreEqual(expected.SupplyName, actual.SupplyName);
            Assert.AreEqual(expected.SupplyCost, actual.SupplyCost);
        }

    }
}
