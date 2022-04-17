using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;
using Capstone.DAO;
using Microsoft.AspNetCore.Authorization;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [Authorize]
    public class FarmController : ControllerBase
    {
        private readonly IFarmDAO FarmSqlDao;
        public FarmController(IFarmDAO farmDao)
        {
            FarmSqlDao = farmDao;
        }

        [HttpGet()]
        public Farm GetFarm()
        {
            int userId = GetUserIdFromToken();
            return FarmSqlDao.GetFarm(userId);
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
