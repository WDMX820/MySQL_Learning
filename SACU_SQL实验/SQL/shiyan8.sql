DROP DATABASE 刘梓淳666

CREATE DATABASE 刘梓淳

USE 刘梓淳

SHOW TABLES;

SELECT *
FROM 学生
LIMIT 5

-- 1)为了便于后续的编排，首先，参考下图在记事本中编写创建一个存储过程的基本框架
DROP PROCEDURE IF EXISTS genStudents;
DELIMITER $$

CREATE PROCEDURE genStudents()
BEGIN
END $$
DELIMITER;

-- 用show procedure命令查询一下是否真的建立好了这个存储过程
SHOW PROCEDURE STATUS
WHERE NAME='genStudents'

-- 2)存储过程功能实现——产生100个固定的学生
DROP PROCEDURE IF EXISTS genStudents;
DELIMITER $$
CREATE PROCEDURE genStudents()
BEGIN
  DECLARE i INT DEFAULT 1;
  DELETE FROM 学生;
  WHILE i <= 100 DO
    INSERT INTO 学生
    VALUES
    (
      '20190001',
      '黄曼韬',
      '男',
      28,
      '物联网',
      185
    );
    SET i=i+1;
  END WHILE;
END $$

CALL genStudents();

SELECT * FROM 学生

-- 3)存储过程功能实现——产生100个不同的学号
DROP PROCEDURE IF EXISTS genStudents;
DELIMITER $$
CREATE PROCEDURE genStudents()
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE xuehao VARCHAR (8) ;
  DELETE FROM 学生;
  WHILE i <= 100 DO
  SET xuehao = CAST(20190000 + i AS CHAR(8)) ;
    INSERT INTO 学生
    VALUES
    (
      xuehao,
      '黄曼韬',
      '男',
      28,
      '物联网',
      185
    );
    SET i=i+1;
  END WHILE;
END $$

CALL genStudents();

SELECT * FROM 学生

-- 4)存储过程功能实现——产生100个不同的姓名
DROP PROCEDURE IF EXISTS genStudents;
DELIMITER $$
CREATE PROCEDURE genStudents()
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE xuehao VARCHAR (8) ;
  DECLARE xingming VARCHAR (4) ;
  DELETE FROM 学生;
  WHILE i <= 100 DO
  SET xuehao = CAST(20190000 + i AS CHAR(8)) ;
  SELECT 姓 INTO xingming FROM 姓表 ORDER BY RAND() LIMIT 1 ;
  SELECT CONCAT(xingming, 名) INTO xingming
  FROM 名表 ORDER BY RAND() LIMIT 1 ;
    INSERT INTO 学生
    VALUES
    (
      xuehao,
      xingming,
      '男',
      28,
      '物联网',
      185
    );
    SET i=i+1;
  END WHILE;
END $$

CALL genStudents();

SELECT * FROM 学生

-- 5)存储过程功能实现——产生每个学生随机的性别
DROP PROCEDURE IF EXISTS genStudents;
DELIMITER $$
CREATE PROCEDURE genStudents()
BEGIN
  DECLARE i INT DEFAULT 1;          -- 定义循环次数变量i，初始为1
  DECLARE xuehao VARCHAR (8) ;      -- 定义学号变量
  DECLARE xingming VARCHAR (4) ;    -- 定义姓名变量
  DECLARE suijishu INT ;            -- 定义一个存储随机数的中间变量
  DECLARE xingbie VARCHAR (4) ;     -- 定义性别变量
  DECLARE nianling INT ;            -- 定义年龄变量
  DELETE FROM 学生;
  WHILE i <= 100 DO
  SET xuehao = CAST(20190000 + i AS CHAR(8)) ;
  SELECT 姓 INTO xingming FROM 姓表 ORDER BY RAND() LIMIT 1 ;
  SELECT CONCAT(xingming, 名) INTO xingming
  FROM 名表 ORDER BY RAND() LIMIT 1 ;
  SET suijishu = CAST(RAND() * 10 AS SIGNED) % 2 ;
  IF suijishu = 0 THEN
      SET xingbie = '男' ;
  ELSE
      SET xingbie = '女' ;
  END IF;
  SET nianling = CAST(RAND() * 7 AS SIGNED) + 18;
    INSERT INTO 学生
    VALUES
    (
      xuehao,
      xingming,
      xingbie,
      nianling,
      '物联网',
      185
    );
    SET i=i+1;
  END WHILE;
