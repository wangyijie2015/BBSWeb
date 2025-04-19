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
        /// <summary>
        /// 对字符串进行 MD5 加密（UTF-8 编码）
        /// </summary>
        /// <param name="str">待加密的字符串</param>
        /// <returns>32 位大写 MD5 哈希值</returns>
        /// <exception cref="ArgumentNullException">输入字符串为 null 时抛出</exception>
        public static string ToMd5(this string str)
        {
            // 空值校验（避免空引用异常）
            if (str == null)
            {
                throw new ArgumentNullException(nameof(str), "输入字符串不能为 null");
            }

            // 使用 using 确保 MD5 实例正确释放（防止资源泄漏）
            using (MD5 md5 = MD5.Create()) // 推荐使用工厂方法 MD5.Create() 替代具体实现类
            {
                // 明确使用 UTF-8 编码（避免因系统默认编码不同导致结果不一致）
                byte[] inputBytes = Encoding.UTF8.GetBytes(str);

                // 计算哈希值
                byte[] hashBytes = md5.ComputeHash(inputBytes);

                // 高效拼接字节转十六进制字符串（避免多次字符串操作）
                StringBuilder sb = new StringBuilder();
                foreach (byte b in hashBytes)
                {
                    // "X2" 格式确保两位大写十六进制（如 FE 而非 fe 或 f）
                    sb.Append(b.ToString("X2"));
                }

                return sb.ToString();
            }
        }

    }
}
