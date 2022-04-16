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

        [HttpGet("{sun_requirements}")]
        public ActionResult<List<Plant>> ListAllPlantsBySunRequirements(string sun_requirements)
        {
            return PlantSqlDao.GetAllPlantsBySunRequirements(sun_requirements);
        }

        /*[HttpGet()]
        public ActionResult<List<Plant>> ListAllPlantsByPlot(int plot_id)
        {
            return PlantSqlDao.GetAllPlantsByPlot(plot_id);
        }
*/

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
