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

## CASE
  WHEN 조건 THEN 결과 를 나열  
  모든 조건이 거짓일 때의 값을 ELSE 뒤에 작성  
  마지막에 END 로 종료

## WINDOW FUNCION
  - NTILE(n)  
  (partirion별) 전체 행을 n등분 -> n개의 조를 만들겠다.  
  나머지는 앞의 조 부터 할당된다.  
  e.g. 14행을 4등분 -> (1111 2222 333 444)  
  e.g.2 CASE 와 결합하여 CASE (NTILE) WHEN 1 THEN '상위 %' 지정하기  
  
  - PERCENT_RANK()  
  첫 행을 0, 마지막 행을 1로 하여, 행의 순서별 백분율 (즉, 값이 아닌 행의 순서별 상대 순위로..)  
  공식: (rank−1)/(total_rows−1)  

    |값|rank|pct_rank|
    |---|---|---|
    |100|1|0|
    |100|1|0|
    |80|3|0.5|
    |50|4|0.75|
    |10|5|1|

  - CUME_DIST()  
  누적 분포(현재 행 점수 이하인 행 비율)  

    |값|rank|cume_dist|
    |---|---|---|
    |100|2|0.4|
    |100|2|0.4|
    |80|3|0.6|
    |50|4|0.8|
    |10|5|1|

## UNION
1. UNION 또는 UNION DISTINCT 의 경우,  
 임시 테이블의 모든 컬럼으로 Unique Hash 인덱스 생성  
 UNION ALL이 효율이 아무래도 조음  
