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

        //  get request to    /User/{username}
        [HttpGet("{username}")]
        public ActionResult<User> GetUserInfo(string username)
        {
            User user = userDao.GetUser(username);
            if (user != null)
                return user;
            else
                return NotFound();

        }

        // put request to    /User/{username}
        [HttpPut("{username}")]
        public IActionResult EditProfileInfo(string username, User user)
        {
            User updatedUser = userDao.UpdateProfileInfo(username, user);

            if (updatedUser != null && updatedUser.LastName == user.LastName)
                return Ok();
            else
                return StatusCode(409);

        }
    }
}
