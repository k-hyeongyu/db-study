/***********************************/
단일행 함수

select * from dual;

dual : 더미 데이터가 들어있는 임시로 사용하는 테이블

select initcap('abc') from dual;

select ename, initcap(ename)
from emp;

select name, lower(name), upper(name)
from student;

select name, length(name)
from student;

select length('asdfasdgg'), lengthb('asdfasdgg'),
       length('한글'),  lengthb('한글') --한글의 한음절은 3byte--
from dual;

--이름이 알파벳 5자 이상만 조회
select *
from emp
where length(ename) >= 5;

/****/
select '아침' || '점심' || '저녁', concat('아침','점심')
from dual;

--substr (대상값/ 컬럼명, 시작지점, 자릿수)
select 
        substr('asdfdag', 1,3),  --앞의 첫번째부터 3개
        substr('asdfdag', 3,5),  --앞의 세번째부터 5개
        substr('asdfdag', -5, 2) --뒤의 다섯번째부터 2개
from dual;

--instr(대상값/컬럼명, 찾는값)
--instr(대상값/컬럼명, 찾는값, 시작위치)
--instr(대상값/컬럼명, 찾는값, 시작위치, 몇번째값)
select 
    instr('2025-06-01 10:25:45', '-'),
    instr('2025-06-01 10:25:45', ':'),
    instr('2025-06-01 10:25:45', '-', 7),
    instr('2025-06-01 10:25:45', ':', 15),
    instr('2025-06-01 10:25:45', '-', 1, 2)
from dual;

select 
    tel,
    instr(tel, ')')
from student; --010-1234-5678


select
    lpad('문자', 10, '-'),
    rpad('123', 6, '*'),
    lpad(5, 2, 0),
    lpad(15, 2, 0)
from dual;

--trim 공백제거
select
    ltrim(' abc '),
    rtrim(' abc '),
    ltrim('*abc*', '*') --왼쪽의 *을 삭제
from dual;

select
    replace('abcde', 'c', '/') --c가 들어갈 곳에 /삽입
from dual;

select
    birthday,
    replace(birthday, '/', '$') 
from student;

--1번
select 
    name"이름",
    substr(birthday, 1,2) as 년도,
    substr(birthday, 4,2) as 월,
    substr(birthday, 7,2) as 일
from student;


--2번
select
    name,
    tel,
    instr(tel,')') as "괄호위치"
from student
where deptno1 = 201;

--3번
select
    name,
    tel,
    instr(tel, '3') as "3의 위치"
from student
where deptno1 = 101;

--4번

select
    name,
    tel,
    SUBSTR(TEL, 1, instr(tel, ')') -1) as "지역번호"  
from student
where deptno1 = 201;



