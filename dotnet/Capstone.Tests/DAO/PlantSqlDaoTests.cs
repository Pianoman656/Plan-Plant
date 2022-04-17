using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using Capstone.DAO;
using Capstone.Models;

namespace Capstone.Tests.DAO
{
    [TestClass]
    class PlantSqlDaoTests : BaseDaoTests
    {
        private static readonly Plant Plant_1 = new Plant();
        private static readonly Plant Plant_2 = new Plant();
        private static readonly Plant Plant_3 = new Plant();

        private Plant testPlant;

        private PlantSqlDao dao;

        [TestInitialize]
        public override void Setup()
        {
            dao = new PlantSqlDao(ConnectionString);
            testPlant = new Plant();
            base.Setup();
        }

        [TestMethod]
        public void GetPlantById_ReturnsNullWhenIdNotFound()
        {
            Plant plant = dao.GetPlantById(200);
            Assert.IsNull(plant);
        }

        [TestMethod]
        public void GetPlantById_ReturnsCorrectPlantForId()
        {
            Plant plant = dao.GetPlantById(1);
            AssertPlantsMatch(Plant_1, plant);

            plant = dao.GetPlantById(2);
            AssertPlantsMatch(Plant_2, plant);
        }

        [TestMethod]
        public void GetAllPlants_ReturnsAllPlants()
        {
            IList<Plant> plants = dao.GetAllPlants();

            Assert.AreEqual(3, plants.Count);

            AssertPlantsMatch(Plant_1, plants[0]);
            AssertPlantsMatch(Plant_2, plants[1]);
            AssertPlantsMatch(Plant_3, plants[2]);
        }

        [TestMethod]
        public void GetAllPlantsBySunRequirements_ReturnsAllPlantsBySunRequirements(string sun_requirements)
        {
            IList<Plant> plants = dao.GetAllPlantsBySunRequirements("sun");
            Assert.AreEqual(3, plants.Count);
            AssertPlantsMatch(Plant_1, plants[0]);
            AssertPlantsMatch(Plant_3, plants[2]);

            plants = dao.GetAllPlantsBySunRequirements("sun");
            Assert.AreEqual(1, plants.Count);
            AssertPlantsMatch(Plant_3, plants[2]);
        }

        private void AssertPlantsMatch(Plant expected, Plant actual)
        {
            Assert.AreEqual(expected.PlantId, actual.PlantId);
            Assert.AreEqual(expected.CommonName, actual.CommonName);
            Assert.AreEqual(expected.Description, actual.Description);
            Assert.AreEqual(expected.SquareArea, actual.SquareArea);
            Assert.AreEqual(expected.Cost, actual.Cost);
            Assert.AreEqual(expected.SunRequirements, actual.SunRequirements);
            Assert.AreEqual(expected.ImageUrl, actual.ImageUrl);

        }
    }
}
