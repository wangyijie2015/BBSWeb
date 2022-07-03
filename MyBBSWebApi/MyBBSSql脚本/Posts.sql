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

 Date: 12/05/2021 14:17:24
*/


-- ----------------------------
-- Table structure for Posts
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Posts]') AND type IN ('U'))
	DROP TABLE [dbo].[Posts]
GO

CREATE TABLE [dbo].[Posts] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [PostTitle] nvarchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [PostIcon] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [PostTypeId] int  NOT NULL,
  [PostType] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [PostContent] text COLLATE Chinese_PRC_CI_AS  NULL,
  [Clicks] int  NOT NULL,
  [Replys] int  NOT NULL,
  [CreateTime] datetime  NULL,
  [CreateUserId] int  NOT NULL,
  [EditTime] datetime  NULL,
  [EditUserId] int  NOT NULL,
  [LastReplyTime] datetime  NULL,
  [LastReplyUserId] int  NOT NULL,
  [Up] text COLLATE Chinese_PRC_CI_AS  NULL,
  [Down] text COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Posts] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Posts
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Posts] ON
GO

INSERT INTO [dbo].[Posts] ([Id], [PostTitle], [PostIcon], [PostTypeId], [PostType], [PostContent], [Clicks], [Replys], [CreateTime], [CreateUserId], [EditTime], [EditUserId], [LastReplyTime], [LastReplyUserId], [Up], [Down]) VALUES (N'1', N'【原创！3DM下载站/附件/网盘分流】《全面战争：三国》v1.0-v1.6.0 二十五项修改器 By 风灵月影 [2020.09.06更新]', N'https://bbs.3dmgame.com/static/image/common/folder_new.gif', N'2', N'资源', NULL, N'68868', N'8866', N'2020-09-12 13:07:37.000', N'1', N'2020-09-13 13:07:49.000', N'1', N'2020-09-13 13:07:49.000', N'1', N'', N'1')
GO

INSERT INTO [dbo].[Posts] ([Id], [PostTitle], [PostIcon], [PostTypeId], [PostType], [PostContent], [Clicks], [Replys], [CreateTime], [CreateUserId], [EditTime], [EditUserId], [LastReplyTime], [LastReplyUserId], [Up], [Down]) VALUES (N'3', N'1.6传说这个MOD是消灭敌方势力 可以招被消灭势力的将军', N'https://bbs.3dmgame.com/static/image/common/folder_common.gif', N'3', N'分享', NULL, N'56898', N'6689', N'2020-09-12 13:10:21.000', N'1', N'2020-09-12 13:10:21.000', N'1', N'2020-09-12 13:10:21.000', N'1', N'1', N'1')
GO

INSERT INTO [dbo].[Posts] ([Id], [PostTitle], [PostIcon], [PostTypeId], [PostType], [PostContent], [Clicks], [Replys], [CreateTime], [CreateUserId], [EditTime], [EditUserId], [LastReplyTime], [LastReplyUserId], [Up], [Down]) VALUES (N'4', N'1.6部队不会逃跑和都是强壮男人（不会疲劳）', N'https://bbs.3dmgame.com/static/image/common/folder_new.gif', N'3', N'分享', NULL, N'56698', N'9685', N'2020-09-16 19:31:50.000', N'1', N'2020-09-16 19:31:50.000', N'1', N'2020-09-16 19:31:50.000', N'1', N'1', N'1')
GO

INSERT INTO [dbo].[Posts] ([Id], [PostTitle], [PostIcon], [PostTypeId], [PostType], [PostContent], [Clicks], [Replys], [CreateTime], [CreateUserId], [EditTime], [EditUserId], [LastReplyTime], [LastReplyUserId], [Up], [Down]) VALUES (N'5', N'【适配游戏1.6.0】《无双事件簿：黄巾之风》9月12日增加道具三昧真火并修复194吕布事件。收集神器，集结同伴，直面天命之战！', N'https://bbs.3dmgame.com/static/image/common/folder_common.gif', N'1', N'MOD', NULL, N'663698', N'663698', N'2020-09-16 19:33:20.000', N'1', N'2020-09-16 19:33:20.000', N'1', N'2020-09-16 19:33:20.000', N'1', N'1', N'1')
GO

INSERT INTO [dbo].[Posts] ([Id], [PostTitle], [PostIcon], [PostTypeId], [PostType], [PostContent], [Clicks], [Replys], [CreateTime], [CreateUserId], [EditTime], [EditUserId], [LastReplyTime], [LastReplyUserId], [Up], [Down]) VALUES (N'6', N'测试', N'https://bbs.3dmgame.com/static/image/common/folder_new.gif', N'1', N'MOD', N'<p>测试测试测试测试测试测试测试测试测试测试</p>', N'1', N'0', N'2020-10-02 02:51:07.960', N'1', N'2020-10-02 02:51:07.960', N'1', N'2020-10-02 02:51:07.960', N'1', N'1', N'1')
GO

INSERT INTO [dbo].[Posts] ([Id], [PostTitle], [PostIcon], [PostTypeId], [PostType], [PostContent], [Clicks], [Replys], [CreateTime], [CreateUserId], [EditTime], [EditUserId], [LastReplyTime], [LastReplyUserId], [Up], [Down]) VALUES (N'7', N'这是测试', N'https://bbs.3dmgame.com/static/image/common/folder_new.gif', N'1', N'MOD', N'<p>这是测试这是测试这是测试这是测试这是测试这是测试这是测试这是测试这是测试这是测试这是测试这是测试这是测试</p>', N'1', N'0', N'2021-03-17 21:45:53.040', N'1', N'2021-03-17 21:45:53.040', N'1', N'2021-03-17 21:45:53.040', N'1', NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[Posts] OFF
GO


-- ----------------------------
-- Auto increment value for Posts
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Posts]', RESEED, 7)
GO


-- ----------------------------
-- Primary Key structure for table Posts
-- ----------------------------
ALTER TABLE [dbo].[Posts] ADD CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

