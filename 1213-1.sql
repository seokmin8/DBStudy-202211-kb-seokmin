SELECT
	product_name,
	COUNT(order_id),
	/* count(1) ()안에 아무거나 들어가도 됨, count => 행의 개수가 몇건 있는지 확인하는거? */
	SUM(stock),
	MIN(stock),
	MAX(stock),
	SUM(stock) / COUNT(1),
	AVG(stock)
FROM
	order_mst
GROUP BY
	product_name;
	/* name이 같은값끼리 묶여있어서 count에 어떤값이 들어가도 상관이 없다? 
	전체 총합에 수량을 나눔 = AVG 같음!
	------------------------------1--------------------------------------------*/
	
SELECT
	product_name,
	SUM(price * stock) AS total_price
	/* 총합, 상품별 */
FROM
	order_mst
GROUP BY
	product_name;
	/* 각 상품별 금액이 더해지고 총합! 
	name 기준으로 sum 한다??
	---------------------2---------------------------------------------------*/
	
SELECT
	*,
	price * stock AS total_price
	/* 총합, 상품개수 */
FROM
	order_mst;
	
	/* 1번- 상품= 개당가격, 99개 주문 , 총 합= total
		5,6,7은 같은상품 개수가 다름
		하나의 상품의 전체 총합을 구하고 싶다, 1, 5,6,7 다 합해서
		같은것들 끼리 묶기 위해 groupby 사용, 묶되 합하겠다(2번라인 위로).
		  
   ----------------------3----------------------------------------------*/

SELECT
	product_name,
	COUNT(order_id) AS order_count,
	/* count(1) ()안에 아무거나 들어가도 됨, count => 행의 개수가 몇건 있는지 확인하는거? */
	SUM(stock) AS stock_sum,
	MIN(stock),
	MAX(stock) AS max_stock,
	SUM(stock) / COUNT(1),
	AVG(stock)
FROM
	order_mst
WHERE
	stock > 50
	/* 아래는 신경쓰지않고 where까지만 출력하게 된다(수량 50개 이상인값들 끼리만 groupby 함
		그 조건 안에서 49조건을 다시 거는 것임(having 까지) */	
GROUP BY
	product_name
HAVING
	max_stock > 49
ORDER BY
	order_count desc,
	/* count를 역순으로 나타내고 싶다? desc */
	stock_sum DESC
/*	count 기준으로 정렬하고 싶다? -> order by -> 위에서 부터 순서대로 정렬 우선순위
	출력된 데이터에서 100 이상인것을 출력하고 싶다? ->  
*/
LIMIT 0, 2;
/* limit은 인자가 1개일 땐 개수로 인식 (위에서부터 몇개를 가지고 와라)
	위처럼 2개일 땐 0부터 2인덱스까지의 값을 가지고 와라
	--------------------------------------------------------------------------------------*/

SELECT
	*
FROM
	order_mst
LIMIT 3, 3;

/* limit 3, 3 => 3번 인덱스부터 3개를 가지고 와라 
	인덱스는 무조건 행(컬럼과 전혀 무관!) */