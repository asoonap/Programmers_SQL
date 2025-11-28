-- 5월 식품들의 총매출 조회하기

-- FOOD_PRODUCT와 FOOD_ORDER 테이블에서 생산일자가 2022년 5월인 식품들의 식품 ID, 식품 이름, 총매출을 조회하는 SQL문을 작성해주세요.
--  이때 결과는 총매출을 기준으로 내림차순 정렬해주시고 총매출이 같다면 식품 ID를 기준으로 오름차순 정렬해주세요.

SELECT P.PRODUCT_ID,PRODUCT_NAME,SUM(PRICE*AMOUNT) AS TOTAL_SALES
FROM FOOD_PRODUCT P 
JOIN (SELECT PRODUCT_ID, AMOUNT
      FROM FOOD_ORDER
      WHERE MONTH(PRODUCE_DATE) = 5
      ) O
ON P.PRODUCT_ID = O.PRODUCT_ID
GROUP BY PRODUCT_ID
ORDER BY TOTAL_SALES DESC, PRODUCT_ID

-- 같은 제품이지만 가격이 다르게 주문된 건이 있어서 같은 ID가 두번 반복.
-- GROUP BY PRODUCT_ID를 하고 총매출에서 SUM을 해주어서 같은 제품이면 총매출을 합하도록함.