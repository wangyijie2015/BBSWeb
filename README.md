# MyBBSWebApi
 ## 1.三层架构,UI---BLL----DAL----Models
```C# 
UI(UI层)引入依赖 BLL  和 Models
BLL(业务逻辑层) 引入依赖 DAL(数据访问层)
DAL(数据访问层) 引入依赖 Models(视图模型层)
```C# 

## 2.依赖注入 IUsersBLL
![依赖注入](https://github.com/RanGuMo/MyBBSWebApi/blob/master/MyBBSWebAPi2/Images/1657033396872.jpg)

然后通过构造函数注入，来使用 UsersBLL
