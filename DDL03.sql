/**********************************/
DDL 제약조건 KEY

PK (primary key) (기본키)
FK (foreign key) (외래키)

select * from student; -> profno -> professor
select * from emp; -> deptno -> dept;

create table tt03
(
    no number(3) primary key,
    name varchar2(16) not null,
    birth date
);

create table tt04
(
    no number(3) primary key,
    id varchar(32) primary key, --기본키는 하나만 가능 
    name varchar2(16) not null,
    birth date
);

create table tt04
(
    no number(3),
    id varchar(32), --기본키는 하나만 가능 
    name varchar2(16) not null,
    birth date,
    constraint tt04_pk primary key (no, id)
                                 -- 두개의 컬럼을 묶어서 하나의 PK로 설정함
);


/******************************************/
외래키 FK : 다른 테이블에 있는 키값을 참조하는 컬럼

- 참조하는 테이블(부모테이블)에 존재하는 값만 사용 가능(+null 까지도 가능함)
- 외래키 설정된 부모테이블에서 자신을 참조하는 자식테이블의 데이터가 존재하면, 삭제 불가
            
외래키 삭제 조건
on delete cascade;  --부모데이터 삭제시, 그 값을 참조하는 자식 데이터도 같이 삭제 
on delete set null; --부모데이터 삭제시, 그 값을 참조하는 자식 데이터를 null값으로 변경


create table t_club
(
    id number(3) primary key,
    name varchar(32)
);

create table t_member
(
    id number(3) primary key,
    name varchar(32),
    --club_id references t_club(id) --외래키 설정T FK
    --club_id references t_club(id) on delete cascade
    club_id references t_club(id) on delete null
);

select * from t_club;

insert into t_club values(1, '독서');
insert into t_club values(2, '게임');
insert into t_club values(3, '등산');
insert into t_club values(4, '낚시');

select * from t_member;

insert into t_member values (1, '이름1', 2);
insert into t_member values (2, '이름2', 1);
insert into t_member values (3, '이름3', 1);

select *
from t_member m, t_club c
where m.club_id = c.id;

insert into t_member values (3, '이름3', 1);  --> 무결성제약조건의 데이터 중복됨으로 오류발생
insert into t_member values (4, '이름4', null);
insert into t_member values (5, '이름5', 8); --> FK에 해당하는 t_club에 id에 8이 없어서 불가함
insert into t_member values (5, '이름5', 4);

select *
--delete
from t_club   --해당 값을 참조하는 외부 데이터가 있으면 삭제 불가
where id = 4;

select *
--delete
from t_member --외래키 설정된 상태로 참조하는 데이터를 먼저 삭제해야한다.
where id = 5;


