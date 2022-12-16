/*
	계정생성 DDL
    > CREATE USER '계정아이디'@localhost identified by '비밀번호'; -> 내부 ip 접속
	> CREATE USER '계정아이디'@identified by '비밀번호'; -> 외부 ip 접속
		> create user 'seokmin'@localhost identified by 'root';
        > grant all privileges on *.* to seokmin@localhost;
        > flush privileges;
    
	DCL(권한관련)
    
    1. GRANT (데이터베이스, 테이블 사용자 권한 부여)
		- GRANT 권한 TO 사용자 계정 - (사용많지 않음)
        - GRANT 권한 ON 객체명(데이터베이스명, 테이블명) TO 사용자 계정 - (사용)
			> GRANT ALL PRIVILEGES ON 데이터베이스명.*(모든테이블) => (subquery_study.board_mst TO root@localhost) -> 내부ip(현재 pc에서 접근가능)
            > GRANT ALL PRIVILEGES ON 데이터베이스명.*(모든테이블) => (subquery_study.board_mst TO root@%) -> 외부ip(다른 pc에서 접근가능)
            > GRANT ALL PRIVILEGES ON 데이터베이스명.*(모든테이블) => (subquery_study.board_mst TO root@200.100.%) -> 외부ip(해당ip를 사용하는 pc만 접근가능)
    2. REVOKE (데이터베이스, 테이블 사용자 권한 회수)
		- REVOKE 권한 TO 사용자 계정 - (사용많지 않음)
        - REVOKE 권한 ON 객체명(데이터베이스명, 테이블명) TO 사용자 계정 - (사용)
			> REVOKE insert, update, create ON *.*(모든DB와 모든TBL) TO root@localhost;(insert, update, create 권한 해제)
				ㄴ> 모든 테이블에 insert, update, create를 할 수 없음
			> REVOKE ALL ON *.* TO root@localhost;(모든 권한 해제)

*/

select @@autocommit; -- 오토커밋 활성상태 확인 (1 = 활성)
set autocommit = 1; -- 오토커밋 비활성(0)으로 및 활성(1) 전환