-- 实验2——DDL基本操作
-- 创建lzc表
CREATE TABLE Lzc(
	职工号 CHAR(6) NOT NULL PRIMARY KEY,
	姓名 VARCHAR(8),
	性别 CHAR(2) NOT NULL DEFAULT '男', -- 不填写则自动填"男"
	生日 DATE,
	部门号 INT  -- 最后一个不加","
);
-- 查看表的结构
DESCRIBE lzc

-- 修改部门号为不可以为空
ALTER TABLE lzc MODIFY 部门号 INT NOT NULL;

-- 插入一条数据（元组）
INSERT INTO lzc
VALUES('111','刘梓淳','男','2000-1-1',1);

-- select命令显示lzc表的数据
SELECT * FROM lzc;

-- 插入一条数据（元组）
INSERT INTO lzc
VALUES('112','刘峻可','男','2000-1-1',2)


-- 实验3——约束和select子句练习
-- 1、约束练习
CREATE TABLE s(
	SNO CHAR(6) PRIMARY KEY,
	SN CHAR(10) UNIQUE,  -- 定义SN为唯一键
	GRADE CHAR(16),
	NUMBER NUMERIC(3),  -- 精度为3的数值型
	SB DATE,
	PC CHAR(6),
	SEX CHAR(2)DEFAULT '男',
	CHECK (SEX IN('男','女')),  -- 性别的取值只能为"男"和"女"
	CHECK (GRADE BETWEEN 0 AND 100),  -- 约束成绩只能取0到100之间的数
	CONSTRAINT s_uniq UNIQUE (SN,SEX)  -- 定义sn+sex为唯一键
	FOREIGN KEY (PC) REFERENCES s(SNO)  -- 给PC属性增加外键约束
);
-- 删除主键约束
ALTER TABLE s DROP PRIMARY KEY;

-- 删除外键约束
ALTER TABLE c DROP FOREIGN KEY c_ibfk_l;

-- 删除唯一键约束（注意是index）
ALTER TABLE s DROP INDEX SNY;

-- 在已有的表SC上，增加完整性约束，使grade在0-100之间
ALTER TABLE s ADD CONSTRAINT grade_chk CHECK(grade BETWEEN 0 AND 100); 

-- 在已有的表C上，增加主键约束
ALTER TABLE s ADD PRIMARY KEY(CNO);

-- 2、select子句练习
-- 查询教师的姓名，性别和职称
SELECT 姓名,性别,职称 FROM teacher; 

-- 查询学生的姓名，性别，专业，并重命名为name,sex,dept（AS）
SELECT 姓名 AS sname,
       性别 AS sex,
       专业 AS dept
FROM student;

-- 利用表达式计算来查询教师姓名，生日，出生年和年龄（注意表达方式）
SELECT 姓名,生日,YEAR(生日) AS 出生年,
       YEAR(NOW())-YEAR(生日) AS 年龄
FROM teacher;

-- 查询学生的学号、姓名、性别、年龄和出生年
SELECT 学号,姓名,性别,年龄,
       YEAR(NOW())-年龄 AS 出生年
FROM student;


-- 实验4——基本SQL数据查询语句
-- 查询教师共有哪些职称（distinct短语）
SELECT DISTINCT 职称 FROM Teacher;

-- 查询所有男老师（where子句）（条件查询）
SELECT * FROM Teacher WHERE SEX='男';
-- 查询成绩高于85分的学生的信息
SELECT * FROM student WHERE 成绩>85;
-- 查询工资在5000到6000之间的教师
SELECT * FROM teacher WHERE 工资 BETWEEN 5000 AND 6000;
-- 查询工资为2300、2400、3600或4300的教师（IN）
SELECT * FROM teacher WHERE 工资 IN (2300,2400,3600,4300);

-- 查询选修C01或C07且此两科分数大于等于85分学生的课程号和成绩(🔺)
SELECT 课程号,成绩 FROM score WHERE 成绩>=85 AND 课号 IN ('C01','C07');

-- 查询姓刘的教师的信息（模糊查询）（LIKE）（%代表多个字符）
SELECT * FROM teacher WHERE 姓名 LIKE '%刘';
-- 查询名称中含有'数'的课程名
SELECT 课程名 FROM Course WHERE 课程名 LIKE '%数%';
-- 查询名字只有2个字且最后一个字是"明"的教师信息
SELECT * FROM teacher WHERE 姓名 LIKE '_明';
-- 查询名字中第二个字为“阳”的学生姓名和学号(🔺)
SELECT 姓名,学号 FROM student WHERE 姓名 LIKE '_阳%';
-- 查询所有不姓刘的学生姓名、学号和性别（NOT）
SELECT 姓名,学号,性别 FROM student WHERE 姓名 NOT LIKE '刘%';

