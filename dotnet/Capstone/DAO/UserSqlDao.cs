using System;
using System.Data.SqlClient;
using Capstone.Models;
using Capstone.Security;
using Capstone.Security.Models;
using Microsoft.AspNetCore.Authorization;

namespace Capstone.DAO
{
    public class UserSqlDao : IUserDao
    {
        private readonly string connectionString;

        public UserSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public User GetUser(string username)
        {
            User returnUser = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT user_id, username, password_hash, salt, user_role, zip, first_name, last_name, email " +
                                                    "FROM users " +
                                                    "WHERE username = @username", conn);
                    cmd.Parameters.AddWithValue("@username", username);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        returnUser = GetUserFromReader(reader);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnUser;
        }

        public User AddUser(string username, string password, string role, string zip)
        {
            IPasswordHasher passwordHasher = new PasswordHasher();
            PasswordHash hash = passwordHasher.ComputeHash(password);

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO users (username, password_hash, salt, user_role, zip) " +
                                                    "OUTPUT INSERTED.user_id " +
                                                    "VALUES (@username, @password_hash, @salt, @user_role, @zip);", conn);
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password_hash", hash.Password);
                    cmd.Parameters.AddWithValue("@salt", hash.Salt);
                    cmd.Parameters.AddWithValue("@user_role", role);
                    cmd.Parameters.AddWithValue("@zip", zip);
                    int userId = Convert.ToInt32(cmd.ExecuteScalar());

                    //this takes the outputed user_id from the insert statement above
                    //it immediately creates a users "farm" at registration. 
                    //farm and user_id will be tied everytime a new user registers
                    //one and only one farm per user. 
                    SqlCommand cmd1 = new SqlCommand("INSERT INTO farms (user_id) VALUES (@user_id);", conn);
                    cmd1.Parameters.AddWithValue("@user_id", userId);
                    cmd1.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return GetUser(username);
        }
        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="username">username to identify user in the data store</param>
        /// <param name="user">partially built user object to complete user profile</param>
        /// <returns>User complete with first name, last name, email</returns>
        public User UpdateProfileInfo (string username, User user)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("UPDATE users " +
                                                    "SET first_name = @first_name, last_name = @last_name, email = @email " +
                                                    "WHERE username = @username", conn);
                    cmd.Parameters.AddWithValue("@first_name", user.FirstName);
                    cmd.Parameters.AddWithValue("@last_name", user.LastName);
                    cmd.Parameters.AddWithValue("@email", user.Email);
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return GetUser(username);
        }

        private User GetUserFromReader(SqlDataReader reader)
        {
            User u = new User()
            {
                UserId = Convert.ToInt32(reader["user_id"]),
                Username = Convert.ToString(reader["username"]),
                PasswordHash = Convert.ToString(reader["password_hash"]),
                Salt = Convert.ToString(reader["salt"]),
                Role = Convert.ToString(reader["user_role"]),
                Zip = Convert.ToString(reader["zip"]),
                FirstName = Convert.ToString(reader["first_name"]),
                LastName = Convert.ToString(reader["last_name"]),
                Email = Convert.ToString(reader["email"])
            };

            return u;
        }
    }
}
