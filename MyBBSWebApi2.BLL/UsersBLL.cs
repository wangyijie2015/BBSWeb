using MyBBSWebApi.BLL.Interfaces;
using MyBBSWebApi.DAL;
using MyBBSWebApi.Models;
using System;
using System.Collections.Generic;

namespace MyBBSWebApi.BLL
{
    public class UsersBLL : IUsersBLL
    {
        UsersDAL userDal = new UsersDAL();
        public List<Users> GetAll()
        {
            return userDal.GetAll().FindAll(m => !m.IsDelete);
        }
        public Users CheakLogin(string userNo, string password)
        {
            List<Users> userlist = userDal.GetUserByUserNoAndPassword(userNo, password);
            if (userlist.Count <= 0)
                return default;
            else
            {
                Users user = userlist.Find(m => !m.IsDelete);
                //user.Token = Guid.NewGuid();
                //UpdateUser(user.Id, user.UserNo, user.UserName, user.Password, user.UserLevel, user.Token);
                //if (user == null) return default;
                //else return user;
                return user;
            }
        }
        public Users GetUserByToken(string token)
        {
            Users user = userDal.GetUserByToken(token);
            if (user == null)
            {
                throw new Exception("token错误");
            }
            return user;

        }

        public string AddUser(string userNo, string userName, int userLevel, string password)
        {
            UsersDAL userDal = new UsersDAL();
            int rows = userDal.AddUser(userNo, userName, userLevel, password);
            if (rows > 0)
            {
                return "数据修改成功";
            }
            else
            {
                return "数据修改失败";
            }
        }
        public string UpdateUser(
            int id,
            string userNo,
            string userName,
            string password,
            int? userLevel,
            Guid? token)
        {

            UsersDAL userDal = new UsersDAL();
            int rows = userDal.UpdateUser(id, userNo, userName, password, userLevel, token);
            if (rows > 0)
            {
                return "数据修改成功";
            }
            else
            {
                return "数据修改失败";
            }
        }
        public string RemoveUser(int id)
        {

            UsersDAL userDal = new UsersDAL();
            int rows = userDal.RemoveUser(id);
            if (rows > 0)
            {
                return "数据修改成功";
            }
            else
            {
                return "数据修改失败";
            }
        }

    }
}
