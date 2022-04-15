using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Capstone.Models;

namespace Capstone.DAO
{
    public class HardinessSqlDao : IHardinessDao
    {
        private readonly string connectionString;
        public HardinessSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
    }
}
