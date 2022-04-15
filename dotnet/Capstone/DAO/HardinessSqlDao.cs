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
        public List<Hardiness> GetAllHardinessZones()
        {
            List<Hardiness> hardinessZones = new List<Hardiness>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT zone_id, zone_name, avg_last_frost_month, " +
                                                    "avg_last_frost_day, avg_first_frost_month, " +
                                                    "avg_first_frost_day, avg_growing_days " +
                                                    "FROM hardiness", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Hardiness hardiness = GetHardinessFromReader(reader);
                        hardinessZones.Add(hardiness);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }
            return hardinessZones;
        }
        private Hardiness GetHardinessFromReader(SqlDataReader reader)
        {
            Hardiness hardiness = new Hardiness();
            hardiness.ZoneName = Convert.ToString(reader["zone_name"]);
            hardiness.AvgLastFrostMonth = Convert.ToString(reader["avg_last_frost_month"]);
            hardiness.AvgLastFrostDay = Convert.ToInt32(reader["avg_last_frost_day"]);
            hardiness.AvgFirstFrostMonth = Convert.ToString(reader["avg_first_frost_month"]);
            hardiness.AvgFirstFrostDay = Convert.ToInt32(reader["avg_first_frost_day"]);
            hardiness.AvgGrowingDays = Convert.ToInt32(reader["avg_growing_days"]);
            return hardiness;
        }
    }
}
