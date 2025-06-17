--1.
select 
    studno 번호, 
    name 이름,
    id 아이디
from student
where height >= 160 AND height <= 175

union

select 
    profno,
    name,
    id
FROM professor
where
    deptno in(101,102,103,201)
    and bonus is null;

2.학생들의 이름, 아이디, 주민번호를 아래와 같은 형태로 정리해서 보여주시오.
select 
    '이름 : ' || name as "이름",
    '아이디 : ' || id as 아이디,
    '주민번호 : ' || substr(jumin,1,6) || '-' || substr(jumin, 7, 7)as 주민번호
    --앞 6자리 - 뒷 7자리
from student;

