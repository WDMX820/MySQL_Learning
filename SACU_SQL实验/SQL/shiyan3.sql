CREATE TABLE S
(
        SNO CHAR(6) PRIMARY KEY,
        SN CHAR(10),
        SD CHAR(16),
        SB DATE,
        SEX CHAR(2)DEFAULT'男',
        CHECK (SEX IN('男','女'))
);

CREATE TABLE C
(
        CNO CHAR(6) PRIMARY KEY,
        CN CHAR(10),
        PC CHAR(6),
        FOREIGN KEY (PC) REFERENCES C(CNO)
);

ALTER TABLE C DROP PRIMARY KEY;

SHOW CREATE TABLE C;

ALTER TABLE C DROP FOREIGN KEY c_ibfk_1;

CREATE TABLE SC
(
        SNO CHAR(6),
        CNO CHAR(6),
        GRADE DEC(4,1),
        PRIMARY KEY(SNO,CNO),
        FOREIGN KEY (SNO) REFERENCES S(SNO),
        FOREIGN KEY (CNO) REFERENCES C(CNO),
        CHECK (GRADE BETWEEN 0 AND 100)
);    
 
CREATE TABLE SS
(
        SNO CHAR(6),
        SN CHAR(8) UNIQUE,
        SEX CHAR(2),
        AGE NUMERIC(2) 
);

INSERT INTO SS VALUES('1','kc1','男','13');
INSERT INTO SS VALUES('3','kc1','女','16');

ALTER TABLE SS DROP INDEX SN;
 
CREATE TABLE SSS
(
        SNO CHAR(5),
        SN char(8),
        SEX char(2),
        constraint SSS_UNIQ unique (SN,SEX) 
);
 
alter table SSS drop index SSS_UNIQ; 

alter table SC
add constraint grade_chk check(grade between 0 and 100);

alter table C ADD PRIMARY KEY(CNO);

DROP TABLE IF EXISTS C; 
DROP TABLE IF EXISTS SC; 


select 姓名 as name, 
       性别 As sex,
       系别 as dept
from student;

select 姓名,year(生日) as 出生年,
       year(Now())-year(生日) as 年龄
from teacher;

select 课号,课名,教室 from course;

select 学号,姓名,性别,年龄,
       year(now())-年龄 as 出生年
from student;

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 