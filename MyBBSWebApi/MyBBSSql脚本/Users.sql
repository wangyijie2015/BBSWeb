/*
 Navicat Premium Data Transfer

 Source Server         : .
 Source Server Type    : SQL Server
 Source Server Version : 15002000
 Source Host           : .:1433
 Source Catalog        : MyBBSDb
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 15002000
 File Encoding         : 65001

 Date: 12/05/2021 14:17:57
*/


-- ----------------------------
-- Table structure for Users
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type IN ('U'))
	DROP TABLE [dbo].[Users]
GO

CREATE TABLE [dbo].[Users] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [UserNo] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [UserName] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [UserLevel] int  NOT NULL,
  [Password] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsDelete] bit  NOT NULL
)
GO

ALTER TABLE [dbo].[Users] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Users
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Users] ON
GO

INSERT INTO [dbo].[Users] ([Id], [UserNo], [UserName], [UserLevel], [Password], [IsDelete]) VALUES (N'2', N'ace', N'ace', N'36', N'111', N'0')
GO

INSERT INTO [dbo].[Users] ([Id], [UserNo], [UserName], [UserLevel], [Password], [IsDelete]) VALUES (N'8', N'666', N'taro', N'1', N'123456', N'0')
GO

INSERT INTO [dbo].[Users] ([Id], [UserNo], [UserName], [UserLevel], [Password], [IsDelete]) VALUES (N'9', N'666', N'taro', N'1', N'123456', N'0')
GO

INSERT INTO [dbo].[Users] ([Id], [UserNo], [UserName], [UserLevel], [Password], [IsDelete]) VALUES (N'10', N'666', N'taro', N'1', N'123456', N'0')
GO

SET IDENTITY_INSERT [dbo].[Users] OFF
GO


-- ----------------------------
-- Auto increment value for Users
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Users]', RESEED, 10)
GO


-- ----------------------------
-- Primary Key structure for table Users
-- ----------------------------
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK__Users__3214EC07AE3806AC] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

