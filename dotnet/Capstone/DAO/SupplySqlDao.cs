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

        public List<Supply> GetAllSupplies()
        {
            List<Supply> supplies = new List<Supply>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * " +
                                                    "FROM supplies", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Supply supply = GetSupplyFromReader(reader);
                        supplies.Add(supply);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }
            return supplies;
        }
        private Supply GetSupplyFromReader(SqlDataReader reader)
        {
            Supply supply = new Supply();
            supply.SupplyId = Convert.ToInt32(reader["supply_id"]);
            supply.Description = Convert.ToString(reader["description"]);
            supply.ImageUrl = Convert.ToString(reader["image_url"]);
            supply.SupplyName = Convert.ToString(reader["supply_name"]);
            supply.SupplyCost = Convert.ToDecimal(reader["supply_cost"]);
            return supply;
        }
    }
}
