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

 Date: 12/05/2021 14:17:33
*/


-- ----------------------------
-- Table structure for PostTypes
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[PostTypes]') AND type IN ('U'))
	DROP TABLE [dbo].[PostTypes]
GO

CREATE TABLE [dbo].[PostTypes] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [PostType] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [CreateTime] datetime  NOT NULL,
  [CreateUserId] int  NOT NULL
)
GO

ALTER TABLE [dbo].[PostTypes] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of PostTypes
-- ----------------------------
SET IDENTITY_INSERT [dbo].[PostTypes] ON
GO

INSERT INTO [dbo].[PostTypes] ([Id], [PostType], [CreateTime], [CreateUserId]) VALUES (N'1', N'MOD', N'2020-10-02 00:00:00.000', N'1')
GO

INSERT INTO [dbo].[PostTypes] ([Id], [PostType], [CreateTime], [CreateUserId]) VALUES (N'3', N'资源', N'2020-10-02 00:00:00.000', N'1')
GO

INSERT INTO [dbo].[PostTypes] ([Id], [PostType], [CreateTime], [CreateUserId]) VALUES (N'4', N'分享', N'2020-10-02 00:00:00.000', N'1')
GO

SET IDENTITY_INSERT [dbo].[PostTypes] OFF
GO


-- ----------------------------
-- Auto increment value for PostTypes
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[PostTypes]', RESEED, 4)
GO


-- ----------------------------
-- Primary Key structure for table PostTypes
-- ----------------------------
ALTER TABLE [dbo].[PostTypes] ADD CONSTRAINT [PK_PostTypes] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

