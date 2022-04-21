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
        public List<Supply> GetAllSuppliesOnFarmList(int userId)
        {
            List<Supply> userSupplies = new List<Supply>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT s.supply_id, s.description, s.image_url, s.supply_name, s.supply_cost " +
                                                    "FROM users u " +
                                                    "JOIN farms f " +
                                                    "ON u.user_id = f.farm_id " +
                                                    "JOIN supplies_farms_plants sfp " +
                                                    "ON sfp.farm_id = f.farm_id " +
                                                    "JOIN supplies s " +
                                                    "ON s.supply_id = sfp.supply_id " +
                                                    "WHERE u.user_id = @user_id;", conn);
                    cmd.Parameters.AddWithValue("@user_id", userId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Supply supply = GetSupplyFromReader(reader);
                        userSupplies.Add(supply);
                    }
                }
            }
            catch
            {
                throw;
            }

            return userSupplies;
        }

        public bool AddSupplyToFarmList(ShoppingListItem supplyToAdd, int userId)
        { 
            bool isAdded = false;
            int atCheckout;
            int onFarmList;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO supplies_farms_plants (supply_id, farm_id) " +
                                                    "OUTPUT INSERTED.supplies_farms_plants_id " +
                                                    "VALUES(@supply_id, (SELECT farm_id FROM farms WHERE @user_id = user_id))", conn);
                    cmd.Parameters.AddWithValue("@supply_id", supplyToAdd.SupplyId);
                    cmd.Parameters.AddWithValue("@user_id", userId);
                    atCheckout = Convert.ToInt32(cmd.ExecuteScalar());
                    // ???redundant but tests itself????
                    SqlCommand cmd1 = new SqlCommand("SELECT * FROM supplies_farms_plants WHERE supplies_farms_plants_id = @supplies_farms_plants_id", conn);
                    cmd1.Parameters.AddWithValue("@supplies_farms_plants_id", atCheckout);
                    onFarmList = Convert.ToInt32(cmd1.ExecuteScalar());
                }
            }
            catch(SqlException)
            {
                throw;
            }

            if (onFarmList == atCheckout)
                isAdded = true;

            return isAdded;
        }

        public bool RemoveSupplyFromFarmList(ShoppingListItem supplyToRemove)
        {
            bool isRemoved = false;
            ShoppingListItem test = new ShoppingListItem();
            
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("DELETE FROM supplies_farms_plants " +
                                                    "WHERE supplies_farms_plants_id = @supplies_farms_plants_id", conn);
                    cmd.Parameters.AddWithValue("@supplies_farms_plants_id", supplyToRemove.SuppliesFarmsPlantsId);
                    cmd.ExecuteNonQuery();

                    SqlCommand cmd1 = new SqlCommand("SELECT * FROM supplies_farms_plants " +
                                                     "WHERE supplies_farms_plants_id = @supplies_farms_plants_id;", conn);
                    cmd1.Parameters.AddWithValue("@supplies_farms_plants_id", supplyToRemove.SuppliesFarmsPlantsId);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        test.SuppliesFarmsPlantsId = Convert.ToInt32(reader["supplies_farms_plants_id"]);
                        test.SupplyId = Convert.ToInt32(reader["supply_id"]);
                        test.FarmId = Convert.ToInt32(reader["farm_id"]);
                        test.PlantId = Convert.ToInt32(reader["plant_id"]);
                    }
                }
            }
            catch(SqlException)
            {
                throw;
            }

            if (test.SupplyId == 0)
                isRemoved = true;

            return isRemoved;
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
