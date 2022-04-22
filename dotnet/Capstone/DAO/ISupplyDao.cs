using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.DAO
{
    public interface ISupplyDao
    {
        List<Supply> GetAllSupplies();
        List<Supply> GetAllSuppliesOnFarmList(int userId);
        bool AddSupplyToFarmList(ShoppingListItem supplyToAdd, int userId);
        bool RemoveSupplyFromFarmList(int listItemId);

        /* 
         * bool AddSupplyToDatabase();
           bool RemoveSupplyFromDatabase();
        */
    }
}
