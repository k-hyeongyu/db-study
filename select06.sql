/************************************************/

기타 복수행 함수

--부서와 직업별 평균 급여 및 사원수
select deptno, job, avg(sal) 평균급여, count(*) 사원수
from emp
group by deptno, job;

--부서별 평균 급여와 사원수
select deptno, avg(sal) 평균급여, count(*) 사원수
from emp
group by deptno;


--전체 사원의 평균 급여와 사원수
select avg(sal) 평균급여, count(*) 사원수
from emp;



select deptno, job, avg(sal) 평균급여, count(*) 사원수
from emp
group by deptno, job
union all
select deptno, null, avg(sal) 평균급여, count(*) 사원수
from emp
group by deptno
union all
select null, null, avg(sal) 평균급여, count(*) 사원수
from emp
order by deptno, 2;

select deptno, job, avg(sal) 평균급여, count(*) 사원수
from emp
group by rollup( (deptno, job) );

group by rollup(deptno, job);
1) deptno, job 그룹화 데이터
2) deptno 그룹화 데이터
3) ()그룹화 데이터

group by rollup(empno, deptno, job);
1) empno, deptno, job
2) empno, deptno
3) empno
4) ()

group by rollup(empno, (deptno, job));
1) empno, deptno, job
2) empno
3) ()

select deptno, job, avg(sal) 평균급여, count(*) 사원수
from emp
group by cube( deptno, job );



순위 RANK() over (order by 정렬기준대상)
그룹단위 순위 rank() over (partition by 기준 order by 정렬기준대상)
dense_rank()


select 
    ename,
    sal,
    rank() over (order by sal desc) 급여순위,
    dense_rank() over (order by sal desc) 급여순위
from emp;

select
    name,
    height,
    rank() over (order by height desc) 키순위,
    dense_rank() over (order by height desc) 키순위, 
    grade,
    rank() over (partition by grade order by height desc) 키순위,
    dense_rank() over (partition by grade order by height desc) 키순위
from student;

