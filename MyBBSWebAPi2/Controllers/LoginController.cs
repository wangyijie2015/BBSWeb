using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MyBBSWebApi.BLL.Interfaces;
using MyBBSWebApi.Models;
using System;
using System.Collections.Generic;

namespace MyBBSWebApi.Controllers
{
    //[Route("[controller]/[action]")]
    [Route("[controller]")]  //restful 风格
    [ApiController]
    [EnableCors("any")]  //为Login 控制器 配置允许跨域
    public class LoginController : ControllerBase
    {
        private readonly IUsersBLL _userBll;

        public LoginController(IUsersBLL userBll)
        {
            _userBll = userBll;
        }
        [HttpGet]
        public List<Users> GetAll()
        {

            List<Users> userList = _userBll.GetAll();
            return userList;
        }
        [HttpGet("{userNo}/{password}")]
        public Users GetLoginRes(string userNo, string password)
        {
            Users user = _userBll.CheakLogin(userNo, password);
            return user;
        }
        [HttpPost]
        public string Insert(Users user)
        {

            return _userBll.AddUser(user);
        }
        [HttpPut]
        public string Update(int id, string userNo, string userName, string password, int? userLevel, Guid token)
        {

            return _userBll.UpdateUser(id, userNo, userName, password, userLevel, token, null, null);
        }
        [HttpDelete]
        public string Remove(int id)
        {

            return _userBll.RemoveUser(id);
        }

    }
}
