using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Plant
    {
        public int PlantId { get; set; }
        public string CommonName { get; set; }
        public string Description { get; set; }
        public decimal SquareArea { get; set; }
        public decimal Cost { get; set; }
        public string SunRequirements { get; set; }
        public string ImageUrl { get; set; }
        public string TemporaryUsdaZones { get; set; }
    }

    public class PlantingPlant
    {
        public int PlotPlantId { get; set; }
        public int PlantId { get; set; }
        public int PlotId { get; set; }
    }

    public class PlantedPlant
    {
        public int PlotPlantId { get; set; }
        public int PlantId { get; set; }
        public string CommonName { get; set; }
        public string Description { get; set; }
        public decimal SquareArea { get; set; }
        public decimal Cost { get; set; }
        public string SunRequirements { get; set; }
        public string ImageUrl { get; set; }
        public string TemporaryUsdaZones { get; set; }
    }

}
