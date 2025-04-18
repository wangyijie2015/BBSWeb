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

 Date: 12/05/2021 14:17:10
*/


-- ----------------------------
-- Table structure for PostReplys
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[PostReplys]') AND type IN ('U'))
	DROP TABLE [dbo].[PostReplys]
GO

CREATE TABLE [dbo].[PostReplys] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [PostId] int  NOT NULL,
  [ReplyContent] text COLLATE Chinese_PRC_CI_AS  NULL,
  [CreateTime] datetime  NULL,
  [CreateUserId] int  NOT NULL,
  [EditTime] datetime  NULL,
  [EditUserId] int  NULL,
  [Up] text COLLATE Chinese_PRC_CI_AS  NULL,
  [Down] text COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[PostReplys] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of PostReplys
-- ----------------------------
SET IDENTITY_INSERT [dbo].[PostReplys] ON
GO

INSERT INTO [dbo].[PostReplys] ([Id], [PostId], [ReplyContent], [CreateTime], [CreateUserId], [EditTime], [EditUserId], [Up], [Down]) VALUES (N'13', N'1', N'<p>测试测试</p>', N'2020-10-02 22:32:55.317', N'1', NULL, NULL, N'', N'1')
GO

INSERT INTO [dbo].[PostReplys] ([Id], [PostId], [ReplyContent], [CreateTime], [CreateUserId], [EditTime], [EditUserId], [Up], [Down]) VALUES (N'14', N'1', N'[quote]<p>测试测试</p>[/quote]<br/><p>回复测试</p><br/>', N'2020-10-02 23:24:01.270', N'1', NULL, NULL, N'1', NULL)
GO

INSERT INTO [dbo].[PostReplys] ([Id], [PostId], [ReplyContent], [CreateTime], [CreateUserId], [EditTime], [EditUserId], [Up], [Down]) VALUES (N'15', N'1', N'[quote]<span style="border:1px solid #e5e5e5;background-color: #f5f5f5; font-size: 13px;  font-style: italic ;padding:5px;display: block;"><p>测试测试</p></span><br/><p>回复测试</p><br/>[/quote]<br/>二次回复测试<br/>', N'2020-10-02 23:24:12.703', N'1', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[PostReplys] ([Id], [PostId], [ReplyContent], [CreateTime], [CreateUserId], [EditTime], [EditUserId], [Up], [Down]) VALUES (N'16', N'1', N'<p>aaaaa</p>', N'2021-03-17 21:41:44.807', N'1', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[PostReplys] ([Id], [PostId], [ReplyContent], [CreateTime], [CreateUserId], [EditTime], [EditUserId], [Up], [Down]) VALUES (N'17', N'1', N'<p>asdasdasdasdasd</p>', N'2021-03-17 21:45:22.820', N'1', NULL, NULL, NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[PostReplys] OFF
GO


-- ----------------------------
-- Auto increment value for PostReplys
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[PostReplys]', RESEED, 17)
GO


-- ----------------------------
-- Primary Key structure for table PostReplys
-- ----------------------------
ALTER TABLE [dbo].[PostReplys] ADD CONSTRAINT [PK_PostReplys] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

