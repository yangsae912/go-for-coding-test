-- 코드를 입력하세요
-- SELECT REST_ID, REST_NAME, FOOD_TYPE, FAVORITES, ADDRESS, avg(REVIEW_SCORE)

SELECT RR.REST_ID, REST_NAME, FOOD_TYPE, FAVORITES, ADDRESS, round(avg(RR.REVIEW_SCORE),2) as score
from REST_REVIEW RR
inner join REST_INFO RI
on RR.REST_ID = RI.REST_ID
where ADDRESS like '서울%'
group by RR.REST_ID, REST_NAME, FOOD_TYPE, FAVORITES, ADDRESS
order by score DESC, RI.FAVORITES DESC