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
    public class PlotController : ControllerBase
    {
        private readonly IPlotDao PlotSqlDao;
        public PlotController(IPlotDao plotDao)
        {
            PlotSqlDao = plotDao;
        }

        [HttpGet("{plot_id}")]
        public ActionResult<Plot> GetPlot(int id)
        {
            Plot plot = PlotSqlDao.GetPlot(id);
            if (plot != null)
                return plot;
            else
                return NotFound();
        }

        [HttpGet()]
        public ActionResult<List<Plot>> ListAllPlots()
        {
            return PlotSqlDao.GetAllPlots();
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
