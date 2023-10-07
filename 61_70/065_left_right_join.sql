-- 065 여러 테이블의 데이터를 조인해서 출력 ⑧(LEFT/RIGHT OUTER JOIN)
SELECT e.ename 이름, e.job 직업, e.sal 월급, d.loc "부서 위치"
    FROM emp e RIGHT OUTER JOIN dept d
    ON (e.deptno = d.deptno);

-- 출력 예시
--KING	    PRESIDENT	5000	NEW YORK
--BLAKE	    MANAGER	2850	CHICAGO
--CLARK	    MANAGER	2450	NEW YORK
--JONES	    MANAGER	2975	DALLAS
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--JAMES	    CLERK    	950	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO
--FORD	    ANALYST	    3000	DALLAS
--SMITH	    CLERK	    800	DALLAS
--SCOTT	    ANALYST	    3000	DALLAS
--ADAMS	CLERK	    1100	DALLAS
--MILLER	    CLERK	    1300	NEW YORK
--(null)       (null)         	(null)  BOSTON

-- 오라클 조인 작성법 중 OUTER 조인을 1999 ANSI/ISO JOIN의 RIGHT OUTER JOIN으로 작성한 SQL
-- EMP와 DEPT를 조인할 때 오른쪽의 DEPT 테이블의 데이터는 전부 출력 

-- 오라클 아우터 조인과 1999 ANSI/ISO 조인 SQL 작성법 차이
-- ①[오라클 OUTER JOIN]
SELECT e.ename, d.loc
    FROM emp e, dept d
    where e.deptno (+) = d.deptno ;


-- 출력 예시
--KING	    NEW YORK
--BLAKE	    CHICAGO
--CLARK	    NEW YORK
--JONES	    DALLAS
--MARTIN	CHICAGO
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--JAMES	    CHICAGO
--WARD	    CHICAGO
--FORD	    DALLAS
--SMITH	    DALLAS
--SCOTT	    DALLAS
--ADAMS	DALLAS
--MILLER   	NEW YORK
--(null)	    BOSTON

--②[1999 ANSI/ISO RIGHT OUTER JOIN]
SELECT e.ename, d.loc
    FROM emp e RIGHT OUTER JOIN dept d 
    ON (e.deptno = d.deptno);
    
--KING	    NEW YORK
--BLAKE	    CHICAGO
--CLARK	    NEW YORK
--JONES	    DALLAS
--MARTIN	CHICAGO
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--JAMES	    CHICAGO
--WARD	    CHICAGO
--FORD	    DALLAS
--SMITH	    DALLAS
--SCOTT	    DALLAS
--ADAMS	DALLAS
--MILLER   	NEW YORK
--(null)	    BOSTON

-- LEFT OUTER JOIN을 수행하기 위해 DEPT 테이블에는 없는 부서 번호 50번을
-- 사원 테이블에 입력 
INSERT INTO EMP(EMPNO, ENAME, SAL, JOB, DEPTNO) VALUES(8282, 'JACK', 3000, 'ANALYST', 50);


-- EMP 테이블 제약조건 확인 
SELECT constraint_name, search_condition
FROM user_constraints
WHERE table_name = 'EMP';

-- 출력 결과
--EMP_MGR_FK	        (null)
--SYS_C008348	        "EMPNO" IS NOT NULL
--EMP_ENAME_NN	"ENAME" IS NOT NULL
--EMP_SAL_CK	        sal BETWEEN 0 AND 9000
--EMP_DEPTNO_CK	deptno IN( 10, 20, 30 ) 
--EMP_EMAIL_CK	    email= '%@%.%'
--EMP_EMPNO_PK	(null)

-- 기존 제약조건 삭제:
ALTER TABLE EMP DROP CONSTRAINT EMP_DEPTNO_CK;


-- 새로운 제약조건 추가:
ALTER TABLE EMP ADD CONSTRAINT EMP_DEPTNO_CK CHECK (deptno IN (10, 20, 30, 50));

-- 1999 ANSI/ISO LEFT OUTER JOIN 수행 
SELECT e.ename 이름, e.job 직업, e.sal 월급, d.loc "부서 위치"
    FROM emp e LEFT OUTER JOIN dept d
    ON (e.deptno = d.deptno);

-- 출력 예시
--KING    	PRESIDENT	5000	NEW YORK
--CLARK	    MANAGER	2450	NEW YORK
--MILLER  	CLERK	    1300	NEW YORK
--JONES    	MANAGER	2975	DALLAS
--FORD	    ANALYST  	3000	DALLAS
--SMITH    	CLERK	    800	DALLAS
--SCOTT	    ANALYST	    3000	DALLAS
--ADAMS	CLERK	    1100	DALLAS
--BLAKE	    MANAGER	2850	CHICAGO
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--JAMES	    CLERK	    950	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO
--JACK	    ANALYST 	3000	(null)
-- EMP 테이블 데이터는 전부 출력
-- DEPT 테이블에는 70번이 존재하지 않아 부서 위치가 null이 출력 됨 

-- 오라클 OUTER JOIN 조인과 1999 ANSI/ISO SQL의 LEFT OUTER JOIN 작성법 차이 
--①[오라클 OUTER JOIN]
SELECT e.ename, d.loc
    FROM emp e, dept d
    WHERE e.deptno = d.deptno (+);

-- 출력 예시
--KING	    NEW YORK
--CLARK	    NEW YORK
--MILLER	    NEW YORK
--JONES	    DALLAS
--FORD	    DALLAS
--SMITH	    DALLAS
--SCOTT	    DALLAS
--ADAMS	DALLAS
--BLAKE	    CHICAGO
--MARTIN	CHICAGO
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--JAMES   	CHICAGO
--WARD	    CHICAGO
--JACK	    (null)

--②[1999 ANSI/ISO LEFT OUTER JOIN]
SELECT e.ename, d.loc
    FROM emp e LEFT OUTER JOIN dept d
    ON (e.deptno = d.deptno);

-- 출력 예시
--KING	    NEW YORK
--CLARK	    NEW YORK
--MILLER	    NEW YORK
--JONES	    DALLAS
--FORD	    DALLAS
--SMITH	    DALLAS
--SCOTT	    DALLAS
--ADAMS	DALLAS
--BLAKE   	CHICAGO
--MARTIN	CHICAGO
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--JAMES	    CHICAGO
--WARD	    CHICAGO
--JACK	    (null)

-- 오라클 OUTER JOIN의 아우터 조인 사인 (+)는 데이터가 덜 출력되는 쪽에 붙여준다.
-- EMP 테이블에 존재하는 데이터는 전부 출력되고 있다.