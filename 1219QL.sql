select
	sm.`순번`, stm.`학번`, stm.`이름`, sbm.`과목번호`, sbm.`과목이름`, sm.`점수`

from
	`성적` sm
	left outer join `학생` stm on (stm.`학번` = sm.`학번`)
    left outer join `과목` sbm on (sbm.`과목번호` = sm.`과목번호`)

limit 4;

 truncate `성적`;

create view user_view

as

select
	id,
    username,
    `password`,
	`name`,
    email
from
	user_mst
where
	id between 1 and 200;

select
	*
from
	user_view
where
	username like 'a%';



insert into `학생`
	values
    ('20013001', '홍길동', '컴퓨터공학과'),
    ('20013002', '김철수', '전자공학과');


-- dddddddddd

insert into
	`상품`
values
	(0, '딸기사탕', '50'),
    (0, '누룽지사탕', '100');

set autocommit = 0;
select @@autocommit;

START TRANSACTION;

INSERT INTO 
	`상품`
VALUES
	(0, '오렌지사탕', 20);

UPDATE `상품`
SET
    `수량` = 200
WHERE
    `상품코드` = 1;

savepoint p1;

UPDATE `상품`
SET
    `수량` = 200
WHERE
    `상품코드` = 2;

DELETE
FROM
    `상품`
WHERE
    `상품코드` = 2;
    
rollback to p1;

COMMIT;

set autocommit = 1;
select @@autocommit;



    
    
    