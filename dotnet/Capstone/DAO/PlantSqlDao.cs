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

        //returns entire Plants table
        public List<Plant> GetAllPlants()
        {
            List<Plant> plants = new List<Plant>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * " +
                                                    "FROM plants", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Plant plant = GetPlantFromReader(reader);
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


        // returns plants specific to their sun requirements (sun, part-shade, shade)
        public List<Plant> GetAllPlantsBySunRequirements(string sun_requirements)
        {
            List<Plant> plants = new List<Plant>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT common_name, description, cost, sun_requirements " +
                                                    "FROM plants p " +
                                                    "WHERE sun_requirements = @sun_requirements", conn);
                    cmd.Parameters.AddWithValue("@sun_req", sun_requirements);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Plant plant = GetPlantFromReader(reader);
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

        public List<Plant> GetAllPlantsByPlot(int plot_id)
        {
            List<Plant> plants = new List<Plant>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT p.common_name, p.description, p.square_area, p.cost, p.sun_requirements, p.image_url, p.temporary_usda_zones  " +
                                                    "FROM plants p " +
                                                    "JOIN plants_plots pp " +
                                                    "ON p.plant_id = pp.plant_id " +
                                                    "WHERE pp.plot_id = @plot_id", conn);
                    cmd.Parameters.AddWithValue("@plot_id", plot_id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Plant plant = GetPlantFromReader(reader);
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

        private Plant GetPlantFromReader(SqlDataReader reader)
        {
            Plant plant = new Plant();
            plant.CommonName = Convert.ToString(reader["common_name"]);
            plant.Description = Convert.ToString(reader["description"]);
            plant.Cost = Convert.ToDecimal(reader["cost"]);
            plant.SunRequirements = Convert.ToString(reader["sun_requirements"]);
            return plant;
        }
    }
}
