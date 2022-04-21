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

        public Plot GetPlot(int plotId)
        {
            Plot returnPlot = new Plot();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT * FROM plots WHERE plot_id = @plot_id;", conn);
                    cmd.Parameters.AddWithValue("@plot_id", plotId);
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
        public List<Plot> GetAllPlotsByUser(int userId)
        {
            List<Plot> plots = new List<Plot>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT p.plot_id, p.farm_id, p.plot_name, p.sun_exposure, p.plot_square_footage, p.zone_id " +
                                                    "FROM plots p " +
                                                    "JOIN farms f " +
                                                    "ON p.farm_id = f.farm_id " +
                                                    "JOIN users u " +
                                                    "ON u.user_id = f.user_id " +
                                                    "WHERE u.user_id = @user_id", conn);
                    cmd.Parameters.AddWithValue("@user_id", userId);
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

        public List<Plot> GetAllPlotsByFarm(int farmId)
        {
            List<Plot> plots = new List<Plot>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT *" +
                                                    "FROM plots p " +
                                                    "WHERE farm_id = @farm_id", conn);
                    cmd.Parameters.AddWithValue("@farm_id", farmId);
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

        public Plot AddPlot(Plot plot, int userId)
        {
            int newPlotId;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO plots (farm_id, plot_name, sun_exposure, plot_square_footage, zone_id) " +
                                                    "OUTPUT INSERTED.plot_id " +
                                                    "VALUES ((SELECT farm_id FROM farms WHERE user_id = @user_id), @plot_name, @sun_exposure, @plot_square_footage, @zone_id)", conn);
                    cmd.Parameters.AddWithValue("@user_id", userId); // using token and /\ this subquery to correctly pull the farm_id
                    cmd.Parameters.AddWithValue("@plot_name", plot.PlotName);
                    cmd.Parameters.AddWithValue("@sun_exposure", plot.SunExposure);
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

        public Plot DeletePlot (int plotId)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("DELETE FROM plots_plants " +
                                                    "WHERE plot_id = @plot_id", conn);
                    cmd.Parameters.AddWithValue("@plot_id", plotId); 
                    cmd.ExecuteNonQuery();
                    
                    
                    //Two deletes needed due to FK restrictions. Delete planted plants first, and then delete respective plot. 
                    SqlCommand cmd1 = new SqlCommand("DELETE FROM plots " +
                                                     "WHERE plot_id = @plot_id", conn);
                    cmd1.Parameters.AddWithValue("@plot_id", plotId);
                    cmd1.ExecuteNonQuery();

                }
            }
            catch (SqlException)
            {
                throw;
            }

            return GetPlot(plotId);

        }


        private Plot GetPlotFromReader(SqlDataReader reader)
        {
            Plot plot = new Plot();
            plot.PlotId = Convert.ToInt32(reader["plot_id"]);
            plot.FarmId = Convert.ToInt32(reader["farm_id"]);
            plot.PlotName = Convert.ToString(reader["plot_name"]);
            plot.SunExposure = Convert.ToString(reader["sun_exposure"]);
            plot.PlotSquareFootage = Convert.ToDecimal(reader["plot_square_footage"]);
            plot.ZoneId = Convert.ToInt32(reader["zone_id"]);

            return plot;
        }
    }
}
