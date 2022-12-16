/*
	뷰(view)
    자주 조회하는 select문을 저장하는 방법
    select... 가 복잡할 경우 또는 자주 사용되는 select
*/

create view course_view
as 
	select
    -- 그냥 실행하면 에러발생, 겹치는 id컬럼들을 as해줘야 함
		cm.id as course_id,
        cm.subject_id,
        sjm.`subject` as subject_name,
        cm.student_id,
        stm.`name` as student_name,
        status_id
	from
		course_mst cm
		left outer join subject_mst sjm on(sjm.id = cm.subject_id)
		left outer join student_mst stm on(stm.id = cm.student_id);
	
	select
		*
	from
		course_view
	where
		course_id > 5;