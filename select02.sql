select
    round(1.67), --반올림
    round(1.67, 1),
    round(1.64578, 3),
    round(1.64578, 0),
    round(357.123, -1), 
    trunc(1.456), --버림
    trunc(1.456, 2),
    mod(15, 4), --나머지
    ceil(123.123), --가장 근접한 큰 정수
    floor(123.123), --가장 근접한 작은 정수
    power(6, 3) --6*6*6
from dual;

select
    rownum, --행번호 보이지 않지만 앞에 붙어 있음
    ceil(rownum/3) 그룹번호,    --1/3 = 0.33, 2/3=0.66 3/3=1
                              --4/3 = 1.33, 5/3=1.66 6/3=2
    ceil(rownum/4) 팀번호,
    empno,
    ename
from emp;

/***************************************************/

select
    sysdate,  --현재 날짜
    systimestamp, --현재날짜 및 조회 시간
    months_between('2024-01-05', '2024-03-05'), --앞날짜 - 뒷날짜 -> 월로 환산
    months_between('2025-11-05', '2025-06-21'),
    add_months(sysdate, 3)
from dual;

select
    add_months(sysdate, 3),
    add_months(sysdate, -8),
    LAST_day(sysdate),
    next_day(sysdate,'수'),
    next_day(sysdate,'토'),
from dual;

select
    sysdate,
    round(sysdate), --날짜의 반올림
    trunc(sysdate),  --날짜의 반내림
    trunc(sysdate, 'dd'), --year month day 일 단위 내림
    trunc(sysdate, 'mm'), --월 단위로 내림
    trunc(sysdate, 'yy'),  --년 단위로 내림
    add_months(sysdate,1),
    sysdate + 3,
    sysdate + 7,
    --다음달의 첫날
    trunc(add_months(sysdate, 1), 'mm'),
    last_day(sysdate)+1,
    --전월을 마지막 날
    last_day(add_months(sysdate, -1)),
    trunc(sysdate,'mm')-1
from dual;













