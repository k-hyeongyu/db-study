----1,
select 
    ename,
    replace(ename, substr(ename, 3,2), '--') as replace
from emp
where deptno = 20;

----2------------
select 
    name,
    --substr(jumin,1,6) || '-/-/-/-' AS 주민번호자리숨김
    replace(jumin, substr(jumin, 7,7), '-/-/-/-')
from student
where deptno1 = 101;


-----------3-------------
/*응용) 가운데 자리 숫자의 자리수에 맞춰서 *로 바꾸기
      3자리 -> ***   053)266-8947 -> 053)***-8947
      4자리 -> ****/ 02)6255-9875 -> 02)****-9875
select 
    name,
    tel,
    replace(tel, substr(tel, 5,3), '***') as replace, 
    instr(tel, ')'),
    instr(tel, '-'),
    instr(tel, '-') - instr(tel, ')') - 1 as "가운데 자리 길이",
    substr(tel, 1, instr(tel, ')'))
    || lpad('*', instr(tel, '-') - instr(tel, ')') -1 ,'*')
    || substr(tel, -5,5) 
from student
--where deptno1 = 102;

-----------4----------------

select 
    name,
    tel,
    replace(tel, substr(tel, -4 ,4), '****') as replacee
from student
where deptno1 = 101;

select
    lpad('문자', 12, '*')
from dual;


