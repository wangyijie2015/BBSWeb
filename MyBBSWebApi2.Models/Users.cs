using System;

namespace MyBBSWebApi.Models
{
    public class Users
    {
        public int Id { get; set; }
        public string UserNo { get; set; }
        public string UserName { get; set; }
        public int UserLevel { get; set; }
        public string Password { get; set; }
        public bool IsDelete { get; set; }
        public Guid Token { get; set; } // token 
        public Guid AutoLoginTag { get; set; } // 自动登录的标识
        public DateTime? AutoLoginLimitTime { get; set; }//自动登录的限制时间，可以设置什么时候失效
    }
}
