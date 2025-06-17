/***************************************************/
--1.조회하기 select 

select 조회 대상 from 테이블명; --하나의 테이블 명령어

select * from dept;

테이블 구조확인 (Describe)
DESC 테이블명;
desc dept;

select * from fruit;
select * from loan;
select * from product; --product 테이블에 있는 전체 컬럼 데이터 조회

select * from emp;
select mgr, hiredate from emp;

--가독성
Select *
from emp;

select
    empno,
    ename,
    comm
from emp;

desc emp;


select 컬럼명 as "컬럼별칭",
       컬럼명 "컬럼별칭"
       컬럼명 컬럼별칭
from 테이블명;

select empno as "사원번호",  --emp
       ename "사원명", /*as를 쓰는 경우는 가독성의 향상*/
       job 직책,
       sal as "급여 데이터"
from emp;

--리터럴 값
select '문자',  12345 from 테이블명;
select '문자',  12345 from dual; --dual 임시테이블
select '문자테스트' as "문자확인컬럼 헤더", 123+123 연산결과 from dual;


select '이것은 문자', 123123, loc, dname from dept;
select '안녕' from emp; 

/***************************************************************/
--distinct 중복제거
select * from emp;
select distinct job from emp; 
select distinct(job) from emp; 
--고른다 중복제거후  job에서 emp의

select distinct deptno from emp;
select distinct deptno, job from emp; --여러개 컬럼 조합하여 중복제거 두가지의 조건을 만족시켜야 한다.

select distinct (job), sal from emp; --두개 컬럼조합 중복제거
select distinct job, sal from emp; 
select job, sal from emp; 

select deptno "부서번호",
       dname "부서이름",
       loc as "위치"
from dept;

select name || '('|| id ||')' as "교수정보",
       position,
       hiredate as "입사일자",
       email as "이메일"
from professor
