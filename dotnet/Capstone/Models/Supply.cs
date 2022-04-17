using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Supply
    {
        public int SupplyId { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public string SupplyName { get; set; }
        public decimal SupplyCost { get; set; }

    }

    public class SupplyListItem
    {
        public int SuppliesFarmsId { get; set; }
        public int SupplyId { get; set; }
        public int FarmId { get; set; }
    }
}
