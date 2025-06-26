CREATE TABLE TABLE_DATA_1
(
no number(10),
create_date DATE
);
CREATE TABLE TABLE_DATA_2
(
no number(10),
create_date DATE
);

INSERT INTO TABLE_DATA_1 VALUES (1, '2023-04-01');
INSERT INTO TABLE_DATA_1 VALUES (2, '2023-04-02');
INSERT INTO TABLE_DATA_1 VALUES (3, '2023-04-03');
INSERT INTO TABLE_DATA_1 VALUES (4, '2023-04-04');

INSERT INTO TABLE_DATA_2 VALUES (1, '2023-04-02');
INSERT INTO TABLE_DATA_2 VALUES (2, '2023-04-03');
INSERT INTO TABLE_DATA_2 VALUES (3, '2023-04-04');
INSERT INTO TABLE_DATA_2 VALUES (4, '2023-04-05');

CREATE TABLE TABLE_COLC
(
std_date DATE,
CHECK_DATA1 VARCHAR2(6),
CHECK_DATA2 VARCHAR2(6)
);

merge into TABLE_COLC tc
using (SELECT DISTINCT create_date FROM TABLE_DATA_1) td1
on(tc.std_date = td1.create_date)
when matched then
    update set tc.CHECK_DATA1 = 'y'
when not matched then
    insert(std_date, CHECK_DATA1, CHECK_DATA2)
    values(td1.create_date, 'y', 'n');
    
merge into TABLE_COLC tc
using (SELECT DISTINCT create_date FROM TABLE_DATA_2) td2
on(tc.std_date = td2.create_date)
when matched then
    update set tc.CHECK_DATA2 = 'y'
when not matched then
    insert(std_date, CHECK_DATA1, CHECK_DATA2)
    values(td2.create_date, 'n', 'y');

select * from TABLE_COLC
order by std_date;



