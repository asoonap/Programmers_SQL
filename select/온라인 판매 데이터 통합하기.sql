-- 오프라인/온라인 판매 데이터 통합하기

-- ONLINE_SALE 테이블과 OFFLINE_SALE 테이블에서 
-- 2022년 3월의 오프라인/온라인 상품 판매 데이터의 판매 날짜, 상품ID, 유저ID, 판매량을 출력하는 SQL문을 작성해주세요. 
-- OFFLINE_SALE 테이블의 판매 데이터의 USER_ID 값은 NULL 로 표시해주세요. 
-- 결과는 판매일을 기준으로 오름차순 정렬해주시고 판매일이 같다면 상품 ID를 기준으로 오름차순, 상품ID까지 같다면 유저 ID를 기준으로 오름차순 정렬해주세요.

----------------------------------------------------------------------------------------------------------------------------
-- UNION
-- UNION 또는 UNION DISTINCT 의 경우, 임시 테이블의 모든 컬럼으로 Unique Hash 인덱스 생성

-- 메모
-- offline 3월이 읎는데유...?
-- 문자열 null이 아닌 null값으로 대체체


-- NULL 이 아니면 NULL로 표시하는 방법
-- 1. IF() 함수를 이용한 방법
SELECT DATE_FORMAT(SALES_DATE, '%Y-%m-%d') as SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
FROM ONLINE_SALE 
WHERE SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'
UNION ALL
SELECT DATE_FORMAT(SALES_DATE, '%Y-%m-%d') as SALES_DATE, PRODUCT_ID, IF(OFFLINE_SALE_ID IS NOT NULL, NULL, OFFLINE_SALE_ID) as USER_ID, SALES_AMOUNT
FROM OFFLINE_SALE  
WHERE SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID;


-- 2. CASE를 이용한 방법
SELECT DATE_FORMAT(SALES_DATE, '%Y-%m-%d') as SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
FROM ONLINE_SALE 
WHERE SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'
UNION ALL
SELECT 
    DATE_FORMAT(SALES_DATE, '%Y-%m-%d') as SALES_DATE,
    PRODUCT_ID,
    CASE 
      WHEN OFFLINE_SALE_ID IS NOT NULL THEN NULL
      ELSE OFFLINE_SALE_ID
      END as USER_ID,
    SALES_AMOUNT
FROM OFFLINE_SALE  
WHERE SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID;
