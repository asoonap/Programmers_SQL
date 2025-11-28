-- 주문량이 많은 아이스크림들 조회하기
-- 7월 아이스크림 총 주문량과 상반기의 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회하는 SQL 문을 작성해주세요.

WITH UNION_ALL AS(
SELECT FLAVOR, SUM(TOTAL_ORDER) AS T_ORDER
FROM ((SELECT * FROM FIRST_HALF)
       UNION ALL
      (SELECT * FROM JULY)
     ) AS UA
GROUP BY FLAVOR
ORDER BY T_ORDER DESC
)

SELECT FLAVOR
FROM UNION_ALL
LIMIT 3;