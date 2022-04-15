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

        public Plot GetPlot(int id)
        {
            Plot returnPlot = new Plot();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * FROM plots WHERE plot_id = @id;", conn);
                    cmd.Parameters.AddWithValue("@plot_id", id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        returnPlot = GetPlotFromReader(reader);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }
            return returnPlot;
        }
        public List<Plot> GetAllPlots()
        {
            List<Plot> plots = new List<Plot>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * " +
                                                    "FROM plots", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Plot plot = GetPlotFromReader(reader);
                        plots.Add(plot);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }
            return plots;
        }

        public Plot AddPlot(Plot plot)
        {
            int newPlotId;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO plots (farm_id, plot_name, sun_status, plot_square_footage, zone_id) " +
                                                    "OUTPUT INSERTED.plot_id " +
                                                    "VALUES (@farm_id, @plot_name, @sun_status, @plot_square_footage, @zone_id)", conn);
                    cmd.Parameters.AddWithValue("@farm_id", plot.FarmId);
                    cmd.Parameters.AddWithValue("@plot_name", plot.PlotName);
                    cmd.Parameters.AddWithValue("@sun_status", plot.SunStatus);
                    cmd.Parameters.AddWithValue("@plot_square_footage", plot.PlotSquareFootage);
                    cmd.Parameters.AddWithValue("@zone_id", plot.ZoneId);
                    newPlotId = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return GetPlot(newPlotId);
        }

        private Plot GetPlotFromReader(SqlDataReader reader)
        {
            Plot plot = new Plot();
            plot.PlotId = Convert.ToInt32(reader["plot_id"]);
            plot.FarmId = Convert.ToInt32(reader["farm_id"]);
            plot.PlotName = Convert.ToString(reader["plot_name"]);
            plot.SunStatus = Convert.ToString(reader["sun_status"]);
            plot.PlantId = Convert.ToInt32(reader["plant_id"]);
            plot.PlotSquareFootage = Convert.ToDecimal(reader["plot_square_footage"]);
            plot.ZoneId = Convert.ToInt32(reader["zone_id"]);

            return plot;
        }
    }
}