-- 查询课程表中DB_Design课程的课程信息（转义字符'\'）(🔺)
SELECT * FROM course WHERE 课名 LIKE 'DB\_Design' ESCAPE '\\';
-- 查询课程表中以’DB_’开头，且，倒数第三个字符为i的课程的课程信息
SELECT * FROM course WHERE 课名 LIKE 'DB\_%i__' ESCAPE '\\';

-- 查询所有的男讲师或者女助教（灵活使用'or''and'以及小括号）
SELECT * FROM Teacher
WHERE (性别='男' AND 职称='讲师') 
OR    (性别='女' AND 职称='助教')
-- 查询自动化系的女同学
SELECT * FROM student WHERE 系别='自动化' AND 性别='女'

-- 查询课程表中无先选课的课程信息
SELECT * FROM course WHERE 先选课 IS NULL;


-- 实验5——SQL统计查询命令
-- 查询教师人数
SELECT COUNT(工号) AS 教师人数 FROM teacher;

-- 查询讲师的人数、总工资、平均工资、最高工资和最低工资
SELECT COUNT(工号) AS 讲师人数,
       SUM(工资) AS 总工资,
       AVG(工资) AS 平均工资,
       MAX(工资) AS 最高工资,
       MIN(工资) AS 最低工资
FROM teacher 
WHERE 职称='讲师';
-- 查询学“C01”课程的学生的人数、最高分、最低分和平均分
SELECT COUNT(*) AS C01课程人数,
       MAX(成绩) AS 最高分,
       MIN(成绩) AS 最低分,
       AVG(成绩) AS 平均分
FROM score WHERE 课号='C01'

-- 按工资的升序显示所有教师的工号、姓名和工资（order by）（默认升序:'asc'）
SELECT 工号,姓名,工资 FROM teacher ORDER BY 工资;
-- 现在改为工资的降序显示所有教师的工号、姓名和工资（降序:'desc'）🔺
SELECT 工号,姓名,工资 FROM teacher ORDER BY 工资 DESC;

-- 查询学生，且要求系相同的学生显示在一起（同为排序）
SELECT * FROM student ORDER BY 系别;
-- 查询score表，要求按学号的从小到大排序，同一学生按其成绩的从大到小排序（两个排序）
SELECT * FROM score ORDER BY 学号,成绩 DESC
-- 查询score表，要求按学号的从大到小排序，同一学生按其成绩的从大到小排序（两个排序）
SELECT * FROM score ORDER BY 学号 DESC,成绩 DESC  -- 注意'desc'的位置

-- 查询年龄最大的4位教师（limit子句）（年龄降序即为生日升序）
SELECT * FROM teacher ORDER BY 生日 LIMIT 4;
-- 查询长得最高的学生（存在不止一个为最高则以身高返回去查询）
SELECT * FROM student ORDER BY 身高 DESC LIMIT 1; 

-- 查询教师表中不同职称的人数（分组统计查询）（group by子句）🔺🔺
SELECT 职称,COUNT(*) AS 人数
FROM teacher
GROUP BY 职称
-- 查询教师人数在3人以上的职称及其人数（Having子句）🔺
SELECT 职称,COUNT(*) AS 人数
FROM teacher
GROUP BY 职称
HAVING COUNT(*)>3

-- 查询各职称的不同性别的教师人数（多级分组的用法）🔺
SELECT 职称,性别,COUNT(*) AS 教师人数
FROM teacher
GROUP BY 职称,性别
-- 查询各职称的不同性别的不同婚姻状况的人数
SELECT 职称,性别,婚否,COUNT(*) AS 人数
FROM teacher
GROUP BY 职称,性别,婚否
-- 查询各个系的男女学生的人数、最高年龄、最小年龄和平均年龄🔺
SELECT 系别,性别,
       COUNT(*) AS 人数,
       MAX(年龄) AS 最高年龄,
       MIN(年龄) AS 最小年龄,
       AVG(年龄) AS 平均年龄
FROM student
GROUP BY 系别,性别
-- 查询score表中每个课号有多少学生在学，平均分是多少
SELECT 课号,COUNT(*) AS 人数,
       AVG(成绩) AS 平均分
