DESCRIBE course;
DESCRIBE score;
DESCRIBE student;
DESCRIBE teacher;

SELECT COUNT(工号) AS 教师人数
FROM teacher

SELECT COUNT(*) AS 讲师人数,
SUM(工资) AS 总工资,
AVG(工资) AS 平均工资,
MAX(工资) AS 最高工资,
MIN(工资) AS 最低工资
FROM teacher
WHERE 职称='讲师';

SELECT COUNT(*) AS 计算机系学生人数,
AVG(年龄) AS 平均年龄
FROM student
WHERE 系别='计算机';

SELECT COUNT(*) AS C01课程人数,
MAX(成绩) AS 最高分,
MIN(成绩) AS 最低分,
AVG(成绩) AS 平均分
FROM score
WHERE 课号='C01';

select 工号,姓名,工资
from teacher
order by 工资;

SELECT 工号,姓名,工资
FROM teacher
ORDER BY 工资 desc;

select *
from student
order by 系别

select *
from score
order by 学号,成绩 desc

select *
from teacher
order by 生日
limit 4

SELECT *
FROM student
ORDER BY 身高 desc
LIMIT 1

SELECT *
FROM student
where 身高=198;

select *
from score
order by 成绩 desc
limit 1

SELECT *
FROM score
WHERE 成绩=100;

select 职称,count(*)
from teacher
group by 职称

SELECT 职称,COUNT(*)
FROM teacher
GROUP BY 职称
having count(*)>3

select 职称,性别,
count(*) as 教师人数
from teacher
group by 职称,性别

SELECT 职称,性别,婚否,
COUNT(*) as 人数
FROM teacher
GROUP BY 职称,性别,婚否

select 系别,性别,
count(*) as 人数,
max(年龄) as 最高年龄,
min(年龄) as 最小年龄,
avg(年龄) as 平均年龄
from student
group by 系别,性别

SELECT 课号,
COUNT(*) AS 学生数,
AVG(成绩) AS 平均分
FROM score
GROUP BY 课号

select 学号,count(*) as 不合格门数
from score
where 成绩<60
group by 学号
HAVING COUNT(*)>1

SELECT 系别,
avg(年龄) AS 平均年龄
FROM student
GROUP BY 系别
order by 平均年龄 desc
limit 1




