
Entity Framework Core (EF Core) 是微软推出的一个轻量级、可扩展、开源且跨平台的 对象关系映射(ORM) 框架，是 Entity Framework 的现代化版本，专为 .NET Core/.NET 5+ 设计

EF Core 作为 ORM 框架，主要解决了 对象模型(类/对象) 与 关系型数据库(表/行) 之间的映射问题，开发者可以用面向对象的方式操作数据库，而不必直接编写 SQL。

DbContext
代表与数据库的会话，是 EF Core 的核心类
负责：
管理数据库连接
跟踪实体变化
执行查询
保存数据到数据库
配置模型与数据库映射

public class AppDbContext : DbContext
{
    public DbSet<Blog> Blogs { get; set; }  // 表示数据库中的表
    
    protected override void OnConfiguring(DbContextOptionsBuilder options)
        => options.UseSqlServer("连接字符串");
}

DbSet<TEntity>
表示数据库中的表
用于查询和保存实体实例

实体(Entity)
映射到数据库表的普通 C# 类
通常一个类对应一张表，一个实例对应一行数据

public class Blog
{
    public int BlogId { get; set; }  // 主键
    public string Url { get; set; }
    public List<Post> Posts { get; set; }  // 导航属性
}

public class Post
{
    public int PostId { get; set; }
    public string Title { get; set; }
    public string Content { get; set; }
    
    public int BlogId { get; set; }  // 外键
    public Blog Blog { get; set; }    // 导航属性
}

关键特性：
数据建模方式
约定(Conventions)
EF Core 根据命名约定自动配置模型：

名为 Id 或 [类名]Id 的属性会被视为主键

导航属性表示关系

数据注解(Data Annotations)
通过特性标注配置模型：

csharp
[Table("Blogs")]
public class Blog
{
    [Key]
    public int BlogId { get; set; }
    
    [Required]
    [MaxLength(500)]
    public string Url { get; set; }
}
Fluent API
在 DbContext 的 OnModelCreating 方法中配置：

csharp
protected override void OnModelCreating(ModelBuilder modelBuilder)
{
    modelBuilder.Entity<Blog>()
        .ToTable("Blogs")
        .HasKey(b => b.BlogId);
    
    modelBuilder.Entity<Blog>()
        .Property(b => b.Url)
        .IsRequired()
        .HasMaxLength(500);
}

3.查询数据：

LINQ 查询
var blogs = context.Blogs
    .Where(b => b.Url.Contains("example"))
    .OrderBy(b => b.Url)
    .ToList();

原始的SQL查询：
var blogs = context.Blogs
    .FromSqlRaw("SELECT * FROM Blogs WHERE Url LIKE '%example%'")
    .ToList();

 4.保存数据：
 // 添加
var blog = new Blog { Url = "http://example.com" };
context.Blogs.Add(blog);
// 更新
blog.Url = "http://updated.com";
context.Blogs.Update(blog);
// 删除
context.Blogs.Remove(blog);
// 保存更改
context.SaveChanges();

5.迁移（Migrations）
EF Core的迁移系统允许以代码的方式管理数据库架构变更
# 创建迁移
dotnet ef migrations add InitialCreate
# 应用迁移
dotnet ef database update

高级特性
1. 关系
一对一 (HasOne - WithOne)

一对多 (HasMany - WithOne)

多对多 (HasMany - WithMany)

2. 继承映射策略
TPH (Table Per Hierarchy) - 单表继承

TPT (Table Per Type) - 每个类型一张表

TPC (Table Per Concrete Class) - 每个具体类一张表

3. 性能优化
延迟加载 vs 预先加载
批量操作
查询优化
二级缓存
4. 并发控制
乐观并发控制 (并发令牌)
悲观并发控制 (锁定)
使用场景
快速开发：减少数据访问层代码量
跨数据库支持：轻松切换数据库
复杂查询：LINQ 提供强类型查询
领域驱动设计(DDD)：更好地映射领域模型