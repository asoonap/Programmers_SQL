-- 그룹별 조건에 맞는 식당 목록 출력하기
-- MEMBER_PROFILE와 REST_REVIEW 테이블에서 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회하는 SQL문을 작성해주세요.
-- 회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력되도록 작성해주시고,
-- 결과는 리뷰 작성일을 기준으로 오름차순, 리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬해주세요.

-- 1차
SELECT A.MEMBER_NAME, B.REVIEW_TEXT, DATE_FORMAT(B.REVIEW_DATE, '%Y-%m-%d')
FROM (select COUNT(MEMBER_ID) AS TOTAL,REST_ID, MEMBER_ID, REVIEW_TEXT, REVIEW_DATE
      FROM REST_REVIEW
      GROUP BY MEMBER_ID
      ORDER BY TOTAL DESC
      LIMIT 1) B 
      JOIN MEMBER_PROFILE A  
ON A.MEMBER_ID = B.MEMBER_ID
ORDER BY REVIEW_DATE, REVIEW_TEXT

-- 정답처리가 안되는 이유는, 리뷰를 3개(max) 달성한 사람이 3명이라서 limit 1로 하면 한명만 조회되기 때문에 오답

-- where 로 다 표현해보고 싶은 욕망..
SELECT A.MEMBER_NAME, B.REVIEW_TEXT, DATE_FORMAT(B.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM MEMBER_PROFILE A
JOIN REST_REVIEW B ON A.MEMBER_ID = B.MEMBER_ID
WHERE B.MEMBER_ID IN (
        SELECT MEMBER_ID 
        FROM REST_REVIEW
        GROUP BY MEMBER_ID
        HAVING COUNT(*) = (
            SELECT COUNT(*) AS CNT --최대 리뷰수 산정
            FROM REST_REVIEW
            GROUP BY MEMBER_ID
            ORDER BY CNT DESC 
            LIMIT 1)
        )
ORDER BY REVIEW_DATE, REVIEW_TEXT;