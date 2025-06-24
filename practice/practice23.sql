--CREATE TABLE temp_professor
--AS;
SELECT * FROM professor;

SELECT * FROM temp_professor;

--update
update temp_professor
set bonus = bonus + 100 + 100;

rollback;


--2.
--temp_professor 테이블에서 'Sharon Stone' 교수의 직급과 동일한 직급을 가진 교수들 중
--현재 급여가 250 만원이 안 되는 교수들의 급여를 15% 인상하세요.

update temp_professor
set pay = pay * 1.15
where position = ( select position
                    from temp_professor
                    where name = 'Sharon Stone') and pay < 250;

SELECT * FROM temp_professor;




