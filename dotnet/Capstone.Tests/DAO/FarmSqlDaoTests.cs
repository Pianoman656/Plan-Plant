using Capstone.DAO;
using Capstone.Models;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;

namespace Capstone.Tests.DAO
{
    [TestClass]
    class FarmSqlDaoTests : BaseDaoTests
    {
        private static readonly Farm Farm_1 = new Farm();
        private static readonly Farm Farm_2 = new Farm();

        private Farm testFarm;

        private FarmSqlDao dao;

        [TestInitialize]
        public override void Setup()
        {
            dao = new FarmSqlDao(ConnectionString);
            testFarm = new Farm();
            base.Setup();
        }

        [TestMethod]
        public void GetFarm_ReturnsCorrectFarmForId()
        {
            Farm farm = dao.GetFarm(1);
            AssertFarmsMatch(Farm_1, farm);

            farm = dao.GetFarm(2);
            AssertFarmsMatch(Farm_2, farm);
        }

        private void AssertFarmsMatch(Farm expected, Farm actual)
        {
            Assert.AreEqual(expected.FarmId, actual.FarmId);
            Assert.AreEqual(expected.UserId, actual.UserId);
        }
    }
}
