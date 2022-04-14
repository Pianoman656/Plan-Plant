using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Capstone.Models;

namespace Capstone.DAO
{
    public class PlotSqlDao : IPlotDao
    {
        private readonly string connectionString;
        public PlotSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
    }
}