END $$

CALL genStudents();

SELECT * FROM 学生

-- 8)存储过程功能实现——产生每个学生随机的身高
DROP PROCEDURE IF EXISTS genStudents;
DELIMITER $$
CREATE PROCEDURE genStudents(IN shuliang INT)
BEGIN
  DECLARE i INT DEFAULT 1;          -- 定义循环次数变量i，初始为1
  DECLARE xuehao VARCHAR (8) ;      -- 定义学号变量
  DECLARE xingming VARCHAR (4) ;    -- 定义姓名变量
  DECLARE suijishu INT ;            -- 定义一个存储随机数的中间变量
  DECLARE xingbie VARCHAR (4) ;     -- 定义性别变量
  DECLARE nianling INT ;            -- 定义年龄变量
  DECLARE xibie VARCHAR (15) ;      -- 定义系别变量
  DECLARE shengao INT ;            -- 定义身高变量
  
  DELETE FROM 学生;
  WHILE i <= shuliang DO
  SET xuehao = CAST(20190000 + i AS CHAR(8)) ;
  SELECT 姓 INTO xingming FROM 姓表 ORDER BY RAND() LIMIT 1 ;
  SELECT CONCAT(xingming, 名) INTO xingming
  FROM 名表 ORDER BY RAND() LIMIT 1 ;
  SELECT 系名 INTO xibie FROM 系表 ORDER BY RAND() LIMIT 1 ;  
  SET suijishu = CAST(RAND() * 10 AS SIGNED) % 2 ;
  IF suijishu = 0 THEN
      SET xingbie = '男' ;
  ELSE
      SET xingbie = '女' ;
  END IF;
  SET nianling = CAST(RAND() * 7 AS SIGNED) + 18;
  SET shengao = CAST(RAND() * 45 AS SIGNED) + 150;
    INSERT INTO 学生
    VALUES
    (
      xuehao,
      xingming,
      xingbie,
      nianling,
      xibie,
      shengao
    );
    SET i=i+1;
  END WHILE;
END $$

CALL genStudents(100);

SELECT * FROM 学生

CREATE INDEX idx_lzc_xh ON 学生(学号)

ALTER TABLE 学生 ADD INDEX idx_lzc_xm (姓名 DESC)

CREATE VIEW xs_20
AS
SELECT * FROM 学生 WHERE 年龄=20;

SHOW TABLES

SELECT * FROM xs_20

CREATE VIEW xs_sx
AS
SELECT * FROM 学生 WHERE 系别=N'数学';

SELECT * FROM xs_wlw

INSERT INTO xs_sx
VALUES('20203918','刘梓淳','男','20','信科',183)

SELECT * FROM xs_sx

ALTER VIEW xs_sx
AS
SELECT * FROM 学生 WHERE 系别='数学'
WITH CHECK OPTION;

USE 刘梓淳;
DELIMITER $$
CREATE TRIGGER tri_liuzichun BEFORE UPDATE ON 学生
FOR EACH ROW
BEGIN
    IF NEW.年龄<OLD.年龄 THEN
         SIGNAL SQLSTATE 'HY000'
         SET MESSSAGE_TEXT='年龄不能减少！';
         END IF;
END $$
DELIMITER;

DROP TRIGGER IF EXISTS tri_liuzichun

UPDATE 学生 SET 年龄 = 1



