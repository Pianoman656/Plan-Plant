using Capstone.DAO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class PlantController : ControllerBase
    {
        private readonly IPlantDao PlantSqlDao;
        public PlantController(IPlantDao plantDao)
        {
            PlantSqlDao = plantDao;
        }

        [HttpGet()]
        public ActionResult<List<Plant>> ListAllPlants()
        {   
            return PlantSqlDao.GetAllPlants();
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
