CREATE DATABASE IF NOT EXISTS book CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE book;

CREATE TABLE IF NOT EXISTS PostReplys (
  Id int NOT NULL AUTO_INCREMENT,
  PostId int NOT NULL,
  ReplyContent text,
  CreateTime datetime DEFAULT NULL,
  CreateUserId int NOT NULL,
  EditTime datetime DEFAULT NULL,
  EditUserId int DEFAULT NULL,
  Up text,
  Down text,
  PRIMARY KEY (Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO PostReplys (Id, PostId, ReplyContent, CreateTime, CreateUserId, EditTime, EditUserId, Up, Down) VALUES 
(13, 1, '<p>测试测试</p>', '2020-10-02 22:32:55', 1, NULL, NULL, '', '1'),
(14, 1, '[quote]<p>测试测试</p>[/quote]<br/><p>回复测试</p><br/>', '2020-10-02 23:24:01', 1, NULL, NULL, '1', NULL),
(15, 1, '[quote]<span style=\"border:1px solid #e5e5e5;background-color: #f5f5f5; font-size: 13px;  font-style: italic ;padding:5px;display: block;\"><p>测试测试</p></span><br/><p>回复测试</p><br/>[/quote]<br/>二次回复测试<br/>', '2020-10-02 23:24:12', 1, NULL, NULL, NULL, NULL),
(16, 1, '<p>aaaaa</p>', '2021-03-17 21:41:44', 1, NULL, NULL, NULL, NULL),
(17, 1, '<p>asdasdasdasdasd</p>', '2021-03-17 21:45:22', 1, NULL, NULL, NULL, NULL);