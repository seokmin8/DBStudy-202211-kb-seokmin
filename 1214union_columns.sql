select
	-- *
    name,
    email,
    -- 1. email을 기준으로 union 하고 싶을 때
    0 as score
    -- 마찬가지로 dtl에 없는 score컬럼 추가
from
	user_dtl
/*
	위와 아래의 두 테이블을 합치고 싶을 때 ? 좌우가 아닌 아래 위로 붙힐 때!
	union으로 합치려면 두 테이블의 유형이 완전 똑같을 때 합쳐진다
*/
where
	name = '김준일'
union
-- union 은 기본적으로 중복된값을 제거 후 출력
-- union all 은 중복값 포함 전체 조회를 해준다
select
	-- *
    name,
    null as email,
    -- mst에는 email이 없기때문에 null 값을 채워 짝을 맞춰준다
    score
from
	score_mst
where 
	score > 80;	