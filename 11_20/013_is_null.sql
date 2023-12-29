-- 013 비교연산자 ④ (IS NULL)
-- 커미션이 NULL인 사원들의 이름과 커미션 조회 
SELECT ename, comm
    FROM emp
    WHERE comm IS NULL;
    
-- 출력 결과 
--KING	    (null)
--BLAKE   	(null)
--CLARK   	(null)
--JONES   	(null)
--JAMES	    (null)
--FORD	    (null)
--SMITH	    (null)
--SCOTT   	(null)
--ADAMS	(null)
--MILLER	    (null)

-- NULL값은 데이터가 할당되지 않은 상태라고도 하고 알 수 없는 값이라고도 한다. 
-- 알 수 없는 값이기 때문에 이퀄 연산자(=)로는 비교할 수 없다. 
-- NULL값을 검색하기 위해서는 is null 연산자를 검색해야 한다. 

-- NULL 이 아닌 데이터를 검색할 때에도 COMM != NULL을 사용하여 검색할 수 없다
-- NULL은 데이터가 없는 상태이고 알 수 없는 값이기 때문이다.