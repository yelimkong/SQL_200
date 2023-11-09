
-- 064 여러 테이블의 데이터를 조인해서 출력 ⑦(NATURAL JOIN)
-- NATURAL 조인 방법으로 이름, 직업, 월급과 부서 위치 출력 
SELECT e.ename 이름, e.job 직업, e.sal 월급, d.loc "부서 위치"
    FROM emp e NATURAL JOIN dept d 
    WHERE e.job = 'SALESMAN';

-- 출력 예시
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO

-- 위의 예제는 조인 조건을 명시적으로 작성하지 않아도 FROM 절에 EMP와 DEPT
-- 사이에 NATURAL JOIN하겠다고 기술하면 조인이 되는 쿼리
-- 두 테이블에 둘 다 존재하는 동일한 컬럼을 기반으로 암시적인 조인을 수행한다.
-- 둘 다 존재하는 동일한 컬럼인 DEPTNO를 오라클이 알아서 찾아 이를 이용하여 조인 수행 
-- 다음과 같이 WHERE 절에 조인을 기술할 때 조인의 연결고리가 되는 컬럼인 
-- DEPTNO는 테이블명을 테이블 별칭 없이 기술해야 한다.

--[ERROR] 테이블 별칭을 사용하게 되면 다음과 같이 오류가 발생
--SELECT e.ename AS 이름, e.job AS 직업, e.sal 직업, d.loc AS "부서 위치"
--    FROM emp e NATURAL JOIN dept d
--    WHERE e.job = 'SALESMAN' AND e.deptno = 30;

-- ORA-25155: NATURAL 조인에 사용된 열은 식별자를 가질 수 없음

SELECT e.ename AS 이름, e.job AS 직업, e.sal 직업, d.loc AS "부서 위치"
    FROM emp e NATURAL JOIN dept d
    WHERE e.job = 'SALESMAN' AND deptno = 30;

-- 출력 예시
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO