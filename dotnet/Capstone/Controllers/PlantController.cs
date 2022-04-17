using Capstone.DAO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;
using Microsoft.AspNetCore.Authorization;

namespace Capstone.Controllers
{   // route: /Plant/
    [Route("[controller]")]
    [ApiController]
    public class PlantController : ControllerBase
    {
        private readonly IPlantDao PlantSqlDao;
        public PlantController(IPlantDao plantDao)
        {
            PlantSqlDao = plantDao;
        }

        // get request to /Plant/
        [HttpGet()]
        public ActionResult<List<Plant>> ListAllPlants()
        {
            return PlantSqlDao.GetAllPlants();
        }

        [HttpGet("id/{id}")]
        public ActionResult<Plant> GetPlantById(int id)
        {
            return PlantSqlDao.GetPlantById(id);
        }


        // post request to /Plant/ only admin can access
        [HttpPost()]
        [Authorize(Roles = "admin")]
        public IActionResult AddNewPlant(Plant plantToAdd)
        {
            Plant newPlant = PlantSqlDao.AddPlant(plantToAdd);

            if (newPlant != null && newPlant.Description == plantToAdd.Description)
                return Ok();
            else
                return StatusCode(409);
        }

        //put request to /Plant/{plantId} only admin can access
        [HttpPut("{plantId}")]
        [Authorize(Roles = "admin")]
        public IActionResult UpdatePlant(int plantId, Plant plantToUpdate)
        {
            Plant updatedPlant = PlantSqlDao.UpdatePlant(plantId, plantToUpdate);

            if (updatedPlant != null && updatedPlant.Description == plantToUpdate.Description && updatedPlant.CommonName == plantToUpdate.CommonName)
                return Ok();
            else
                return StatusCode(409);
        }

        //get request for plants based on their sun exposure
        [HttpGet("sun/{sun_requirements}")]
        public ActionResult<List<Plant>> ListAllPlantsBySunRequirements(string sun_requirements)
        {
            return PlantSqlDao.GetAllPlantsBySunRequirements(sun_requirements);
        }

        //get request for list of all plants based on plot id
        [HttpGet("{plot_id}")]
        [Authorize]
        public ActionResult<List<Plant>> ListAllPlantsByPlotId(int plot_id)
        {
            return PlantSqlDao.GetAllPlantsByPlot(plot_id);
        }

        //adds a plant to a plot. PlantedPlant object passed in from front must include target plot_id and target plant_id
        [HttpPost("planting")]
        [Authorize]
        public IActionResult AddPlantToPlot(PlantedPlant plantToAdd)
        {
                bool isPlanted = PlantSqlDao.AddPlantToPlot(plantToAdd);

            if (isPlanted)
                return StatusCode(201, "Plant added to plot");
            else
                return StatusCode(409);
        }

        public int GetUserIdFromToken()
        {
            int userId = -1;
            try
            {
                userId = int.Parse(User.FindFirst("sub")?.Value);
            }
            catch
            {

            }
            return userId;
        }
    }
}
