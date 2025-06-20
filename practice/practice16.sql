--select 
--    pm.p_date 판매일자,
--    pm.p_code 상품코드,
--    pr.p_name 상품명,
--    to_number(pr.p_price) 상품가,
--    pm.p_qty 구매수량,
--    to_number(pm.p_total) 총금액,
--    to_number(pm.p_total*100) 적립포인트,
--    CASE
--        WHEN TO_CHAR(pm.p_date, 'YYYYMMDD') = '20110101' THEN to_number(pm.p_total * 200)
--        ELSE pm.p_total * 100
--    END AS 새해2배적립포인트,
--    g.gname 사은품명,
--    to_number(g.g_start) 포인트start,
--    to_number(g.g_end) 포인트end
--    
--from panmae pm, product pr, gift g
--
--where pm.p_code = pr.p_code
--      and (pm.p_total*200) between to_number(g.g_start)
--      and to_number(g.g_end);

select * from panmae;
select * from product;
select * from gift;

select

    --substr(p_date, 1, 4) || '-' || substr(p_date, 5, 2) || '-' || substr(p_date, 5, 2)
    to_char( to_date(pm.p_date), 'yyyy-mm-dd' ) 판매일자,
    pm.p_code 상품코드,
    pd.p_name 상품명,
    to_char(pd.p_price, '9,999,999') 상품가,
    pm.p_qty 구매수량,
    to_char(pm.p_total, '9,999,999') 총금액,
    to_char(pm.p_total * 100, '9,999,999')적립포인트,
    --to_char(pm.p_total * 200, '9,999,999')새해2배적립포인트
    /*
    case substr(pm.p_date, 5, 4)
        when '0101' then pm.p_total*200
        else pm.p_total * 100
    end 새해2배
    */
    to_char(decode(substr(pm.p_date, 5, 4), '0101', pm.p_total*200, pm.p_total*100), '999,999,999') 새해2배,
    gf.gname 사은품명,
    to_char(gf.g_start, '999,999') 포인트start,
    to_char(gf.g_end, '999,999') 포인트end
    
from panmae pm, product pd, gift gf

where pm.p_code = pd.p_code

and decode(substr(pm.p_date, 5, 4), '0101', pm.p_total*200, pm.p_total*100) between gf.g_start and gf.g_end
order by pm.p_date;

--gift 테이블과 조인
--g_start <- 2배 적입 포인트가 