using Capstone.Models;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using Capstone.DAO;

namespace Capstone.Tests.DAO
{
    [TestClass]
    class HardinessSqlDaoTests : BaseDaoTests
    {
        private static readonly Hardiness Hardiness_1 = new Hardiness();
        private static readonly Hardiness Hardiness_2 = new Hardiness();

        private Hardiness testHardiness;

        private HardinessSqlDao dao;

        [TestInitialize]
        public override void Setup()
        {
            dao = new HardinessSqlDao(ConnectionString);
            testHardiness = new Hardiness();
            base.Setup();
        }

        [TestMethod]
        public void GetAllHardinessZones_ReturnsAllZones()
        {
            IList<Hardiness> hardinessZones = dao.GetAllHardinessZones();
            Assert.AreEqual(8, hardinessZones.Count);
        }

        private void AssertHardinessZonesMatch(Hardiness expected, Hardiness actual)
        {
            Assert.AreEqual(expected.ZoneId, actual.ZoneId);
            Assert.AreEqual(expected.ZoneName, actual.ZoneName);
            Assert.AreEqual(expected.AvgLastFrostMonth, actual.AvgLastFrostMonth);
            Assert.AreEqual(expected.AvgLastFrostDay, actual.AvgLastFrostDay);
            Assert.AreEqual(expected.AvgFirstFrostMonth, actual.AvgFirstFrostMonth);
            Assert.AreEqual(expected.AvgFirstFrostDay, actual.AvgFirstFrostDay);
            Assert.AreEqual(expected.AvgGrowingDays, actual.AvgGrowingDays);
        }
    }
}
