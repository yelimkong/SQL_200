-- 014 비교연산자 ⑤ (IN)
-- 직업이 SALESMAN, ANALYST, MANAGER인 사원들의 이름, 월급, 직업 조회 
SELECT ename, sal, job 
    FROM emp 
    WHERE job IN ('SALESMAN', 'ANALYST', 'MANAGER');

-- 출력 예시 
--BLAKE  	2850	MANAGER
--CLARK	    2450	MANAGER
--JONES  	2975	MANAGER
--MARTIN	1250	SALESMAN
--ALLEN	    1600	SALESMAN
--TURNER	1500	SALESMAN
--WARD	    1250	SALESMAN
--FORD	    3000	ANALYST
--SCOTT	    3000	ANALYST


-- 위와 동일한 결과 출력하는 SQL
SELECT ename, sal, job 
    FROM emp 
    WHERE (job = 'SALESMAN' or job = 'ANALYST' or job = 'MANAGER');

-- 출력 예시 
--BLAKE  	2850	MANAGER
--CLARK	    2450	MANAGER
--JONES  	2975	MANAGER
--MARTIN	1250	SALESMAN
--ALLEN	    1600	SALESMAN
--TURNER	1500	SALESMAN
--WARD	    1250	SALESMAN
--FORD	    3000	ANALYST
--SCOTT	    3000	ANALYST


-- 직업이 SALESMAN, ANALYST, MANAGER이 아닌 사원들의 이름, 월급, 직업 조회 
SELECT ename, sal, job 
    FROM emp 
    WHERE job NOT IN ('SALESMAN', 'ANALYST', 'MANAGER');

-- 출력 예시 
--KING	    5000	PRESIDENT
--JAMES	    950	CLERK
--SMITH	    800	CLERK
--ADAMS	1100	CLERK
--MILLER	    1300	CLERK


-- 위와 동일한 결과 출력하는 SQL
SELECT ename, sal, job 
    FROM emp 
    WHERE (job != 'SALESMAN' or job != 'ANALYST' or job != 'MANAGER');
    
-- 출력 예시     
--KING	    5000	PRESIDENT
--BLAKE	    2850	MANAGER
--CLARK	    2450	MANAGER
--JONES   	2975	MANAGER
--MARTIN	1250	SALESMAN
--ALLEN	    1600	SALESMAN
--TURNER	1500	SALESMAN
--JAMES	    950	CLERK
--WARD	    1250	SALESMAN
--FORD	    3000	ANALYST
--SMITH	    800	CLERK
--SCOTT	    3000	ANALYST
--ADAMS	1100	CLERK
--MILLER	    1300	CLERK 
    
    