/*******************************************************************/
서브쿼리

select (select from where) 스칼라 서브쿼리
from (select from where) 인라인 뷰
where (select from where) 서브쿼리



select * from emp;

20번 부서만 조회

select * from emp
where deptno =20;

사번이 7844인 사원과 같은 부서사람들 조회
--where deptno =7844 사람의 부서번호
select * from emp
where deptno = (select deptno
                from emp
                where empno = 7844);
                
                
select * from emp2;
select * from dept2;

포항 사무실의 직원목록 조회

--join 버전
select *
from emp2 e, dept2 d
where e.deptno = d.dcode
and area = 'Pohang Main Office';  --문자열은 대소문자 주의

select *
from emp2
where deptno IN (select dcode
                from dept2
                where area = 'Pohang Main Office');
                --in(0001,1003,1006,1007)
                
                
select *
from emp2
where deptno IN (select dcode
                from dept2
                where area = 'Pohang Main Office'
                and dcode = 1003);                


select *
from emp2
where deptno IN (select dcode
                from dept2
                where area = 'Pohang Main Office'
                and dcode = deptno);  







           
 --학생들 중에 학번이 9513 학생보다 키가 작은 학생조회               
select *
from student;


select *   --학생 테이블의 모든 정보중
from student
where height < (select height --키에서 9513번 학생보다 키가 작은 사람
                from student
                where studno = 9513)
order by height;

select grade, max(weight)
from student
group by grade;

select *
from student      -- >any <any >all <all
where weight > (select max(weight)
                    from student
                    where grade = 2
                    );
                    
select *
from student      -- >any <any >all <all
where weight < any (select max(weight)
                    from student
                    group by grade
                    );
--각 학년별로 몸무게가 제일 많이 나각는 학생의 정보를 조회--

--다중행 비교(in)
--다중 컬럼 비교
select *
from student
where (grade, weight) in (select grade, max(weight)
                 from student
                 group by grade)
                 order by grade;
                   

--전체 평균 급여보다 많이 받는 직원 목록 조회
select *
from emp2
where pay > (select avg(pay)
             from emp2);
select *
from emp2 a
where pay > (select avg(pay)
             from emp2 b
             where b.position = a.position);

--각자 자신이 같은 고용형태emp_type 의 평균 급여보다 적게 받는 직원목록 조회

--고용 형태별 평균 급여
select emp_type, avg(pay) avg_pay
    from emp2
    group by emp_type;

select *
from emp2 a, (select emp_type, avg(pay) avg_pay
            from emp2
            group by emp_type) b
where a.emp_type = b.emp_type
and a.pay < b.avg_pay ;         

select
    rownum,
    ceil(rownum/3),
    studno,
    name,
    grade,
    height
from student;
order by height desc;


select 
    rownum,
    studno,
    height
from
    (
    select
        studno,
        name,
        grade,
        height
    from student
    order by height desc
    );

emp테이블, dept테이블 조회, 부서번호와 부서별 최대급여, 부서명 조회

select * from emp;
select * from dept;


select
    e.deptno, e.max_sal, d.dname

from
(select 
    deptno,
    max(sal) max_sal
from emp e
group by deptno)e, dept d
where e.deptno = d.deptno;


select
    e.deptno,
    e.max_sal,
    (select dname
       from dept d
       where d.deptno = e.deptno) 부서명
from
(select 
    deptno,
    max(sal) max_sal
from emp e
group by deptno)e, dept d
where e.deptno = d.deptno;

--join -> group by 집계
select 
    deptno, max(sal), dname
from(
    select e.deptno, e.sal, d.dname
    from emp e, dept d
    where e.deptno = d.deptno)
group by deptno, dname;




/*************************************************************/
select * from emp2;
select * from dept2;
--사원이름, 부서번호, 부서이름
--join

select e.name, e.deptno, d.dname
from emp2 e, dept2 d
where e.deptno = d.dcode;

--서브쿼리
select
    name, deptno,
    (select dname
        from dept2
        where dcode = deptno)
from emp2;

select dname
from dept2
where dcode = 1000;

select * from panmae;
select * from product;

select
    p_date,
    p_code,
    (select p_name
     from product pd
     where pd.p_code = pm.p_code) 상품명
from panmae pm;

/************************************************/

select *
from(
    select 
        e.empno,
        e.ename,
        e.job,
        e.deptno,
        d.dname,
        d.loc
    from emp e, dept d
    where e.deptno = d.deptno);


select
    emp_number, emp_name
from(
    select 
        e.empno emp_number,
        e.ename emp_name,
        e.job,
        e.deptno,
        d.dname,
        d.loc
    from emp e, dept d
    where e.deptno = d.deptno);


select dcode
from dept2
where area = 'Pohang Main Office';










