CREATE TABLE IF NOT EXISTS Posts (
  Id int NOT NULL AUTO_INCREMENT,
  PostTitle varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PostIcon varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PostTypeId int NOT NULL,
  PostType varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PostContent text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  Clicks int NOT NULL,
  Replys int NOT NULL,
  CreateTime datetime DEFAULT NULL,
  CreateUserId int NOT NULL,
  EditTime datetime DEFAULT NULL,
  EditUserId int NOT NULL,
  LastReplyTime datetime DEFAULT NULL,
  LastReplyUserId int NOT NULL,
  Up text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  Down text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO Posts (Id, PostTitle, PostIcon, PostTypeId, PostType, PostContent, Clicks, Replys, CreateTime, CreateUserId, EditTime, EditUserId, LastReplyTime, LastReplyUserId, Up, Down) VALUES 
(1, '【原创！3DM下载站/附件/网盘分流】《全面战争：三国》v1.0-v1.6.0 二十五项修改器 By 风灵月影 [2020.09.06更新]', 'https://bbs.3dmgame.com/static/image/common/folder_new.gif', 2, '资源', NULL, 68868, 8866, '2020-09-12 13:07:37', 1, '2020-09-13 13:07:49', 1, '2020-09-13 13:07:49', 1, '', '1'),
(3, '1.6传说这个MOD是消灭敌方势力 可以招被消灭势力的将军', 'https://bbs.3dmgame.com/static/image/common/folder_common.gif', 3, '分享', NULL, 56898, 6689, '2020-09-12 13:10:21', 1, '2020-09-12 13:10:21', 1, '2020-09-12 13:10:21', 1, '1', '1'),
(4, '1.6部队不会逃跑和都是强壮男人（不会疲劳）', 'https://bbs.3dmgame.com/static/image/common/folder_new.gif', 3, '分享', NULL, 56698, 9685, '2020-09-16 19:31:50', 1, '2020-09-16 19:31:50', 1, '2020-09-16 19:31:50', 1, '1', '1'),
(5, '【适配游戏1.6.0】《无双事件簿：黄巾之风》9月12日增加道具三昧真火并修复194吕布事件。收集神器，集结同伴，直面天命之战！', 'https://bbs.3dmgame.com/static/image/common/folder_common.gif', 1, 'MOD', NULL, 663698, 663698, '2020-09-16 19:33:20', 1, '2020-09-16 19:33:20', 1, '2020-09-16 19:33:20', 1, '1', '1'),
(6, '测试', 'https://bbs.3dmgame.com/static/image/common/folder_new.gif', 1, 'MOD', '<p>测试测试测试测试测试测试测试测试测试测试</p>', 1, 0, '2020-10-02 02:51:07', 1, '2020-10-02 02:51:07', 1, '2020-10-02 02:51:07', 1, '1', '1'),
(7, '这是测试', 'https://bbs.3dmgame.com/static/image/common/folder_new.gif', 1, 'MOD', '<p>这是测试这是测试这是测试这是测试这是测试这是测试这是测试这是测试这是测试这是测试这是测试这是测试这是测试</p>', 1, 0, '2021-03-17 21:45:53', 1, '2021-03-17 21:45:53', 1, '2021-03-17 21:45:53', 1, NULL, NULL);