FROM score
GROUP BY 课号
-- 查询score表中每个课程号不及格的人数是多少
SELECT 课号,COUNT(学号) AS 不及格人数
FROM score
WHERE 成绩<60
GROUP BY 课号
-- 查询score表中有哪些学号不及格的课程数超过了1门，他们不及格的课程数是多少？
SELECT 学号,COUNT(*) AS 不及格门数
FROM score
WHERE 成绩<60
GROUP BY 学号
HAVING COUNT(*)>1
-- 查询平均年龄最大的系的名字及其平均年龄值（'order by'和'limit'放在靠后）
SELECT 系别,AVG(年龄) AS 平均年龄值
FROM student
GROUP BY 系别
ORDER BY 平均年龄值 DESC
LIMIT 1


-- 实验6——掌握一定的SQL表达式
-- 查询有课教师的姓名、职称及其所授的课程名
SELECT 姓名,职称,课名
FROM teacher,course
WHERE teacher.`工号`=course.`教师`      -- 两个表均有而同列数据相等

-- 查询所有教师的姓名、职称及其所授的课程名▲▲（左连接保存所有左边信息）
SELECT 姓名,职称,课名
FROM teacher LEFT JOIN course ON teacher.`工号`=course.`教师`  -- 'ON'相当于'WHERE'

-- 查询有课的学生的学号，姓名和所学的课号及成绩
SELECT 姓名,student.`学号`,课号,成绩       -- '学号'出现多次则选一个写前缀
FROM score,student
WHERE score.`学号`=student.`学号`

-- 查询没课的学生的学号，姓名和性别（连接score表，因为有外键）
SELECT student.`学号`,姓名,性别
FROM student LEFT JOIN score ON student.`学号`=score.`学号`
WHERE 课号 IS NULL

-- 查询有课学生的姓名、所学的课名及成绩
-- 方法一：一般连接
SELECT 姓名,课名,成绩
FROM student,course,score
WHERE score.`学号`=student.`学号` AND score.`课号`=course.`课号`
-- 方法二：内连接
SELECT 姓名,课名,成绩
FROM score JOIN student ON score.`学号`=student.`学号`
JOIN course ON score.`课号`=course.`课号`

-- 查询与周华同一系的所有学生
SELECT * FROM student WHERE 系别=
(SELECT 系别 FROM student WHERE 姓名='周华')

-- 查询比所有讲师工资少的教师姓名🔺🔺
SELECT 姓名 FROM teacher WHERE 工资<ALL
(SELECT 工资 FROM teacher WHERE 职称='讲师')

-- 查询至少有一门课不及格的学生的学号、姓名与系别（其实本查询完全可以通过连接+条件查询实现）
SELECT 学号,姓名,系别
FROM student
WHERE EXISTS (SELECT * FROM score WHERE student.`学号`=score.`学号` AND 成绩<60)

-- 查询课程成绩全都及格了的学生的学号、姓名与系别
SELECT 学号,姓名,系别
FROM student
WHERE NOT EXISTS (SELECT * FROM score WHERE student.`学号`=score.`学号` AND 成绩<60)

-- 查询与最年轻的一位教师职称相同的教师（联合使用）
SELECT * FROM teacher WHERE 职称=
(SELECT 职称 FROM teacher ORDER BY 生日 DESC LIMIT 1)

-- 查询潘强老师教过的所有学生（多个用'IN'）
SELECT * FROM student WHERE 学号 IN
(SELECT 学号 FROM score WHERE 课号=
(SELECT 课号 FROM course WHERE 教师=
(SELECT 工号 FROM teacher WHERE 姓名='潘强')))

-- 综合查询练习
-- 查询小于全体学生平均年龄的学生
-- 方法一
SELECT * FROM student WHERE 年龄<
(SELECT AVG(年龄) FROM student)
-- 方法二（临时表法）
SELECT * FROM student,(SELECT AVG(年龄) AS 平均年龄 FROM student) AS temp
WHERE 年龄<temp.平均年龄

-- 查询有课老师的人数和平均年龄🔺🔺
SELECT COUNT(teacher.`姓名`) AS 有课老师人数,AVG(YEAR(NOW())-YEAR(生日)) AS 平均年龄
FROM teacher WHERE teacher.`姓名` IN
(SELECT 姓名 
FROM teacher,course
WHERE teacher.`工号`=course.`教师`
GROUP BY teacher.`姓名`)   -- 去掉一人多课的重复情况

-- 查询所有学生的学号，姓名，课程数和平均成绩（所有即左连接保留所有学生）
SELECT student.`学号`,姓名,COUNT(课号) AS 课程数,AVG(成绩) AS 平均成绩
FROM student LEFT JOIN score ON student.`学号`=score.`学号` 
GROUP BY student.`学号`    -- 分组看清楚对象

