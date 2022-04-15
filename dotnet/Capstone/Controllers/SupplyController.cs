using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class SupplyController : ControllerBase
    {
        private readonly ISupplyDao SupplySqlDao;

        public SupplyController(ISupplyDao supplyDao)
        {
            SupplySqlDao = supplyDao;
        }

        [HttpGet()]
        public ActionResult<List<Supply>> ListAllSupplies()
        {
            return SupplySqlDao.GetAllSupplies();
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
