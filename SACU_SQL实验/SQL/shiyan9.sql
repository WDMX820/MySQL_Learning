CREATE DATABASE 刘梓淳

USE 刘梓淳

SHOW TABLES;



SELECT * FROM student;

CREATE USER '刘昳' @'%' IDENTIFIED BY '200217';

SELECT * FROM mysql.user WHERE USER='刘昳';

GRANT SELECT,INSERT ON 刘梓淳.`student` TO '刘昳' @'%';

SHOW CREATE TABLE course;

UPDATE course SET 教师='K47' WHERE 课号='C01';

UPDATE teacher SET 工号='T99' WHERE 工号='T01';

UPDATE course SET 教师='T12' WHERE 课号='C08';

UPDATE teacher SET 工号='T88' WHERE 工号='T14';

ALTER TABLE course DROP FOREIGN KEY fk_js;

ALTER TABLE course ADD CONSTRAINT fk_js FOREIGN KEY(教师)
REFERENCES teacher.`工号` ON UPDATE CASCADE;

SELECT 课号,课名
FROM teacher,course
WHERE teacher.`工号`=course.`教师` AND teacher.`工号`='T01'

UPDATE teacher SET 工号='T99' WHERE 工号='T01'

SELECT * FROM course

ALTER TABLE student ADD CHECK (年龄 BETWEEN 15 AND 30);

ALTER TABLE student ADD CHECK(性别 IN ('男','女'))

DELETE FROM student WHERE 学号='S8988';


ALTER TABLE student
MODIFY 性别 ENUM('男','女')
NOT FULL DEFAULT 




















