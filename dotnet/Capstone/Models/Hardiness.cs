using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Hardiness
    {
        public int ZoneId { get; set; }
        public string ZoneName { get; set; }
        public string AvgLastFrostMonth { get; set; }
        public int AvgLastFrostDay { get; set; }
        public string AvgFirstFrostMonth { get; set; }
        public int AvgFirstFrostDay { get; set; }
        public int AvgGrowingDays { get; set; }
    }
}
