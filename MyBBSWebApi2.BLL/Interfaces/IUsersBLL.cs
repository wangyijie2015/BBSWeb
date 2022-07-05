using MyBBSWebApi.Models;
using System;
using System.Collections.Generic;

namespace MyBBSWebApi.BLL.Interfaces
{
    public interface IUsersBLL
    {
        string AddUser(string userNo, string userName, int userLevel, string password);
        Users CheakLogin(string userNo, string password);
        List<Users> GetAll();
        Users GetUserByToken(string token);
        string RemoveUser(int id);
        string UpdateUser(int id, string userNo, string userName, string password, int? userLevel, Guid? token);
    }
}