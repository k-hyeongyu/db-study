/***********************/
데이터 딕셔너리
오라클 DB에서 관련돤 각종 정보를 확인할 수 있는 사전

잡근 자료구분

user_ : 현재 로그인한 사용자가 소유한 객체 정보 조회
all_  : 현재 로그인한 사용자가 볼 수 있는 모든 객체 정보 조회
dba_  : DB관리자 계정에서 DB 모든 객체 정보 조회

select * from user_tables;
select * from all_tables;
--select * from dba_tables; 접근불가

select * from user_views;
select * from user_sequences;
select * from user_objects;
select * from user_constraints;
select * from user_cons_columns;
select * from user_indexes;
select * from user_ind_columns;

select * from all_users;
select * from user_role_privs;

--테이블 정보 조회시 사용하기 좋은 테이블
select * from tab --테이블리스트 출력
where tname like '%dept%'; 

select * from tab
where tname like '%menu%'; 
