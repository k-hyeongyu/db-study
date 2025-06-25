/**********************************************/
시퀀스 ex)번호표 뽑기
PK용으로 사용하거나 순차적인 데이터를 표현하기 위해 사용하는 숫자 값

호출 할때 마다 자동 증가

create sequence 시퀀스 이름
increment by 1 --증가할 값
start with 1 --시작 값
minvalue 1  --최소값
maxvalue 10 --최대값
cycle | nocycle --순환여부  기본값은 nocycle
cache 20 | nocache --숫자 메모리에 미리 저장해 둘 갯수 20은 기본값

시퀀스 삭제
drop sequence 시퀀스이름

시퀀스 호출(사용)
시퀀스이름.nextval 다음값 호출(사용)
시퀀스이름.currval 현재값 확인


/*********************************************/
-----PK 설정 / 활용

create table seq_test
(
    no number(6) primary key,
    name varchar2(32)
);


--수동으로 체크하고 저장 (여태까지 했던 방식)
select *from seq_test;  --테이블 확인용 코드

insert into seq_test values(1, '이름1');
insert into seq_test values(2, '이름2');

--서브쿼리를 활용하는 경우 
select count(*) from seq_test; --현재 갯수
select count(*) + 1 from seq_test;

insert into seq_test values((select count(*) + 1 from seq_test), '이름3');
insert into seq_test values((select count(*) + 1 from seq_test), '이름4');
insert into seq_test values((select count(*) + 1 from seq_test), '이름5');

delete from seq_test;
insert into seq_test values((select count(*) + 1 from seq_test), '이름1');

select *from seq_test; --테이블 확인용 코드



--테이블 데이터를 어떻게 관리하는가?
--ex.삭제를 어떻게 처리하는가? 가입자 정보 탈퇴시
  1) 삭제 (delete from ....)
  2) 삭제된것 처럼 상태 값 관리  논리연산처럼 y/n으로 상태코드 표기하면 간편함
  데이터가 자산이므로 join이 결합이 깨질수 있어서 상태코드로 표기하는 경우가 대부분이다.
  
--탈퇴시 -> 삭제하는 방식으로 관리
select * from seq_test;
 --3번 사용자 탈퇴
 select *
 --delete
 from seq_test
 where no =3;
  
insert into seq_test values((select count(*) + 1 from seq_test), '이름6');

select *from seq_test; --테이블 확인용 코드

--서브쿼리로 활용 (마지막 no값, max)
select max(no) from seq_test;
select max(no) + 1 from seq_test;
select nvl(max(no) + 1, 1) from seq_test; --다음에 사용할 no값
select nvl(max(no), 0) + 1 from seq_test;

insert into seq_test values((select max(no) + 1 from seq_test), '이름6');

delete
from seq_test
where no = 6;

--기존 데이터가 없을 시에
insert into seq_test values((select nvl(max(no), 0) + 1 from seq_test;), '이름6');

--중복되지 않게 사용 -> 시퀀스 사용,  숫자값은 신경 쓸 필요 없음


create sequence seq_seq_test_pk
increment by 1 --증가할 값
start with 1; --시작 값
--min/max
--cache
--nocycle

select seq_seq_test_pk.nextval from dual; --다음차례 seq 진행값 호출
select seq_seq_test_pk.currval from dual; --현재의 seq값

insert into seq_test values(seq_seq_test_pk.nextval, 'a');
insert into seq_test values(seq_seq_test_pk.nextval, 'b');
insert into seq_test values(seq_seq_test_pk.nextval, 'c');
insert into seq_test values(seq_seq_test_pk.nextval, 'd');
insert into seq_test values(seq_seq_test_pk.nextval, 'e');

select * from seq_test --테이블 확인용 코드
order by no;

--PK
 1   2   3   4   5   6 ...
cl1 cl2 cl3 cl4 cl5 cl6

--시퀀스 값을 1부터 다시 시작하도록 조정
drop sequence seq_seq_test_pk;

--시퀀스 다시 만들기
create sequence seq_seq_test_pk
increment by 1 --증가할 값
start with 1; --시작 값

select seq_seq_test_pk.nextval from dual;





