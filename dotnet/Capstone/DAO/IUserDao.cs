using Capstone.Models;

namespace Capstone.DAO
{
    public interface IUserDao
    {
        User GetUser(string username);
        User GetUserById(int userId);
        User AddUser(string username, string password, string role, string zip);
        User UpdateProfileInfo(int userId, User user);
    }
}
