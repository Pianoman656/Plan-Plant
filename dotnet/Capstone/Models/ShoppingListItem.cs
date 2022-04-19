using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class ShoppingListItem
    {
        public int SuppliesFarmsPlantsId { get; set; }
        public int SupplyId { get; set; }
        public int FarmId { get; set; }
        public int PlantId { get; set; }
    }
}
