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
        bool AddSupplyToFarmList(ShoppingListItem supplyToAdd);
        bool RemoveSupplyFromFarmList(ShoppingListItem supplyToRemove);

        /* 
         * bool AddSupplyToDatabase();
           bool RemoveSupplyFromDatabase();
        */
    }
}
