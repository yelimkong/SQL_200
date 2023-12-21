-- 062 여러 테이블의 데이터를 조인해서 출력 ⑤ (ON절)
-- ON 절을 사용한 조인 방법으로 이름과 직업, 월급, 부서 위치를 출력 
SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as "부서 위치"
    FROM emp e JOIN dept d
    ON (e.deptno = d.deptno)
    WHERE e.job = 'SALESMAN';

-- 출력 예시
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO

-- 조인 작성법은 크게 오라클 조인 작성법과 ANSI/ISO SQL:1999 standards 조인 작성법이 있다.
--[오라클 조인 작성법]
-- ① EQUI JOIN
-- ② NON EQUI JOIN
-- ③ OUTER JOIN
-- ④ SELF JOIN

-- [ANSI/ISO SQL : 1999 standard]
-- ① ON 절을 사용한 JOIN
-- ② LEFT/RIGHT/FULL OUTER JOIN
-- ③ USING 절을 사용한 JOIN
-- ④ NATURAL JOIN
-- ⑤ CROSS JOIN 

-- 일반적으로는 오라클 조인 작성법이 많이 쓰인다.
-- EQUI JOIN과 ON절을 사용한 조인 작성법의 차이
-- [오라클 EQUI JOIN]
SELECT e.ename, d.loc
   FROM  emp e, dept d
   WHERE e.deptno = d.deptno;

-- 출력 예시
--KING	    NEW YORK
--BLAKE	    CHICAGO
--CLARK	    NEW YORK
--JONES	    DALLAS
--MARTIN	CHICAGO
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--JAMES    	CHICAGO
--WARD	    CHICAGO
--FORD	    DALLAS
--SMITH	    DALLAS
--SCOTT	    DALLAS
--ADAMS	DALLAS
--MILLER	    NEW YORK

-- WEHRE 절에 작성했던 조인 조건을 ON절에 작성했다,
-- 여러 개의 테이블을 조인할 때 조인 작성법의 차이는 다음과 같다.
-- [오라클 EQUI JOIN]
SELECT e.ename, d.loc
    FROM emp e, dept d, salgrade s
    WHERE e.deptno  = d.deptno 
    AND e.sal BETWEEN s.losal AND s.hisal;

-- 출력 예시
--KING	    NEW YORK
--SCOTT	    DALLAS
--FORD	    DALLAS
--JONES	    DALLAS
--BLAKE	    CHICAGO
--CLARK   	NEW YORK
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--MILLER	    NEW YORK
--WARD	    CHICAGO
--MARTIN	CHICAGO
--ADAMS	DALLAS
--JAMES   	CHICAGO
--SMITH	    DALLAS

-- [ON 절을 사용한 조인]
SELECT e.ename, d.loc, s.grade
    FROM emp e JOIN dept d
    ON (e.deptno = d.deptno)
    JOIN salgrade s 
    ON (e.sal BETWEEN s.losal AND s.hisal);

-- 출력 예시
--KING	    NEW YORK	5
--SCOTT    	DALLAS	    4
--FORD	    DALLAS	    4
--JONES	    DALLAS	    4
--BLAKE	    CHICAGO	4
--CLARK	    NEW YORK	4
--ALLEN	    CHICAGO	3
--TURNER	CHICAGO	3
--MILLER	    NEW YORK	2
--WARD	    CHICAGO	2
--MARTIN	CHICAGO	2
--ADAMS	DALLAS	    1
--JAMES	    CHICAGO	1
--SMITH	    DALLAS	    1

-- 여러 개의 테이블을 조인할 때는 연결고리가 되는 조인 조건을
-- 테이블의 개수에서 하나를 차감해서 기술
-- (조인 조건의 개수 = 테이블 개수 -1 ) 
-- 위의 예제에서는 테이블이 3개이므로 조인 조건을 2개 작성했다. 