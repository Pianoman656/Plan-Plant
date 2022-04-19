using Microsoft.AspNetCore.Mvc;
using Capstone.DAO;
using Capstone.Models;
using Capstone.Security;
using Microsoft.AspNetCore.Authorization;

namespace Capstone.Controllers
{   // route:/User/    **must be an authorized user to access
    [Route("[controller]")]
    [ApiController]
    [Authorize]
    public class UserController : ControllerBase
    {
        private readonly IUserDao userDao;

        public UserController(IUserDao _userDao)
        {
            userDao = _userDao;
        }

        //  get request to /User/
        [HttpGet()]
        public ActionResult<User> GetUserInfo()
        {
            User user = userDao.GetUserById(GetUserIdFromToken());
            if (user != null)
                return user;
            else
                return NotFound();

        }

        // put request to /User/
        [HttpPut()]
        public IActionResult EditProfileInfo(User user)
        {
            User updatedUser = userDao.UpdateProfileInfo(GetUserIdFromToken(), user);

            if (updatedUser != null)
                return Ok();
            else
                return StatusCode(409);

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
