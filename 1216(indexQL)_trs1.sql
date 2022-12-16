/*
	인덱스(index)
    테이블의 동작속도(조회)를 높혀주는 자료구조
    
*/

insert into delivery_mst
values
	('2212160001', '부산 동래구 교대역점'),
	('2212160002', '부산 동래구 교대역점'),
	('2212160003', '부산 동래구 교대역점'),
	('2212160004', '부산 동래구 교대역점');
   
truncate delivery_mst;

select * from delivery_mst;

create index order_id on delivery_mst(`주문번호`); -- 시험나옴!!!!
-- on = 붙힌다(order_id)라는 키를, 2개의 조합을 하나의 인덱스로 봄
show index from delivery_mst;
-- index를 주는것보다 id(pk)로 값을 주는게 더 편함

/* 
	view
*/