-------퀴즈1
professor 테이블에서 교수의 이름과 부서번호를 출력하고
101 번 부서 중에서 이름이 "Audie Murphy" 교수에게 "BEST!" 라고 출력하고
101번 부서 중에서 이름이 "Audie Murphy" 교수가 아닌 나머지에는 NULL 값을 출력하세요.
만약 101 번 외 다른 학과에 "Audie Murphy" 교수가 있어도 "BEST!" 가 출력되면 안됩니다.

select
    deptno,
    name,
    case
        when deptno = 101 AND name = 'Audie Murphy' then 'BEST!'
    end Decode
from professor;

select
    deptno,
    name,
    Decode(deptno, 101, (decode(name,'Audie Murphy', 'BEST!', NULL) ), NULL) DECODE
from professor;

-------퀴즈2
professor 테이블에서 교수의 이름과 부서번호를 출력하고 101 번 부서 중에서 이름이 "Audie Murphy" 교수에게
비고란에 “BEST!”라고 출력하고 101번 학과의 "Audie Murphy" 교수 외에는 비고란에
“GOOD!”을 출력하고 101번 교수가 아닐 경우는 비고란이 공란이 되도록 출력하세요.

select
    deptno,
    name,
    case
        when deptno = 101 AND name = 'Audie Murphy' then 'BEST!'
        when deptno = 101 then 'GOOD!' 
    end
from professor;


-------퀴즈3
professor 테이블에서 교수의 이름과 부서번호를 출력하고 101 번 부서 중에서
이름이 "Audie Murphy" 교수에게 비고란에 “BEST!” 이라고 출력하고
101번 학과의 "Audie Murphy" 교수 외에는 비고란에 “GOOD!”을 출력하고
101번 교수가 아닐 경우는 비고란에 "N/A" 을 출력하세요.

select
    deptno,
    name,
    Decode(deptno, 101, (decode(name,'Audie Murphy', 'BEST!', 'GOOD!') ), 'N/A') 비고
from professor;

select
    deptno,
    name,
    case
        when deptno = 101 AND name = 'Audie Murphy' then 'BEST!'
        when deptno = 101 then 'GOOD!'
        else 'N/A'
    end 비고
from professor;


-------퀴즈4

Student 테이블을 사용하여 제 1 전공 (deptno1) 이 101 번인 학과 학생들의 이름과 주민번호,
성별을 출력하되 성별은 주민번호(jumin) 컬럼을 이용하여
7번째 숫자가 1일 경우 '남자' , 2일 경우 '여자' 로 출력하세요.

select 
    name,
    jumin,
--  decode(substr(jumin,7,1), '1', '남자', '2', '여자') 성별
        case
--        when (SUBSTR(jumin, 7, 1) = 1) then '남자'
--        when (SUBSTR(jumin, 7, 1) = 2) then '여자'
          when SUBSTR(jumin, 7, 1) in ('1', '3')  then '남자'
          when SUBSTR(jumin, 7, 1) in ('2', '4')  then '여자'
        end 성별

from student
where deptno1 = 101;

-------퀴즈5


select 
    name,
    tel,
--    decode(substr(tel, 1, 3), '02)', '서울',
--                              '051', '부산',
--                              '031', '경기',
--                              '055', '경남',
--                              '052', '울산')
    case
        when substr(tel, 1, 2) = '02' then '서울'
        when substr(tel, 1, 3) = '031' then '경기'
        when substr(tel, 1, 3) = '051' then '부산'
        when substr(tel, 1, 3) = '052' then '울산'
        when substr(tel, 1, 3) = '055' then '경남'
    end 지역명

    
from student
where deptno1 = 101;




