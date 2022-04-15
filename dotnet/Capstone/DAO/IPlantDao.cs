using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.DAO
{
    public interface IPlantDao
    {
        List<Plant> GetAllPlants();
        List<Plant> GetAllPlantsBySunRequirements(string sun_requirements);
    }
}
