-- 61 여러 테이블의 데이터를 조인해서 출력 ④ (SELF JOIN)
-- 사원 (EMP) 테이블 자기 자신의 테이블과 조인하여 이름, 직업,해당 사원의 
-- 관리자 이름과 관리자의 직업을 출력 
SELECT e.ename 이름, e.job 직업, m.ename 관리자, m.job "관리자 직업"
    FROM emp e, emp m
    WHERE e.mgr = m.empno AND e.job = 'SALESMAN';
    
-- 출력 예시
--MARTIN	SALESMAN	BLAKE	MANAGER
--WARD	    SALESMAN	BLAKE	MANAGER
--TURNER	SALESMAN	BLAKE	MANAGER
--ALLEN	    SALESMAN	BLAKE	MANAGER

-- [결과 해석]
-- MARTIN, WARD, TURNER, ALLEN의 관리자는 BLAKE 이다.
-- 아래 쿼리를 보면 사장인 KING을 관리자로 두고 있는 
-- KING의 직속 부하 사원들이  BLAKE, CLARK, JONES이다.
-- 그리고 BLAKE 밑에 직속 부하 사원들이 JAMES, WARD, TURNER, ALLEN, MARTIN이다. 
-- 이를 정하는 기준은 MGR 컬럼이다.
-- MGR은 해당 사원의 직속 상사의 사원 번호이다.

-- 직속 상사는 바로 해당 사원의 관리자이다.

-- KING 의 사원 번호인 7839를 MGR 번호로 하고 있는 사원들은 BLAKE, CLARK, JONES이다.
-- BLAKE의 사원 번호인 7698를  MGR 번호로 하고 있는 사원들은 JAMES, WARD, TURNER, ALLEN, MARTIN이다

-- FROM 절에 사원 테이블을 2개 기술하고 하나는 e로 별칭을 주고 
-- 다른 하나는 m으로 별칭을 준다.

-- emp 테이블은 사원과 관리자가 섞여서 구성되어 있으므로 
-- emp 테이블은 사원 테이블이라 할 수 있고 관리자 테이블이라 할 수도 있다.

-- 그래서 사원 테이블 별칭을 "e", 관리자 테이블 별칭을 "m"이다.

SELECT e.empno 사원번호, e.ename 이름, m.empno "관리자 사원번호", m.ename 관리자명
    FROM emp e, emp m 
    WHERE e.mgr = m.empno;

-- 출력 예시
--7788	SCOTT	7566	JONES
--7902	FORD	    7566	JONES
--7900	JAMES	7698	BLAKE
--7521	WARD	7698	BLAKE
--7844	TURNER	7698	BLAKE
--7499	ALLEN	7698	BLAKE
--7654	MARTIN	7698	BLAKE
--7934	MILLER	7782	CLARK
--7876	ADAMS	7788	SCOTT
--7698	BLAKE	7839	KING
--7782	CLARK	7839	KING
--7566	JONES	7839	KING
--7369	SMITH	7902	FORD

SELECT empno, ename, mgr
    FROM emp;

-- 출력 예시
--7839	KING	    (null)
--7698	BLAKE	7839
--7782	CLARK	7839
--7566	JONES	7839
--7654	MARTIN	7698
--7499	ALLEN	7698
--7844	TURNER	7698
--7900	JAMES	7698
--7521	WARD	7698
--7902	FORD	    7566
--7369	SMITH	7902
--7788	SCOTT	7566
--7876	ADAMS	7788
--7934	MILLER	7782

-- 사원 테이블 emp와 관리자 테이블 emp의 연결고리로는 e.mgr = m.empno가 사용되었다.