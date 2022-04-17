using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;

namespace Capstone.Controllers
{   // route: /Plot/
    [Route("[controller]")]
    [ApiController]
    [Authorize]

    //Authorized so that only a logged in user can access ??
    //farm_id and user_id are currently the same ??
    //

    public class PlotController : ControllerBase
    {
        private readonly IPlotDao PlotSqlDao;
        public PlotController(IPlotDao plotDao)
        {
            PlotSqlDao = plotDao;
        }

        //get individual plot based on id
        [HttpGet("{id}")]
        public ActionResult<Plot> GetPlot(int id)
        {
            Plot plot = PlotSqlDao.GetPlot(id);
            if (plot != null)
                return plot;
            else
                return NotFound();
        }

        //get a list of all user plots
        [HttpGet()]
        public ActionResult<List<Plot>> ListAllUserPlots()
        {
            List<Plot> userPlots = PlotSqlDao.GetAllPlotsByUser(GetUserIdFromToken());

            if (userPlots != null)
                return userPlots;
            else
                return NotFound();
        }

        //post add a new plot
        [HttpPost()]
         public IActionResult AddNewPlot(Plot plotToAdd)
        {
            Plot addedPlot = PlotSqlDao.AddPlot(plotToAdd, GetUserIdFromToken());

            if (addedPlot != null && addedPlot.PlotName == plotToAdd.PlotName)
                return StatusCode(418);
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
