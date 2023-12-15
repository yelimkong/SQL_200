-- 063 여러 테이블의 데이터를 조인해서 출력 ⑥(USING절)
-- USING절을 사용한 조인 방법으로 이름, 직업, 월급, 부서 위치를 출력
SELECT e.ename 이름, e.job 직업, e.sal 월급, d.loc "부서 위치"
    FROM emp e JOIN dept d 
    USING (deptno)
    WHERE e.job = 'SALESMAN';

-- 출력 예시
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO

-- 위의 쿼리는 WHERE 절 USING 절을 사용하여 EMP 와 DEPT 테이블을 조인하는 쿼리
-- USING 절에는 조인 조건 대신 두 테이블을 연결할 때 사용한 컬럼인 DEPTNO만 기술하면 된다.
-- DEPTNO 앞에는 테이블명이나 테이블 별칭을 사용할 수 없다. 
-- [ERROR 열명]
--SELECT e.ename 이름, e.job 직업, e.sal 월급, d.loc "부서 위치"
--    FROM emp e JOIN dept d 
--    USING (e.deptno)
--    WHERE e.job = 'SALESMAN';

-- ORA-01748: 열명 그 자체만 사용할 수 있습니다

-- EQUI JOIN 과 USING 절을 사용한 작성법의 차이 
-- ①[오라클 EUQI JOIN]
SELECT e.ename, d.loc
    FROM emp e, dept d
    WHERE e.deptno = d.deptno ;

-- 출력 예시
--KING	    NEW YORK
--BLAKE	    CHICAGO
--CLARK   	NEW YORK
--JONES	    DALLAS
--MARTIN	CHICAGO
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--JAMES	    CHICAGO
--WARD	    CHICAGO
--FORD	    DALLAS
--SMITH	    DALLAS
--SCOTT   	DALLAS
--ADAMS	DALLAS
--MILLER 	NEW YORK

-- ②[USING 절을 사용한 조인]
SELECT e.ename, d.loc
    FROM emp e JOIN dept d 
    USING (deptno);

-- 출력 예시
--KING	    NEW YORK
--BLAKE	    CHICAGO
--CLARK	    NEW YORK
--JONES	    DALLAS
--MARTIN	CHICAGO
--ALLEN   	CHICAGO
--TURNER	CHICAGO
--JAMES	    CHICAGO
--WARD	    CHICAGO
--FORD	    DALLAS
--SMITH	    DALLAS
--SCOTT	    DALLAS
--ADAMS	DALLAS
--MILLER	    NEW YORK

-- [ERROR 누락된 좌괄호]
--SELECT e.ename 이름, e.job 직업, e.sal 월급, d.loc "부서 위치"
--    FROM emp e JOIN dept d
--    USING deptno 
--    WHERE e.job = 'SALESMAN';
    
-- ORA-00906: 누락된 좌괄호

-- [오라클 EQUI JOIN]
SELECT e.ename, d.loc 
    FROM emp e, dept d, salgrade s
    WHERE e.deptno =  d.deptno 
    AND e.sal BETWEEN s.losal AND s.hisal;

--출력 예시
--KING	    NEW YORK
--SCOTT    	DALLAS
--FORD	    DALLAS
--JONES	    DALLAS
--BLAKE	    CHICAGO
--CLARK	    NEW YORK
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--MILLER    	NEW YORK
--WARD	    CHICAGO
--MARTIN	CHICAGO
--ADAMS	DALLAS
--JAMES    	CHICAGO
--SMITH	    DALLAS

-- [USING 절을 사용한 조인]
SELECT e.ename, d.loc, s.grade 
    FROM emp e JOIN dept d
    USING (deptno)
    JOIN salgrade s 
    ON (e.sal BETWEEN s.losal AND s.hisal);

--KING	    NEW YORK	5
--SCOTT	    DALLAS    	4
--FORD	    DALLAS      4
--JONES	    DALLAS      4
--BLAKE	    CHICAGO 	4
--CLARK	    NEW YORK	4
--ALLEN	    CHICAGO	3
--TURNER	CHICAGO	3
--MILLER	    NEW YORK	2
--WARD   	CHICAGO	2
--MARTIN	CHICAGO	2
--ADAMS	DALLAS	    1
--JAMES	    CHICAGO	1
--SMITH	    DALLAS	    1  
