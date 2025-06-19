/*emp2 테이블을 기준으로 아래 정보를 출력
사원들 중에 70년대 생이면서 지역번호를 기준으로 서울(02), 경기도(031)에 거주하는
사원들의 정보를 아래와 같이 출력하시오.
사번, 이름, 생년월일, 취미, 급여(pay), 성과급(급여의 150%)
, 직원분류(단, 가족과 같은 직원이라서 family로 표기)
,전화번호, 급여수준
(단, 급여수준은 아래와 같이 분류)
3500만 1원 ~ 4500만 : '하'
4500만 1원 ~ 6천만 : '중"
6000만 1원 이상 : '상'
그 외... : '화이팅'
*/
select 
    empno 사번,
    name 이름,
    birthday 생년월일,
    hobby 취미,
    pay 급여,
    pay*1.5 성과급,
    replace(emp_type, 'employee', 'family') 직원분류,
    tel,
    case
        when pay BETWEEN 35000001 AND 45000000 THEN '하'
        when pay BETWEEN 45000001 AND 60000000 THEN '중'
        when pay > 60000001 THEN '상'
        else '화이팅'
    end 급여수준
from emp2
where substr(birthday, 1,1) ='7' and
            (substr(tel, 1,3) = '031' or substr(tel, 1,2) = '02');