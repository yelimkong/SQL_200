--057 출력되는 행 제한하기 ② (Simple TOP-n Queries)
--월급이 높은 사원순으로 사원 번호, 이름, 직업, 월급을 4개의 행으로 제한해서 출력
SELECT empno, ename, job, sal 
    FROM emp
    ORDER BY sal DESC FETCH FIRST 4 ROWS ONLY;

-- 출력 예시
--7839	KING 	 PRESIDENT	    5000
--7902	FORD  	ANALYST	    3000
--7788	SCOTT	ANALYST	    3000
--7566	JONES	MANAGER	2975

--TOP-N-Query
-- : 정렬된 결과로부터 위쪽 또는 아래쪽의 N개의 행을 반환하는 쿼리
-- FETCH FIRST N ROWS ONLY가 ROWNUM보다 단순하게 결과를 출력할 수 있음


-- 월급이 높은 사원들 중 20%에 해당하는 사원들만 출력
SELECT empno, ename,  job, sal
    FROM emp
    ORDER BY sal DESC
    FETCH FIRST 20 PERCENT ROWS ONLY;

-- 출력 예시
--7839	KING   	PRESIDENT	5000
--7788	SCOTT	ANALYST 	3000
--7902	FORD	    ANALYST  	3000

--WITH TIES 옵션을 이용하면 여러 행이 N번째 행의 값과 동일하다면 같이 출력해 준다.
--2 ROWS를 사용해서 2개의 행이 출력될 거라 예상했지만, 
-- 실제로는 3개의 행이 출력되고 있다.
-- 세 번째 행의 월급 3000이 세 번째 행의 3000과 동일하기 때문이다.

SELECT empno, ename, job, sal
    FROM emp
    ORDER BY sal DESC FETCH FIRST 2 ROWS WITH TIES;

-- 출력 예시
--7839	KING	    PRESIDENT	5000
--7902	FORD	    ANALYST	    3000
--7788	SCOTT	ANALYST	    3000
-- OFFSET 옵션을 이용하면 출력이 시작되는 행의 위치를 지정할 수 있다.

SELECT empno, ename, job, sal
    FROM emp
    ORDER BY sal DESC OFFSET 9 ROWS;

-- 출력 예시
--7521	WARD	SALESMAN	1250
--7654	MARTIN	SALESMAN	1250
--7876	ADAMS	CLERK	    1100
--7900	JAMES	CLERK	    950
--7369	SMITH	CLERK	    800

-- 위의 결과에서 시작 행인 사원 번호 7521는 월급이 1250으로 사원 테이블 전체 사원 중에 월급이 10번째 (9 + 1) 로 높은 사원
-- 10번째 행부터 끝까지 결과를 출력한다.
-- OFFSET과 FETCH를 다음과 같이 서로 조합해서 사용할 수 있다.

SELECT empno, ename, job, sal 
    FROM emp
    ORDER BY sal DESC OFFSET 9 ROWS
    FETCH FIRST 2 ROWS ONLY;

-- 출력 예시
--7654	MARTIN	SALESMAN	1250
--7521	WARD	SALESMAN	1250

-- OFFSET 9로 출력된 5개의 행 중에서 2개의 행만 출력하고 있다.
