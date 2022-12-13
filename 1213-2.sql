INSERT INTO
	board_mst
VALUES
	(0, '제목1', '게시글 내용1', 0, 1),
	(0, '제목2', '게시글 내용2', 0, 1),
	(0, '제목3', '게시글 내용3', 0, 1),
	(0, '제목1', '게시글 내용1', 0, 2),
	(0, '제목2', '게시글 내용2', 0, 2),
	(0, '제목3', '게시글 내용3', 0, 2),
	(0, '제목4', '게시글 내용4', 0, 1),
	(0, '제목5', '게시글 내용5', 0, 1),
	(0, '제목6', '게시글 내용6', 0, 1),
	(0, '제목1', '게시글 내용4', 0, 2),
	(0, '제목1', '게시글 내용5', 0, 2),
	(0, '제목1', '게시글 내용6', 0, 2);

SET statisitcs TIME ON 
SELECT
	*,
	(SELECT COUNT(1) FROM board_mst bm2 WHERE bm2.writer_id = bm.writer_id AS writer_count
FROM
	board_mst bm;
SET statistics TIME OFF
	;
/*  
	이 방법 보다는 새로적은 방법
	(SELECT COUNT(1) FROM board_mst bm2 WHERE bm2.writer_id = bm.writer_id)
	/* select는 무조건 1줄씩 계속 처리
	*내에서 bm2.writer_id = 1 일때의 결과가 출력되고
	그다음 라인에서 또 1 ... 
	sub쿼리는 (안에)작성한다 - > 값을 1번만 가지고 온다 해당 컬럼에서 !!
	bm2에서 전체 count 한것, where 조건이 없다. 이럴 땐 group by를 안해도 됨 	
*/	
SELECT 
	bm.id,
	bm.title,
	bm.content,
	bm.read_count,
	bm.writer_id,
	wc.writer_count
FROM
	board_mst bm
	LEFT OUTER JOIN (SELECT 
		writer_id, 
		COUNT(1) AS writer_count
	FROM 
		board_mst
	GROUP BY 
		writer_id) wc ON(wc.writer_id = bm.writer_id);
		
SET profiling = 1;
SHOW PROFILES;
		
		/* 
		select의 결과 자체만으로 하나의 테이블 형태가 됨
		sel 한번 결과값을 출력 sub쿼리로 결과값에 join을 하는것 
		=> 해당 데이터만큼 select 하지 않아도 된다
		
		*, => from의 값을 다 가지고 오는 것 ( 웬만해선 사용하지 말 것 )
		
		 */