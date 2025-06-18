select 
    studno,
    name,
    /*lpad(birthday, 10, 19)*/
    to_char(birthday, 'yyyy-mm-dd') birthday
from student
where to_char(birthday, 'MM') in ('01');

select 
    empno,
    ename,
    hiredate
from emp
where to_char(hiredate, 'MM') in ('01', '02', '03');