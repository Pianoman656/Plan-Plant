using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Capstone.Models;
//
//
//
//A new user's farm is assigned at registration. - see usersqlDao line70
//
//
//
namespace Capstone.DAO
{
    public class FarmSqlDao : IFarmDAO
    {
        private readonly string connectionString;
        public FarmSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public Farm GetFarm(int userId)
        {
            Farm returnFarm = new Farm();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * FROM farms WHERE user_id = @user_id;", conn);
                    cmd.Parameters.AddWithValue("@user_id", userId);
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

    
