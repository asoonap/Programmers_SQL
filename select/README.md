# select


## 과일로 만든 아이스크림 고르기
1. group by 여부
FLAVOR의 중복여부를 확인해야한다고 생각
a. “FIRST_HALF 테이블의 기본 키는 FLAVOR입니다. “라고 알려준 부분을 놓침
b. group by와 having으로 중복을 확인하기
<code>SELECT FLAVOR, COUNT(FLAVOR)
FROM FIRST_HALF
GROUP BY FLAVOR
HAVING COUNT(FLAVOR) > 1;</code>

2. `group by`와 `where`의 순서 이해
    `where`→ `group by`→ `having`
    집계한 후에 조건을 걸고 싶을 때는 having을 사용해야함…
    (문제 풀때 고려하지 못함)