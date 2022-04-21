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

    public class PlotController : ControllerBase
    {
        private readonly IPlotDao PlotSqlDao;
        public PlotController(IPlotDao plotDao)
        {
            PlotSqlDao = plotDao;
        }

        //get a list of all user-specific plots based on token
        [HttpGet()]
        public ActionResult<List<Plot>> ListAllUserPlots()
        {
            List<Plot> userPlots = PlotSqlDao.GetAllPlotsByUser(GetUserIdFromToken());

            if (userPlots != null)
                return userPlots;
            else
                return NotFound();
        }

        //get a list of all farm-specific plots
        [HttpGet("{farmId}/byfarm")]
        public ActionResult<List<Plot>> ListAllFarmPlots(int farmId)
        {
            List<Plot> farmPlots = PlotSqlDao.GetAllPlotsByFarm(farmId);

            if (farmPlots != null)
                return farmPlots;
            else
                return NotFound();
        }

        //get individual plot based on plotId
        [HttpGet("{id}")]
        public ActionResult<Plot> GetPlot(int id)
        {
            Plot plot = PlotSqlDao.GetPlot(id);
            if (plot != null)
                return plot;
            else
                return NotFound();
        }

        //add a new plot
        [HttpPost()]
        public IActionResult AddNewPlot(Plot plotToAdd)
        {
            Plot addedPlot = PlotSqlDao.AddPlot(plotToAdd, GetUserIdFromToken());

            if (addedPlot != null && addedPlot.PlotName == plotToAdd.PlotName)
                return StatusCode(200, "Your plot was added.");
            else
                return StatusCode(409, "Trouble adding your plot. Please try again");
        }


        //delete plot and its "planted plants" from data store.
        //plotToDelete.PlotId is needed to identify target plot
        [HttpDelete()]
        public IActionResult DeletePlot(Plot plotToDelete)
        {
            Plot emptyPlot = PlotSqlDao.DeletePlot(plotToDelete);

            if (emptyPlot.PlotName == null)
                return Ok("Your plot was deleted.");
            else
                return StatusCode(409, "Trouble deleting your plot.");
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
