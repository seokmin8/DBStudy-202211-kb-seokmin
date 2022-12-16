/*
	TCL 
    1. COMMIT		- 트랜잭션 확정
    2. ROLLBACK		- 트랜잭션 취소
    3. SAVEPOINT	- 중간지점 저장
*/
set autocommit = 0;
select @@autocommit ;

create database `transaction_study`;
use transaction_study;

create table `transaction_study`.`emp_mst`(
	`id` INT not null auto_increment,
    `name` varchar(15) default null,
    primary key (`id`) -- pk는 따로 부여한다
);
-- dml 은 트랜잭션 사용, ddl은 사용안함

select @@autocommit;

start transaction; -- 트랜잭션의 시작 , autocommit일땐 시작하자마자 트랜잭션이 종료됨. sp를 사용못함.
savepoint p1; -- point 1
insert into emp_mst
values
	(0, '김준일'),
    (0, '신경수'),
    (0, '고희주'),
    (0, '장건녕');
    
select * from emp_mst;

savepoint p2;

update emp_mst
set 
	`name` = '석민'
where
	id = 17;

rollback to p2; -- update 전 상태
select * from emp_mst;

select * from emp_mst;  --  insert 된 mst 상태
rollback to p1; 		--  rollback point 1 지점 (insert 전)
select * from emp_mst;	--  rollback 된 상태확인
-- rollback 만 적었을 땐 시작점으로 돌아감.
commit; -- 트랜잭션이 끝나면 commit을 해줘야 한다, commit 후엔 savepoint는 날아감, 사용된 autoincrement도 날아감!
-- 트랜잭션 사용 시 무조건 commit을 해준다!! 안해주면 데이터 다 날아감
rollback;
truncate emp_mst;