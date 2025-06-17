--1번
select 
    name as"이름",
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
    tel,            --instr(tel, ')')-1 이부분은 tel의 )의 앞자리까지 원자마다 유동성으로 바뀌게 됨
    SUBSTR(TEL, 1, instr(tel, ')')-1) as "지역번호"  
    /*  instr(tel, ')') 이부분은 *)*의 위치를 알아내고 SUBSTR를 사용하여
    첫번째부터 *)*의 앞자리 숫자까지 출력한ㄷ, */
from student
where deptno1 = 201;













