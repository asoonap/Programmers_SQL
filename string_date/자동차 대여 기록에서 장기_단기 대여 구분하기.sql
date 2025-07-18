-- <L1> 자동차 대여 기록에서 장기/단기 대여 구분하기

-- 문제
-- CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 대여 시작일이 2022년 9월에 속하는 대여 기록에 대해서
-- 대여 기간이 30일 이상이면 '장기 대여' 그렇지 않으면 '단기 대여' 로 표시하는 컬럼(컬럼명: RENT_TYPE)을 추가하여 대여기록을 출력하는 SQL문을 작성해주세요. 
-- 결과는 대여 기록 ID를 기준으로 내림차순 정렬해주세요.

SELECT HISTORY_ID, CAR_ID,
    DATE_FORMAT(START_DATE, '%Y-%m-%d'),
    DATE_FORMAT(END_DATE, '%Y-%m-%d'),
    CASE WHEN DATEDIFF(END_DATE, START_DATE) +1 >= 30 THEN "장기 대여"
        ELSE "단기 대여"
        END AS RENT_TYPE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
WHERE MONTH(START_DATE) = 9 
ORDER BY HISTORY_ID DESC



-- where절 like사용
-- WHERE START_DATE like '2022-09%'