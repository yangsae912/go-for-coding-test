SELECT DATE_FORMAT(DATETIME, '%H') AS "HOUR",COUNT(*) AS "COUNT" 
FROM ANIMAL_OUTS
WHERE DATE_FORMAT(DATETIME, '%H') > 08 AND DATE_FORMAT(DATETIME, '%H') < 20 
GROUP BY HOUR
ORDER BY HOUR