CREATE TABLE temp_dept2
AS;

SELECT * FROM dept2;

--1. temp_dept2 테이블에 아래와 같은 내용으로 새로운 부서정보를 입력하세요.
--* 부서번호 : 9010
--* 부서명 : temp_10
--* 상위부서 : 1006
--* 지역 : temp area
SELECT * FROM temp_dept2;

insert into temp_dept2 (dcode, dname, pdept, area)
values (9010, 'temp_10', 1006, 'temp area');


--2. temp_dept2 테이블에 아래와 같은 내용으로 특정컬럼에만 정보를 입력하세요
--* 부서번호 : 9020
--* 부서명 : temp_20
--* 상위부서 : Business Department ( 1006 번 부서 )
SELECT * FROM temp_dept2;

insert into temp_dept2 (dcode, dname, pdept)
values (9020, 'temp_20', 1006);


--3.professor 테이블에서 profno 가 3000 번 이하의 교수들의
--profno , name , pay, bonus 를가져와서
--새로운 new_professor 테이블을 생성하면서 데이터 한번에 넘겨지며 저장하는 쿼리를 쓰세요.
SELECT * FROM new_professor;

create table new_professor
as
select profno , name , pay, bonus
from professor
where profno <= 3000;


--4. new_professor 테이블에서 'Sharon Stone' 교수의 BONUS 를 100 만원으로 인상하세요.

update new_professor
set bonus  = 100
--SELECT * FROM new_professor
where name = 'Winona Ryder';


sELECT * FROM new_professor;

