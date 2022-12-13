BEGIN
	INSERT INTO
		user_dtl
		(id)
		/* after 이유는 auto incre로 키값 생성이후 작동하도록 */
	values
		(NEW.id);
		/* insert에서 컬럼명을 지정해주면 아래에서  
		(NEW.id, NULL, NULL, NULL) null 들을 생략할 수 있다 */
END