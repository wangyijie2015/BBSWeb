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
            //注意，第一次登录时，这里前端传过来的密码 必须是 加密过的
            //（否则 运行 userDal.GetUserByUserNoAndAutoLoginTag(userNo, password); 会报错，
            // 因为AutoLoginTag第一次还没有生成guid，去数据库查询时会报错）
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
