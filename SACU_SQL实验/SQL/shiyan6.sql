SELECT 姓名,职称,课名
FROM teacher,course
WHERE teacher.`工号`=course.`任课教师编号`

SELECT 姓名,职称,课名
FROM teacher JOIN course ON teacher.`工号`=course.`任课教师编号`

SELECT 姓名,职称,课名
FROM teacher LEFT JOIN course ON teacher.`工号`=course.`任课教师编号`

SELECT 姓名,student.`学号`,课号,成绩
FROM student,score
WHERE student.`学号`=score.`学号`

SELECT 学号,姓名,性别
FROM student
WHERE 学号 NOT IN (SELECT 学号 FROM score)

SELECT student.学号,姓名,性别
FROM student LEFT JOIN score ON student.`学号`=score.`学号`
WHERE 课号 IS NULL

SELECT student.`姓名`, course.`课名`, score.`成绩`
FROM score
INNER JOIN student ON score.`学号` = student.`学号`
INNER JOIN course ON course.`课号` = score.`课号`;

select 工资
from teacher
where 职称='讲师'

SELECT 学号,姓名 FROM student
WHERE 系别 =
(sELECT 系别 FROM student
WHERE 姓名 = '周华');

SELECT 课名,教室
FROM course
WHERE 任课教师编号 = (
	SELECT 工号 FROM teacher
	WHERE 姓名 = '罗明军'
);


select 姓名,工资,职称
from teacher
where 工资<any(select 工资
	from teacher
	where 职称='讲师')
	
	
SELECT 姓名,工资,职称
FROM teacher
WHERE 工资<all(SELECT 工资
	FROM teacher
	WHERE 职称='讲师')

select 学号,姓名,系别
from student
where exists (select * from score where student.`学号`=score.`学号` and 成绩<60)

SELECT 学号,姓名,系别
FROM student
WHERE NOT exists
(SELECT * FROM score
WHERE score.`学号`=student.`学号`
and score.`成绩`<60);

SELECT 学号,姓名,系别
FROM student
WHERE 学号 NOT in
(SELECT 学号 FROM score
where score.`成绩`<60);
	


SELECT student.`学号`,姓名,系别
FROM student,score
where student.`学号`=score.`学号` AND 成绩>60


SELECT 学号,姓名,系别
FROM student
where 学号 = (select 学号 from score where 学号 not in(
select 学号 from score where 成绩 < 60))

select *
from teacher
where 职称 = (SELECT 职称 from teacher
ORDER BY 生日 DESC
limit 1)

SELECT *
FROM teacher JOIN student ON teacher.`姓名`=student.`姓名`

SELECT *
FROM teacher
WHERE 职称 = (SELECT 职称 FROM teacher
ORDER BY 生日 DESC
LIMIT 1)

SELECT *
FROM student
WHERE student.`学号` in
(select 学号
from score
where score.`课号`=
(select 课号
from course
where course.`任课教师编号`=
(SELECT 工号
FROM teacher
WHERE teacher.`姓名`='潘强')))


select *
from teacher
where 姓名=any(select 姓名
	from student)
	
select *
from student,(select avg(年龄) as 平均年龄 from student) as temp
where 年龄 < temp.平均年龄

-- 第一版:查询有课老师的人数和平均年龄

select COUNT(teacher.`姓名`) AS 有课老师人数,avg(YEAR(NOW())-YEAR(生日)) AS 平均年龄
from teacher
where teacher.`姓名` in
(SELECT 姓名
FROM teacher,course
WHERE teacher.`工号`=course.`任课教师编号`
group by teacher.`姓名`)


select student.`学号`,姓名,count(课号) as 课程数,avg(成绩) as 平均成绩
from student left join score on student.`学号`=score.`学号`
WHERE 课号 IS NULL
GROUP BY student.`学号`

SELECT student.`学号`,姓名,COUNT(课号) AS 课程数,AVG(成绩) AS 平均成绩
FROM student JOIN score ON student.`学号`=score.`学号`
GROUP BY student.`学号`

SELECT student.`学号`,姓名,COUNT(课号) AS 课程数,AVG(成绩) AS 平均成绩
FROM student JOIN score ON student.`学号`=score.`学号`
WHERE 课号 IS NULL
GROUP BY student.`学号`

select * 
FROM student LEFT JOIN score ON student.`学号`=score.`学号`

-- 查找同名的学生

select *
from student
group by 姓名
having count(姓名)>1



select *
from student
where 姓名 in
(select 姓名
from student
group by 姓名
having count(*)>1)


select cx.*
from student as cx,student as cy
where cx.姓名=cy.姓名 and cx.学号!=cy.学号











