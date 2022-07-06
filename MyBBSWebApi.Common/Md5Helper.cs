using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace MyBBSWebApi.Common
{
    public static class Md5Helper
    {
        // 给string 添加一个拓展方法（MD5 加密的方法）
        public static string ToMd5(this string str)
        {
            //MD5CryptoServiceProvider(MD5加密服务提供者)
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] output = md5.ComputeHash(Encoding.Default.GetBytes(str)); //ComputeHash(计算哈希)
            var md5Str = BitConverter.ToString(output).Replace("-", "");//得到加密后的MD5后，去掉`-`
            return md5Str;
        }

    }
}
