CREATE TABLE IF NOT EXISTS PostTypes (
  Id int NOT NULL AUTO_INCREMENT,
  PostType varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  CreateTime datetime NOT NULL,
  CreateUserId int NOT NULL,
  PRIMARY KEY (Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO PostTypes (Id, PostType, CreateTime, CreateUserId) VALUES 
(1, 'MOD', '2020-10-02 00:00:00', 1),
(3, '资源', '2020-10-02 00:00:00', 1),
(4, '分享', '2020-10-02 00:00:00', 1);