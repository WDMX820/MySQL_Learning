-- 第一题

INSERT INTO teacher
VALUES('T60','刘绪良','1987/5/18','男','讲师',0,3780)

SELECT *
FROM teacher
WHERE 姓名='刘绪良'

-- 第二题

INSERT INTO teacher(工号,姓名,婚否,生日,性别)
VALUES('T61','周渊博',1,'1987/2/16','男')

SELECT *
FROM teacher
WHERE 姓名='周渊博'

-- 第三题

INSERT INTO student
VALUES('S800','李蓓蓓','女','19','自动化',164)
SELECT *
FROM student
WHERE 姓名='李蓓蓓'

-- 第1-4题

INSERT INTO student(学号,姓名,性别)
VALUES('S810','郑勇军','男')

SELECT *
FROM student
WHERE 姓名='郑勇军'

-- 第2-1题

SELECT *
FROM teacher
ORDER BY 工资
LIMIT 5

UPDATE teacher
SET 工资=工资-200

-- 第2-2题

SELECT *
FROM teacher
WHERE 姓名='吴浩'

UPDATE teacher
SET 职称='讲师',生日='1987-5-13'
WHERE 姓名='吴浩'

-- 第2-3题

SELECT teacher.*
FROM teacher,course
WHERE teacher.`工号`=course.`任课教师编号`
ORDER BY 工资
LIMIT 5

UPDATE teacher
SET 工资=工资+300
WHERE 工号 IN (SELECT * FROM((
	SELECT teacher.`工号`
	FROM teacher,course
	WHERE teacher.`工号`=course.`任课教师编号`)
AS temp	))

SELECT 姓名,课号,工资
FROM teacher LEFT JOIN course
ON teacher.`工号`=course.`任课教师编号`
ORDER BY 课号

-- 第2-4题

UPDATE student
SET 身高=100

SELECT *
FROM student
ORDER BY 姓名 DESC
LIMIT 5

-- 第2-5题

SELECT *
FROM student
WHERE 系别='计算机'
ORDER BY 年龄 DESC
LIMIT 5

UPDATE student
SET 身高=身高*1.2,年龄=年龄+2
WHERE 系别='计算机'

-- 第2-6题

UPDATE student
SET 年龄=0
WHERE 学号 IN (
	SELECT 学号 FROM score
	WHERE 课号=(
		SELECT 课号 FROM course 
		WHERE 课名='数据库原理'))


SELECT *
FROM student
WHERE 学号 IN (
	SELECT 学号 FROM score
	WHERE 课号=(
		SELECT 课号 FROM course 
		WHERE 课名='数据库原理'))
ORDER BY 姓名
LIMIT 5

-- 第3-1题

DELETE FROM teacher
WHERE 姓名='周渊博'

SELECT *
FROM teacher
WHERE 姓名='周渊博'

-- 第3-2题

SELECT *
FROM teacher,course
WHERE teacher.`工号`=course.`任课教师编号`
ORDER BY 工资
LIMIT 5



DELETE FROM teacher
-- 网上搜索解决







