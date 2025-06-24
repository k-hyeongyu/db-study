/****************************************************/
DML02
--merge

--신발가게 날짜별 매출
create table t_shoe
(
    work_date date, --영업일
    store_code number(3), --매장 고유 코드 (PK)
    sales_income number(10) --매출금액
);


--옷가게 날짜별 매출
create table t_cloth
(
    work_date date, --영업일
    store_code number(3), --매장 고유 코드 (PK)
    sales_income number(10) --매출금액
);


--본사 날짜별 매출
create table t_company
(
    work_date date, --영업일
    store_code number(3), --매장 고유 코드 (PK)
    sales_income number(10) --매출금액 
);

insert all
into t_shoe values (to_date('2025-03-01'), 1, 5000)
into t_shoe values (to_date('2025-03-02'), 1, 15000)
into t_shoe values (to_date('2025-03-03'), 1, 30000)
into t_shoe values (to_date('2025-03-02'), 2, 4000)
into t_shoe values (to_date('2025-03-03'), 2, 90000)
into t_shoe values (to_date('2025-03-04'), 2, 120000)
select * from dual;

insert into t_shoe values(to_date('2025-03-04'), 1, 120000);

insert all
into t_cloth values (to_date('2025-03-01'), 10, 59000)
into t_cloth values (to_date('2025-03-02'), 10, 12000)
into t_cloth values (to_date('2025-03-03'), 10, 43000)
into t_cloth values (to_date('2025-03-02'), 20, 1000)
into t_cloth values (to_date('2025-03-03'), 20, 72000)
into t_cloth values (to_date('2025-03-04'), 20, 123000)
select * from dual;

delete from t_cloth;

t_shoe
t_cloth  >>> t_company

insert into t_company
select work_date, store_code, sales_income from t_shoe;

insert into t_company
select work_date, store_code, sales_income from t_cloth;

select * from t_company;

select store_date, sum(sales_income)
from t_company
group by work_date;

select work_date, sum(sales_income)
from t_company
group by work_date;

--주기적으로 batch 취합실행

1) 전부 delete 후 다시 insert

delete from t_company;

insert into t_company
select work_date, store_code, sales_income from t_shoe;

insert into t_company
select work_date, store_code, sales_income from t_cloth;

2) merge

merge into 최종 저장될 테이블명
using 가져올 테이블명
on (병합/비교 기준조건)
when matched then
    --있을때
    update set
    delete where 삭제조건
    
when not matched then
    --없을때
    insert;

--날짜 1개만 기준
merge into t_company cp
using t_cloth cl
on (cp.work_date = cl.work_date)
when matched then
    update set cp.sales_income = cl.sales_income
when not matched then
    insert values (cl.work_date, cl.store_code, cl.sales_income);

update t_cloth
set sales_income = 38000
where work_date = '2025-03-03';

merge into t_company cp
using t_shoe t
on (cp.work_date = t.work_date) --날짜 하나로는 병합기준으로 부적합
                                --동일 날짜가 겹처서 진행이 되지 않음
when matched then
    update set cp.sales_income = t.sales_income
when not matched then
    insert values (t.work_date, t.store_code, t.sales_income);

select * from t_company;
select * from t_shoe;
select * from t_cloth;

update t_cloth
set sales_income = 38000
where work_date = '2025-03-03';

--영업날짜 + 매장코드 병합기준
merge into t_company cp
using t_cloth cl
on (cp.work_date = cl.work_date and cp.store_code = cl.store_code)
when matched then
    update set cp.sales_income = cl.sales_income
when not matched then
    insert values (cl.work_date, cl.store_code, cl.sales_income);

merge into t_company cp
using t_shoe t
on (cp.work_date = t.work_date and cp.store_code = t.store_code)
when matched then
    update set cp.sales_income = t.sales_income
when not matched then
    insert values (t.work_date, t.store_code, t.sales_income);

update t_cloth
set sales_income = 29000
where work_date = '2025-03-02';

update t_shoe
set sales_income = 4900
where work_date = '2025-03-03' and store_code = 2;



/***********************************************************/
--본사 날짜별 매출 + 매장 판매유형 구분코드 추가 버전
create table t_company_type
(
    work_date date, --영업일
    store_code number(3), --매장 고유 코드 (PK)
    sales_income number(10), --매출금액 
    store_type varchar(8) --매장 유형 구분코드 'C' 옷가게 / 'S' 신발가게
);

merge into t_company_type cp
using t_cloth cl
on (cp.work_date = cl.work_date and cp.store_code = cl.store_code)
when matched then
    update set cp.sales_income = cl.sales_income
when not matched then
    insert values (cl.work_date, cl.store_code, cl.sales_income, 'C');

merge into t_company_type cp
using t_shoe t
on (cp.work_date = t.work_date and cp.store_code = t.store_code)
when matched then
    update set cp.sales_income = t.sales_income
when not matched then
    insert values (t.work_date, t.store_code, t.sales_income, 'S');

select * from t_company_type;

select * 
from t_company_type
where store_type = 'c';

select
    store_type,
    store_code,
    sum(sales_income)
from t_company_type
group by store_type, store_code;

