create table T_MENU_12
(
    id number(3) primary key,
    name varchar2(128) not null,
    price number(10),
    menu varchar2(64),
    birth date
);

INSERT ALL
  INTO T_MENU_12 VALUES (1, '싸이버거', 6000, '완전식품', SYSDATE)
  INTO T_MENU_12 VALUES (2, '콩나물비빔밥', 7000, '탄수화물', SYSDATE)
  INTO T_MENU_12 VALUES (3, '닭가슴살', 3000, '단백질', SYSDATE)
  INTO T_MENU_12 VALUES (4, '베트남쌀국수', 8000, '탄수화물', SYSDATE)
  INTO T_MENU_12 VALUES (5, '라면', 2000, '밀가루', SYSDATE)
  SELECT * FROM dual;
  
  
SELECT * FROM T_MENU_12;
  
SELECT *
FROM T_MENU_12;
update T_MENU_12
set price = 8500
where id = 4;

select *
delete
FROM T_MENU_12
where id = 5;
 


