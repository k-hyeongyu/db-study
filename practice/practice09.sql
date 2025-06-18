--퀴즈1
select
    profno,
    name,
    pay,
    bonus,
    to_char((pay*12 + nvl(bonus,0)), '999,999') as "TOTAL"
from professor
where deptno = 201;


--퀴즈2
select 
    empno,
    ename,
    comm,
    
    nvl2(comm, 'Exist','NULL') as NVL2
--    case
--        when comm is null then 'NULL'
--        else 'Exist'
--    end NVL
    
from emp
where deptno = 30;
