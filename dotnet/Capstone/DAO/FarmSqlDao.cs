using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Capstone.Models;

namespace Capstone.DAO
{
    public class FarmSqlDao : IFarmDAO
    {
        private readonly string connectionString;
        public FarmSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public Farm GetFarm(int id)
        {
            Farm returnFarm = new Farm();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT farm_id FROM farms WHERE user_id = @id;", conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        returnFarm.FarmId = Convert.ToInt32(reader["farm_id"]);
                        returnFarm.UserId = Convert.ToInt32(reader["user_id"]);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }
            return returnFarm;
        }
    }
}

    
