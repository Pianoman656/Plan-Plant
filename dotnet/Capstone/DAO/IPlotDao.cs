using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.DAO
{
    public interface IPlotDao
    {
        Plot GetPlot(int plotId);
        List<Plot> GetAllPlotsByUser(int farmId);
        Plot AddPlot(Plot plot, int v);
        Plot DeletePlot(Plot plot);
    }
}