-- 查询重名学生的信息
-- 方法一：自连接法
SELECT cx.*
FROM student AS cx,student AS cy
WHERE cx.姓名=cy.姓名 AND cx.学号!=cy.学号
-- 方法二：嵌套法
SELECT * FROM student
WHERE 姓名 IN (SELECT 姓名 FROM student) 
AND 学号 NOT IN(SELECT 学号 FROM student)

SELECT * FROM student
WHERE 姓名 IN (SELECT 姓名 FROM student GROUP BY 姓名 HAVING COUNT(*)>1)

-- 方法三：统计法
SELECT * FROM student 
GROUP BY 姓名
HAVING COUNT(姓名)>1


-- 实验7-—插入更新删除

-- 1、插入操作
-- 增加一名教师，用填写完整行数据格式，并查询
INSERT INTO teacher
VALUES('T60','刘梓淳','2002/8/20','男','教授',0,8000)

SELECT * FROM teacher WHERE 姓名='刘梓淳'

-- 增加一名教师，用填写部分信息格式（部分格式）
INSERT INTO teacher(工号,姓名,婚否,生日,性别)
VALUES('T61','沈思韩',1,'2001/11/25','女')

-- 在student表中增加一名叫"郑勇军"的男同学，其学号为"S811"（注：其它数据不填）
INSERT INTO student(姓名,学号,性别)
VALUES('郑勇军','S811','男')

SELECT * FROM student WHERE 姓名='郑勇军'

-- 2、更新操作🔺🔺
-- 将所有老师的工资减200
UPDATE teacher SET 工资=工资-200

SELECT * FROM teacher ORDER BY 工资 DESC LIMIT 5   -- 用于检查

-- 将潘强老师的职称改为讲师，生日改成1978-5-13
UPDATE teacher SET 职称='讲师',生日='1978/5/13'
WHERE 姓名='潘强'

SELECT * FROM teacher WHERE 姓名='潘强'   -- 用于检查

-- 将有课老师的工资增加300（嵌套查询+临时表）🔺🔺🔺
UPDATE teacher SET 工资=工资+300
WHERE 工号 IN (SELECT * FROM(
SELECT 工号 FROM teacher,course
WHERE teacher.`工号`=course.`教师`) AS temp)  -- 为什么用临时表？

-- 将student表中所有学生的身高置为100
UPDATE student SET 身高=100

-- 将student表中计算机系的学生的身高增加20%,年龄增加2（注意系别带''）
UPDATE student SET 身高=身高*1.2,年龄=年龄+2
WHERE 系别='计算机'

-- 将学习了“数据库原理”课程的学生的年龄修改为0（三个表-三重嵌套）🔺🔺🔺
UPDATE student SET 年龄=0
WHERE 学号 IN(
SELECT 学号 FROM score WHERE 课号 IN (
SELECT 课号 FROM course WHERE 课名='数据库原理'))

-- 3、删除操作🔺🔺
-- 删除前面增加的那位叫“周渊博”的老师
DELETE FROM teacher
WHERE 姓名='周渊博'

-- 删除没课的老师🔺🔺（嵌套操作注意临时表的使用）
DELETE FROM teacher
WHERE 工号 NOT IN (
SELECT * FROM (SELECT 工号 FROM teacher,course
WHERE teacher.`工号`=course.`教师`) AS temp)

-- 删除student表中那些一门课成绩都没有的同学🔺
DELETE FROM student
WHERE 学号 NOT IN(SELECT student.`学号` FROM(SELECT 学号 FROM score)AS temp)


-- 实验8--索引和视图的定义与使用
-- 1、索引实验🔺
-- 给学生表创建一个名为“idx_你的姓名拼音_xh”的按学号字段升序排列的唯一索引
CREATE UNIQUE INDEX idx_lzc_xh ON 学生(学号)
-- 给学生表创建一个名为“idx_你的姓名拼音_xm”的按姓名字段的降序排列的普通索引
ALTER TABLE 学生 ADD INDEX idx_lzc_xm (姓名 DESC)

-- 2、视图实验🔺
-- 创建20岁学生的视图xs_20🔺
CREATE VIEW xs_20 AS SELECT * FROM 学生 WHERE 年龄=20;

-- 创建物联网系学生视图xs_wlw
-- 可能出现一种中文字符比较规则混乱而引起的错误，在中文字符串常量前加"N"解决
CREATE VIEW xs_wlw AS SELECT * FROM 学生 WHERE 系别=N'物联网'; 

-- WITH CHECK OPTION（更新视图前对新插入或修改的数据进行检查） 









