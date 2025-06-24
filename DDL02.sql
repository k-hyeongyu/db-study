/************************/
DDL 제약조건

select * from new_table3;

default : 저장되는 값이 없을 때 저장할 기본 값


create table new_table3
(
    no number(3) default 0,
    name varchar2(16) default 'empty',
    birth date default sysdate
);

insert into new_table3
values (1, 'name1', to_date('2020-02-20'));

select * from new_table3;

insert into new_table3
values (2, null, to_date('2020-02-20'));

select * from new_table3;

insert into new_table3 (no, birth)
values (3, to_date('2020-02-20'));

select * from new_table3;

insert into new_table3 (no, name)
values (4, 'myname2');




unique : 중복되지 않는 유일한 값
not null : null이 들어오는것이 불가 (nullable no) 
무결성(integrity) : 데이터가 올바르고 일관되게 유지

check : 저장이 가능한 범위를 지정

create table tt01
(
    no number(3) unique,
    name varchar2(16) not null,
    birth date
);

insert into tt01
values(1, 'name1', sysdate);

insert into tt01
values(1, null, sysdate); --not null이라서 불가

insert into tt01 (no, birth)
values(2, sysdate);    --name, --not null이라서 불가

insert into tt01
values(2, 'name2', sysdate);

insert into tt01
values(2, 'name3', sysdate);

select * from tt01;


create table tt02
(
    no number(3)
        constraint TT02_NO_UK unique,
                -- 제약조건의 이름
    name varchar2(16)
        constraint TT02_NAME_NN not null,
    birth date,
    score number(3) --6자리까지 입력가능 소수점 3자리
        constraint TT03_SCORE_CK check (score between 0 and 100),
    pass varchar(2)
        constraint TT03_PASS_CK check (pass in ('y', 'n'))
);

number(자리수)
number(전체자리수 , 소수점자리수)
number(6, 3) 전체 6자리, 소수점 3자리 123.456가능 1234.56불가능
number 만 작성시에는 38개의 자리만 가능

oracleDB 데이터 타입
숫자/문자/날짜   number/varchar2/date
boolean true/false (x)테이블에 저장 불가
          1/0
          t/f
          true/false
          y/n

insert into tt02
values(1, 'name1', sysdate, 60, 'y');

insert into tt02
values(1, 'name1', sysdate, 60, 'y'); --중복 unique제약

insert into tt02
values(2, null, sysdate, 60, 'y'); --이름 not null 제약

insert into tt02
values(2, 'name2', sysdate, 60, 'y'); --score 점수범위 제약 (0 ~ 100)

insert into tt02
values(1, 'name2', sysdate, 70, 'q'); --pass 가능범위 제약 ('y', 'n')

commit;
select * from tt02;

select constraint_name, table_name
from user_constraints
where constraint_name in ('TT02_NO_UK', 'TT02_NAME_NN', 'TT03_SCORE_CK', 'TT03_PASS_CK');



