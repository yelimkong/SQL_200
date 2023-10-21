
-- 066 여러 테이블의 데이터를 조인해서 출력 ⑨ (FULL OUTER JOIN)
-- FULL OUTER JOIN 방법으로 이름, 직업, 월급, 부서 위치 출력
SELECT e.ename 이름, e.job 직업, e.sal 월급, d.loc "부서 위치"
    FROM emp e FULL OUTER JOIN dept d
    ON (e.deptno = d.deptno);

-- 출력 예시
--JACK	    ANALYST  	3000	(null)
--KING	    PRESIDENT	5000	NEW YORK
--BLAKE  	MANAGER	2850	CHICAGO
--CLARK	    MANAGER	2450	NEW YORK
--JONES	    MANAGER	2975	DALLAS
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--JAMES	    CLERK	    950	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO
--FORD	    ANALYST	    3000	DALLAS
--SMITH	    CLERK	    800	DALLAS
--SCOTT	    ANALYST	    3000	DALLAS
--ADAMS	CLERK	    1100	DALLAS
--MILLER  	CLERK	    3000	NEW YORK
--(null)       (null)          (null)  BOSTON

--  위의 예제는 RIGHT OUTER JOIN과 LEFT OUTER JOIN을 한 번에 수행하여 출력 
-- EMP 테이블에만 있는 부서 번호 50번인 JACK 데이터와 DEPT 테이블에만 있는 
-- 부서 번호 40 번에 대한 데이턴인 BOSTON 을 출력하며 조인하고 있다.

-- [ERROR] 아우터 조인 사인(+) 양쪽에 넣었을 경우
--SELECT e.ename, d.loc
--    FROM emp e, dept d
--    WHERE e.deptno (+) = d.deptno (+) ;
-- ORA-01468: outer-join된 테이블은 1개만 지정할 수 있습니다

-- FULL OUTER JOIN 을 사용하지 않고 동일한 결과 출력
SELECT e.ename 이름, e.job 직업, e.sal 월급, d.loc "부서 출력"
    FROM emp e LEFT OUTER JOIN dept d
    ON (e.deptno = d.deptno)
UNION 
SELECT e.ename, e.job, e.sal, d.loc
    FROM emp e RIGHT OUTER JOIN dept d
    ON (e.deptno = d.deptno);


-- 출력 예시
--JACK	    ANALYST  	3000	(null)
--KING	    PRESIDENT	5000	NEW YORK
--BLAKE  	MANAGER	2850	CHICAGO
--CLARK	    MANAGER	2450	NEW YORK
--JONES	    MANAGER	2975	DALLAS
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--JAMES	    CLERK	    950	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO
--FORD	    ANALYST	    3000	DALLAS
--SMITH	    CLERK	    800	DALLAS
--SCOTT	    ANALYST	    3000	DALLAS
--ADAMS	CLERK	    1100	DALLAS
--MILLER  	CLERK	    3000	NEW YORK
--(null)       (null)          (null)  BOSTON
