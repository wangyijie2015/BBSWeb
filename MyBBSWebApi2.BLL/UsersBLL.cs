using MyBBSWebApi.BLL.Interfaces;
using MyBBSWebApi.Common;
using MyBBSWebApi.DAL;
using MyBBSWebApi.Models;
using System;
using System.Collections.Generic;

namespace MyBBSWebApi.BLL
{
    public class UsersBLL : IUsersBLL
    {
        UsersDAL userDal = new UsersDAL();
        /// <summary>
        /// 调用 userDal.GetAll()得到全部数据 
        /// </summary>
        /// <returns></returns>
        public List<Users> GetAll()
        {
            // IsDelete 数据库中的默认的值为0 表示该用户 已删除（软删除）
            //这里需要取反
            return userDal.GetAll().FindAll(m => !m.IsDelete);
        }
        /// <summary>
        /// 校验登录（登录的核心逻辑）Token每次登录都必须生成，保证唯一性
        /// </summary>
        /// <param name="userNo"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public Users CheakLogin(string userNo, string password)
        {
            //将前端传入的明文密码 通过MD5 进行加密
            List<Users> userlist = userDal.GetUserByUserNoAndPassword(userNo, password.ToMd5());
            if (userlist.Count <= 0)//数据库中没有找到数据
            {
                //再判断 该用户是否可以 自动登录
                userlist = userDal.GetUserByUserNoAndAutoLoginTag(userNo, password);
                // 校验自动登录 时间是否失效
                // 如果 数据库中的时间 > 当前时间 表示 可用
                if (userlist==null)
                {
                    return default; //解决用户输入密码错误的情况下，程序出现的错误（2022.07.12）
                }
                userlist = userlist.FindAll(m => m.AutoLoginLimitTime > DateTime.Now);
                if (userlist.Count <= 0)
                {
                    return default;
                }
                else
                {
                    //生成新的Token 不需要生成 AutoLoginTag 
                    return GetLoginResult(userlist, false);
                }
            }
            else
            {
                //生成新的Token 需要生成 AutoLoginTag
                return GetLoginResult(userlist, true);
            }
        }
        /// <summary>
        /// 得到 登录结果
        /// </summary>
        /// <param name="userlist"></param>
        /// <param name="isPasswordLogin"></param>
        /// <returns></returns>
        private Users GetLoginResult(List<Users> userlist, bool isPasswordLogin)
        {
            // 先判断用户是否可用
            Users user = userlist.Find(m => !m.IsDelete);
            //给用户生成一个token
            user.Token = Guid.NewGuid();
            //如果是用户密码登录的，则赋予新的 token  和 新的自动登录限制时间（这里是7个小时）
            if (isPasswordLogin)
            {
                user.AutoLoginTag = Guid.NewGuid();
                user.AutoLoginLimitTime = DateTime.Now.AddDays(7);
            }
            userDal.UpdateUser(user.Id, user.UserNo, user.UserName, user.Password, user.UserLevel, user.Token, user.AutoLoginTag, user.AutoLoginLimitTime);
            //if (user == null) return default;
            //else return user;
            return user;
        }
        /// <summary>
        /// 通过token 得到 user
        /// </summary>
        /// <param name="token"></param>
        /// <returns></returns>
        /// <exception cref="Exception"></exception>
        public Users GetUserByToken(string token)
        {
            Users user = userDal.GetUserByToken(token);
            if (user == null)
            {
                throw new Exception("token错误");
            }
            return user;

        }
        /// <summary>
        /// 添加一个User
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public string AddUser(Users user)
        {
            user.IsDelete = false;
            int rows = userDal.AddUser(user);
            if (rows > 0)
            {
                return "数据修改成功";
            }
            else
            {
                return "数据修改失败";
            }
        }
        /// <summary>
        /// 更新 User
        /// </summary>
        /// <param name="id"></param>
        /// <param name="userNo"></param>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <param name="userLevel"></param>
        /// <param name="token"></param>
        /// <param name="autoLoginTag"></param>
        /// <param name="autoLoginLimitTime"></param>
        /// <returns></returns>
        public string UpdateUser(
            int id,
            string userNo,
            string userName,
            string password,
            int? userLevel,
            Guid? token,
            Guid? autoLoginTag,
            DateTime? autoLoginLimitTime)
        {

            int rows = userDal.UpdateUser(id, userNo, userName, password, userLevel, token, autoLoginTag, autoLoginLimitTime);
            if (rows > 0)
            {
                return "数据修改成功";
            }
            else
            {
                return "数据修改失败";
            }
        }
        /// <summary>
        /// 视图模型的使用
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public string UpdateUserOfUI(Users user)
        {
            int rows = userDal.UpdateUserOfUI(user);
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
