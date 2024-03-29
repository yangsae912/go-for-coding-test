-- 코드를 입력하세요
-- SELECT to_char(DATETIME, 'HH24') as HOUR, count(*) as COUNT
-- from ANIMAL_OUTS
-- where to_char(DATETIME, 'HH24') between 0 and 23
-- group by to_char(DATETIME, 'HH24')
-- order by HOUR

WITH Hours AS (
  SELECT (LEVEL - 1) as HOUR, 0 as COUNT
  FROM DUAL
  CONNECT BY LEVEL <= 24
)

SELECT Hours.HOUR, NVL(ANIMAL_COUNT.COUNT, 0) as COUNT
FROM Hours
LEFT JOIN (
  SELECT to_char(DATETIME, 'HH24') as HOUR, count(*) as COUNT
  FROM ANIMAL_OUTS
  WHERE to_char(DATETIME, 'HH24') between 0 and 23
  GROUP BY to_char(DATETIME, 'HH24')
) ANIMAL_COUNT
ON Hours.HOUR = ANIMAL_COUNT.HOUR
ORDER BY Hours.HOUR;
