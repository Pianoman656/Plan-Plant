using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Capstone.Models;
using System.Transactions;

namespace Capstone.DAO
{
    public class SupplySqlDao : ISupplyDao
    {
        private readonly string connectionString;
        public SupplySqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
    }
}
