-- <L4> 특정 세대의 대장균 찾기
-- 3세대의 대장균의 ID(ID) 를 출력하는 SQL 문을 작성해주세요. 
-- 이때 결과는 대장균의 ID 에 대해 오름차순 정렬해주세요.

-- MYSQL은 계층 쿼리가 없음 DEPTH 3 JOIN을 통해 구현  
SELECT C.ID
FROM ECOLI_DATA C
JOIN(SELECT A.ID
      FROM ECOLI_DATA A
      JOIN (SELECT *
            FROM ECOLI_DATA
            WHERE PARENT_ID IS NULL) B
      ON A.PARENT_ID = B.ID) D
ON C.PARENT_ID = D.ID
ORDER BY ID;

