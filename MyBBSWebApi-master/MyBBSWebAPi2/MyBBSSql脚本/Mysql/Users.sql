CREATE TABLE IF NOT EXISTS Users (
  Id int NOT NULL AUTO_INCREMENT,
  UserNo varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  UserName varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UserLevel int NOT NULL,
  Password varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  IsDelete tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO Users (Id, UserNo, UserName, UserLevel, Password, IsDelete) VALUES 
(2, 'ace', 'ace', 36, '111', 0),
(8, '666', 'taro', 1, '123456', 0),
(9, '666', 'taro', 1, '123456', 0),
(10, '666', 'taro', 1, '123456', 0);