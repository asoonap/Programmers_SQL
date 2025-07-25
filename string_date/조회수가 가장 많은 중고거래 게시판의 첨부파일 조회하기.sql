-- <L3> 조회수가 가장 많은 중고거래 게시판의 첨부파일 조회하기

-- 문제 
-- USED_GOODS_BOARD와 USED_GOODS_FILE 테이블에서 조회수가 가장 높은 중고거래 게시물에 대한 첨부파일 경로를 조회하는 SQL문을 작성해주세요.
-- 첨부파일 경로는 FILE ID를 기준으로 내림차순 정렬해주세요.
-- 기본적인 파일경로는 /home/grep/src/ 이며,
-- 게시글 ID를 기준으로 디렉토리가 구분되고,
-- 파일이름은 파일 ID, 파일 이름, 파일 확장자로 구성되도록 출력해주세요. 
-- 조회수가 가장 높은 게시물은 하나만 존재합니다.


-- MYSQL에서는 TOP 불가능

-- 초안 진행 중 멈춤
SELECT B.BOARD_ID, VIEWS, FILE_ID, FILE_EXT, FILE_NAME
FROM USED_GOODS_BOARD B JOIN USED_GOODS_FILE F
ON B.BOARD_ID = F.BOARD_ID
ORDER BY VIEWS DESC, FILE_ID DESC
LIMIT 1
-- LIMIT을 먼저 한다면 동일한 BOARD_ID를 놓칠 수 있다는 점.
-- 즉, VIEWS가 가장 높은 BOARD_ID가 001번일 때, USED_GOODS_FILE 데이블에서 FILE_ID가 한개 이상임.

-- 답안
SELECT CONCAT('/home/grep/src/',BOARD_ID,'/', FILE_ID, FILE_NAME, FILE_EXT) AS FILE_PATH
FROM USED_GOODS_FILE 
WHERE BOARD_ID = (
    SELECT BOARD_ID
        FROM USED_GOODS_BOARD
        ORDER BY VIEWS DESC
        LIMIT 1)
ORDER BY FILE_ID DESC
-- VIEWS가 가장 높은 BOARD_ID를 선정해서 USED_GOODS_FILE에서 WHERE로 필터링하기