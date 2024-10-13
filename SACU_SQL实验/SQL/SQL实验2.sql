CREATE DATABASE 刘梓淳;
USE 刘梓淳;

CREATE TABLE worker(
        职工号 CHAR(6) PRIMARY KEY,
        姓名 CHAR(8),
        性别 CHAR(2) NOT NULL DEFAULT '男',
        生日 DATE,
        部门号 INT
);
DESCRIBE worker;
ALTER TABLE worker MODIFY 部门号 INT NOT NULL;
INSERT INTO worker
VALUE('ZG001','刘梓淳','男','2002-8-20',1);
SELECT * FROM worker;
INSERT INTO worker VALUES('ZG001','李芳','女','1990-8-21',2);
INSERT INTO worker(职工号,姓名,部门号) VALUES('ZG003','倪军',5);

CREATE TABLE teacher(
        教师号 CHAR(6) PRIMARY KEY,
        姓名 CHAR(8),
        性别 CHAR(2) NOT NULL DEFAULT '女',
        年龄 CHAR(3),
        职称 CHAR(5) NOT NULL DEFAULT '教授',
        工资 CHAR(10), 
        岗位津贴 CHAR(10),
        系别 CHAR(5)
);
DESC teacher;
INSERT INTO teacher VALUES('t1','刘伟','男','40','教授','2000','4000','计算机');
INSERT INTO teacher VALUES('t2','张娟','女','35','副教授','1500','3200','数学');
INSERT INTO teacher VALUES('t3','刘淳淳','男','27','副教授','1800','4300','运筹学');
SELECT * FROM teacher;

CREATE TABLE student(
        学号 CHAR(6) PRIMARY KEY,
        姓名 CHAR(8),
        性别 CHAR(2) NOT NULL DEFAULT '女',
        年龄 CHAR(3),
        系别 CHAR(8)
);
DESC student;
INSERT INTO student VALUES('st1','杨云','男','21','计算机');
INSERT INTO student VALUES('st2','李涛','女','20','数学');
INSERT INTO student VALUES('st3','沈韩韩','女','21','信息与计算科学');
SELECT * FROM student;

CREATE TABLE course(
        课程号 CHAR(6) PRIMARY KEY,
        课程名 CHAR(8),
        学分 INT,
        先选课程号 CHAR(5)
);
DESC course;
INSERT INTO course VALUES('kc1','数据库','4','');
INSERT INTO course VALUES('kc2','英语','4','');
INSERT INTO course VALUES('kc3','组成原理','2','kc1');
SELECT * FROM course;

CREATE TABLE sc(
        学号 CHAR(4) NOT NULL,
        课程号 CHAR(4) NOT NULL,
        成绩 INT
);
ALTER TABLE sc ADD CONSTRAINT pk_sc PRIMARY KEY (学号,课程号);
DESC sc;
INSERT INTO sc VALUES('st1','kc1','75');
INSERT INTO sc VALUES('st1','kc3','60');
INSERT INTO sc VALUES('st2','kc2','88');
INSERT INTO sc VALUES('st2','kc3','92');
INSERT INTO sc VALUES('st3','kc1','54');
INSERT INTO sc VALUES('st3','kc2','69');
INSERT INTO sc VALUES('st3','kc3','81');
SELECT * FROM sc;

CREATE TABLE tc(
        教师号 CHAR(4) NOT NULL,
        课程号 CHAR(4) NOT NULL
);
ALTER TABLE tc ADD CONSTRAINT pk_tc PRIMARY KEY (教师号,课程号);
DESC tc;
INSERT INTO tc VALUES('t1','kc2');
INSERT INTO tc VALUES('t2','kc1');
INSERT INTO tc VALUES('t2','kc3');
INSERT INTO tc VALUES('t2','kc2');
INSERT INTO tc VALUES('t3','kc1');
INSERT INTO tc VALUES('t3','kc3');
INSERT INTO tc VALUES('t4','kc3');
INSERT INTO tc VALUES('t5','kc1');
SELECT * FROM tc;

SHOW TABLES;
