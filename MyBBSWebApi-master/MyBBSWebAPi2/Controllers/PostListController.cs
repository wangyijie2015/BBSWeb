using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MyBBSWebApi.BLL.Interfaces;
using MyBBSWebApi.Model;
using MyBBSWebApi.Models;

namespace MyBBSWebAPi.Controllers
{
    //[Route("api/[controller]")]
    [Route("[controller]")] // restful 风格
    [ApiController]
    public class PostListController : ControllerBase
    {
        public IUsersBLL UsersBLL { get; }
        public IPostsBLL PostsBLL { get; }
        public PostListController(IUsersBLL usersBLL,IPostsBLL postsBLL)
        {
            UsersBLL = usersBLL;
            PostsBLL = postsBLL;
        }
        [HttpGet("token")]
        public List<Posts> GetPosts(string token)
        {
            // 通过token 得到用户（为了判断该用户登录状态，且没有失效）
            Users users = UsersBLL.GetUserByToken(token);
            //token 获取到用户后，就可以获取Posts
            List<Posts> posts = PostsBLL.ListAll().ToList();
            return posts;
           
           
        }
       
    }
}
