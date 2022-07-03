using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MyBBSWebApi.Controllers
{
    [Route("api/[controller]")]
    //[Route("[controller]")]  //restful 风格
    [ApiController]
    public class LoginController : ControllerBase
    {
    }
}
