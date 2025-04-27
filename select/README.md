# select

## 과일로 만든 아이스크림 고르기
1. `group by` 여부 <br>
  FLAVOR의 중복여부를 확인해야한다고 생각<br>
  - “FIRST_HALF 테이블의 기본 키는 FLAVOR입니다. “라고 알려준 부분을 놓침  
  -  `group by`와 `having`으로 중복을 확인하기  
   ```
   SELECT FLAVOR, COUNT(FLAVOR)
   FROM FIRST_HALF
   GROUP BY FLAVOR
   HAVING COUNT(FLAVOR) > 1;
   ```  

2. `group by`와 `where`의 순서 이해<br>
    `where`→ `group by`→ `having`<br>
    집계한 후에 조건을 걸고 싶을 때는 having을 사용해야함…<br>
    (문제 풀때 고려하지 못함)<br>

## NULL
1. NULL 대체 <br>
  ISNULL(컬럼, NULL인 경우 대체할 값)
2. NULL 미출력
  WHERE 컬럼 IS NOT NULL

## 날짜
1. 날짜 출력
  DATE_FORMAT(컬럼, '%Y-%m-%d') => YYYY-MM-DD<br>
  '%Y-%M-%D' => 2020-March-1st 

2. 특정 달
  WHERE MONTH(컬럼럼) = 3