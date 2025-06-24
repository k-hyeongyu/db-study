/*************************************/
DDL

테이블 생성

create table 테이블명
(
    컬럼명 컬럼타입  기타속성 / 제약조건,
    컬럼명 컬럼타입  기타속성 / 제약조건,
    컬럼명 컬럼타입  기타속성 / 제약조건,
    컬럼명 컬럼타입  기타속성 / 제약조건,
    컬럼명 컬럼타입  기타속성 / 제약조건
);

create table new_table  --테이블 스키마(schema)
(
    no Number(3),
    name varchar(16),
    birth date
);

select * from new_table;

desc new_table;


create table new_table2
(
    no Number(3),
    name varchar(16),
    birth date
);

--테이블 복사
select *from dept2;

create table dept3    --dept2 테이블의 구조 + 데이터 복사 ->
as      
select *from dept2; 

select *from dept3;


create table dept4
as
select dcode, dname from dept3;   --컬럼의 원하는 부분만 복사 및 생성

select * from dept4;

--컬럼 구조만 동일하게 테이블 복사 (데이터는 제외)
create table dept5
as
select * from dept2
where 1=1
;

select * from dept5;

--테이블 변경(수정) 앵간하면 새로 만드는게 낫고 불가능시 변경
select * from dept4;

alter table dept4
add (loc varchar2(32));

alter table dept4  --새로운 컬럼을 추가하는 밥밥
add (lv number(4) default 5);

--컬럼 삭제
alter table dept4
drop column lv;

--테이블 삭제 rollback 불가함, 자동으로 commit됨. 주의하기
drop table 테이블명;

--테이블의 내부 데이터 삭제
truncate table 테이블명;

select * from dept4;

truncate table dept4; --테이블은 남지만 데이터가 사라짐
drop table dept4;  --테이블 전체 삭제

--insert, update, delete, (DML)

select * from new_table2;

insert into new_table2
values(99, '이름99', sysdate);

delete 데이터 삭제 (rollback 가능 : 자동 commit이 아닌 경우)

delete from 테이블명
where 조건;

select * from dept3;

select *
--delete
from dept3
where dcode = 1007;

commit;






