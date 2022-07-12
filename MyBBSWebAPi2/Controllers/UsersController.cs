using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MyBBSWebApi.BLL.Interfaces;
using MyBBSWebAPi.Models;

namespace MyBBSWebAPi.Controllers
{
    //[Route("api/[controller]")]
    [Route("[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUsersBLL usersBLL;

        public UsersController(IUsersBLL usersBLL)
        {
            this.usersBLL = usersBLL;
        }

        [HttpPost]
        public bool EditUser(UserEditViewModel edit)
        {
            try
            {
                var user = usersBLL.GetAll().FirstOrDefault(m => m.Id == edit.Id);
                user.UserName = edit.UserName;
                if(edit.Password !=null && edit.Password.Trim() !="")
                    user.Password = edit.Password;

                usersBLL.UpdateUserOfUI(user);
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }


    }
}
