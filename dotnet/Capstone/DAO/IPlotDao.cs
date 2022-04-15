using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.DAO
{
    public interface IPlotDao
    {
        Plot GetPlot(int id);
        List<Plot> GetAllPlots();
        Plot AddPlot(Plot plot);

    }
}
