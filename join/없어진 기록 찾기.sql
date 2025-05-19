-- 없어진 기록 찾기 L3
-- 입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID와 이름을 ID 순으로 조회하는 SQL문을 작성해주세요.
-- B - A 찾기
SELECT B.ANIMAL_ID, B.NAME
FROM ANIMAL_INS A RIGHT OUTER JOIN ANIMAL_OUTS B
ON A.ANIMAL_ID = B.ANIMAL_ID
WHERE A.ANIMAL_ID IS NULL