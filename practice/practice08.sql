--1번

select 
    empno,
    ename,
    to_char((sal*12 + comm), '99,999') as "salary"
from emp
where empno = 7499;

emp 테이블을 조회하여 comm 값을 가지고 있는 사람들의 empno , ename , hiredate,
총연봉,15% 인상 후 연봉을 아래 화면처럼 출력하세요.
단 총연봉은 (sal*12)+comm 으로 계산하고
아래 화면에서는 SAL 로 출력되었으며
15% 인상한 값은 총연봉의 15% 인상 값입니다.

select 
    empno,
    ename,
    to_char(hiredate, 'yyyy-mm-dd') as hiredate,
    '$' || to_char( (sal*12) + comm, 99,999) sal,
    to_char( (sal*12)+comm)* 1.15, '$999,999') as "15% 인상"
from emp
where comm is not null;






