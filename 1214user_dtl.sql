/* 주어진 데이터는 아이디(username) 밖에 없을 때 ( test, test2 ) */
select * from user_mst;
select * from user_dtl;

select
	*
from
	user_dtl
where
	-- username = 'test'; 이 방법이 아니라 아래의 sub 쿼리로
    id = (select id from user_mst where username = 'test2');
    -- mst를 통해서 id가 해당 ()의 조건을 확인 해 dtl의 해당조건의 항목을 출력한다 , 
    -- "="은 결과가 단 하나의 값으로 나타남
    
select
	*
from
	user_dtl
    left outer join user_mst um on(um.id = ud.id)
    -- 테이블을 join 해주면 하나의 테이블로 다시 만들(합칠) 수 있다
    -- sub쿼리문보다 join을 사용하면 성능저하를 막아줄 수 있다
where
	-- id in (select id from user_mst where username like '%test%');
    
    -- in은 여러 항목의 포함관계 결과를 출력해준다 , like ??? 는 ???를 포함하는 결과를 출력
    -- sub쿼리는 ()안으로 select가 계속해서 들어가 작성은 가능은 하나 기능 또는 성능의 저하가 나타남
    -- select (select)는(서브쿼리) 한번만으로 이루어지는게 가장 좋은 코드!!! 
    -- sub쿼리보다 join 활용이 좋은경우도 많음! (아래 um.)
    um.username = 'test'
    
    /* 원하는 컬럼을 만들어서 조회하는 방법 */;
select
	'아이디' as username,
    12 as `month`,
    13 as `day`;
-- select 에서 자체 컬럼명을 줄 수 있고 값도 담을 수 있다!

select
	*,
    '테스트' as test
from
	user_dtl;
insert into
	user_mst
values
	(0, 'aaa'),
    (0, 'bbb'),
	(0, 'ccc'),
    (0, 'ddd'),
    (0, 'eee');

select
	*,
    ifnull(name, 1) as flag,
    -- ifnull => name(a)값이 null이면 1(b)을 반환, null이 아니면 a를 반환
    nullif(name, null) as flag2,
    -- nullif => a와 b가 같으면 null을 반환하고, 같지 않으면 a를 반환한다
    case 
		when ifnull(name, 1) = 1 then 1
        when ifnull(name, 1) = 2 then 2
        when ifnull(name, 1) = 3 then 3
        when ifnull(name, 1) = 4 then 4
        else 0 
        end as flag3,
	-- when else end as => if else 문이라 생각하자! when 부분이 조건이다
	if(name is null, 1, 0) as flag4
    -- 단순 if문! name = null 참이면 1 거짓이면 0 => 3항연산자 정도로 생각하자
    -- when  이나 if 로 테이블을 생성, sub쿼리사용 등 자유롭게 조회할 수 있다?
from
	user_dtl;
    
select
	case when 1 = 1 then '참'
    else '거짓' end as `test`