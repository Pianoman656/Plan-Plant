using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [Authorize]
    public class SupplyController : ControllerBase
    {
        private readonly ISupplyDao SupplySqlDao;

        public SupplyController(ISupplyDao supplyDao)
        {
            SupplySqlDao = supplyDao;
        }

        //get list of all supplies in data store
        [HttpGet("supplyStore")]
        public ActionResult<List<Supply>> ListAllSupplies()
        {
            List<Supply> supplies = SupplySqlDao.GetAllSupplies();

            if (supplies != null)
                return supplies;
            else
                return NotFound();
        }

        //get list of all supplies currently on the farm list. Filter using token
        [HttpGet("shoppingList")]
        public ActionResult<List<Supply>> SuppliesOnFarmList()
        {
            List<Supply> supplies = SupplySqlDao.GetAllSuppliesOnFarmList(GetUserIdFromToken());
            
            if (supplies != null)
                return supplies;
            else
                return NotFound();
        }


        //must have FarmId and SupplyId properties of SupplyListItem
        [HttpPost("shoppingList")]
        public IActionResult AddSupplyToFarmList(ShoppingListItem supplyToAdd)
        {
            bool isAdded = SupplySqlDao.AddSupplyToFarmList(supplyToAdd, GetUserIdFromToken());       
            if (isAdded)
                return StatusCode(201,"Supply added to the farm list.");
            else
                return StatusCode(409, "Supply could not be added to the farm list.");
        }

        //must have SuppliesFarmsPlantsId property of SupplyListItem
        [HttpDelete("shoppingList/{listItemId}")]
        public IActionResult RemoveSupplyFromFarmList(int listItemId)
        {
            bool isRemoved = SupplySqlDao.RemoveSupplyFromFarmList(listItemId);
            if (isRemoved)
                return Ok("Supply removed from the farm list.");
            else
                return StatusCode(409, "Supply could not be removed from the farm list.");
        }

        public int GetUserIdFromToken()
        {
            int userId = -1;
            try
            {
                userId = int.Parse(User.FindFirst("sub")?.Value);
            }
            catch
            {

            }
            return userId;
        }
    }
}
