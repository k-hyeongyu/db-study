--1.
--student, department 테이블 활용
--학과 이름, 학과별 최대키, 학과별 최대키를 가진 학생들의 이름과 키를 출력 하세요.
select * from student;
select * from department;

--다중컬럼

--서브쿼리에서 계산 후 비교

--순위
select *
from(
    select deptno1, max(height) max_height
    from student
    group by deptno1) a, student b, department c; --인라인뷰
where a.deptno1 = b.deptno1 and a.max_height = b.height and b.deptno1 = c.deptno;

select 
    d.dname,
    s.height max_height,
    s.name,
    s.height
from student s, department d
where(deptno1, height) in (select deptno1, max(height)
                            from student
                            group by deptno1)
and s.deptno1 = d.deptno;




--2.
--student 테이블에서 학생의 키가 동일 학년의 평균 키 보다 큰 학생들의 학년과 이름과 키,
--해당 학년의 평균 키를 출력 하세요.
--(학년 컬럼으로 오름차순 정렬해서 출력하세요)


select grade, avg(height)
from student
group by grade;



student 
    a.grade,
    a.name,
    a.height,
    (select  avg(b.height)
                    from student b
                    where b.grade = a.grade) avg_height
from student a
where a.height > (select avg(b.height)
                    from student b
                    where b.grade = a.grade)
                    
order by a.grade;


select
    b.grade, b.name, b.height, a.avg_height
from (select grade, avg(height))







