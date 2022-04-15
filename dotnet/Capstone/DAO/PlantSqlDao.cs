using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Capstone.Models;
using System.Transactions;

namespace Capstone.DAO
{
    public class PlantSqlDao : IPlantDao
    {
        private readonly string connectionString;
        public PlantSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public List<Plant> GetAllPlants(string sun_status)
        {
            List<Plant> plants = new List<Plant>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT common_name, description, cost, sun_requirements FROM plants p " +
                        "JOIN plots_plants pt " +
                        "ON p.plant_id = pt.plant_id " +
                        "JOIN plots pl " +
                        "ON pt.plot_id = pl.plot_id " +
                        "WHERE pl.sun_status = @sun_status", conn);
                    cmd.Parameters.AddWithValue("@sun_status", sun_status);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Plant plant = new Plant();
                        plant.CommonName = Convert.ToString(reader["common_name"]);
                        plant.Description = Convert.ToString(reader["description"]);
                        plant.Cost = Convert.ToDecimal(reader["cost"]);
                        plant.SunRequirements = Convert.ToString(reader["sun_requirements"]);
                        plants.Add(plant);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }
            return plants;
        }
    }
}
