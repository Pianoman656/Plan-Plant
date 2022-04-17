using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Plot
    {
        public int PlotId { get; set; }
        public int FarmId { get; set; }
        public string PlotName { get; set; }
        public string SunExposure { get; set; }
        public decimal PlotSquareFootage { get; set; }
        public int ZoneId { get; set; }
    }
}
