-- https://docs.aws.amazon.com/ko_kr/redshift/latest/dg/r_WF_PERCENT_RANK.html
SELECT ROUND(LAT_N, 4)
FROM (SELECT LAT_N, PERCENT_RANK() OVER (ORDER BY LAT_N) AS PERCENT 
      FROM STATION) AS SUB
WHERE SUB.PERCENT = 0.5;
