/****************************/
DML  --data manipulate language
데이터 저장 insert
      수정 update
      삭제 delete
      병합 merge

--데이터 조회 (select)


insert 저장

작성법 
insert into 테이블명 (컬럼명.....)
values (데이터값.....)

전체 컬럼에 데이터를 저장하는 경우 컬럼명 작성 생략가능 / 순서를 맞춰서 저장해야함
insert into 테이블명 
values (데이터값...)
;

insert into new_table (no, name, birth) -->정식 순서, 
values (1, '이름1', sysdate);

select * from new_table;


insert into new_table (name, birth, no)
values ('이름2', sysdate, 2);

insert into new_table (birth ,name , no)
values (to_date('2024-12-12'),'이름3', 3);

insert into new_table
values (4, '이름4', sysdate);


insert into new_table(no, name)
values (4, '이름5');


insert into new_table(name, birth)  -->일부분만 입력하여 저장 가능
values ('이름6', to_date('2024-12-13'));

insert all
into new_table values(7, '이름7', null)
into new_table values(8, '이름8', sysdate)
into new_table values(9, '이름9', to_date('2023-01-30'))
select * from dual;



--다른 테이블의 다른 데이터를 조회하여 저장
insert into new_table2
select 10, '이름10', sysdate from dual;

insert into new_table2
select no, name, sysdate from new_table;


insert into new_table2
select no, name, sysdate from new_table
where no < 5;


테이블 수정 update

update 테이블명
set 현재컬럼명  = 현재값;
    컬럼명  = 값;
where 조건;

select * from dept3;
--seoul branch office -> incheon branch office 
update dept3
set area = 'Incheon Branch Office'
--select * from dept3
where area = 'Seoul Branch Office';

update dept3
set dname = 'Sales First Team'
where dcode = 1008;

create table professor2
as
select * from professor;

select * from professor2;

--bonus 받는 교수들의 보너스를 +100 증가
update professor2
set bonus = bonus + 100
--
where bonus is not null;


commit; 확정 --커밋 실행하면 롤백 불가능함
rollback; 되돌리기 (취소)

delete 데이터 삭제 (rollback 가능 : 자동 commit; 이 아닌 경우)

delete from 테이블명
where 조건;

select * from dept3;

select *
--delete
from dept3
where dcode = 1011;

commit;







