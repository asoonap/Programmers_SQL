-- <L2> 자동차 평균 대여 기간 구하기

-- CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 평균 대여 기간이 7일 이상인 자동차들의 자동차 ID와 평균 대여 기간(컬럼명: AVERAGE_DURATION) 리스트를 출력하는 SQL문을 작성해주세요.
--  평균 대여 기간은 소수점 두번째 자리에서 반올림하고,
--  결과는 평균 대여 기간을 기준으로 내림차순 정렬해주시고,
--  평균 대여 기간이 같으면 자동차 ID를 기준으로 내림차순 정렬해주세요.


SELECT CAR_ID, ROUND(AVG(DATEDIFF(END_DATE, START_DATE)+1),1) AS AVERAGE_DURATION
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
HAVING AVERAGE_DURATION >= 7
ORDER BY AVERAGE_DURATION DESC, CAR_ID DESC


-- mysql 에서는 날짜 차이 함수. datediff
-- 처음에 DATEDIFF(END_DATE, START_DATE)까지만 작성, 총 대여기간을 구하려면 DATEDIFF(END_DATE, START_DATE)+1을 해줘야했음