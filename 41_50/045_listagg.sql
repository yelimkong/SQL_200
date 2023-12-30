-- 045 데이터 분석 함수로 데이터를 가로로 출력 (LISTAGG)
-- 부서 번호를 출력, 
-- 부서 번호 옆에 해당 부서에 속하는 사원들의 이름을 가로로 출력
SELECT deptno, LISTAGG(ename, ',') WITHIN GROUP (ORDER BY ename) as EMPLOYEE
    FROM emp 
    GROUP BY deptno;

-- 출력 예시 
--10	CLARK,KING,MILLER
--20	ADAMS,FORD,JONES,SCOTT,SMITH
--30	ALLEN,BLAKE,JAMES,MARTIN,TURNER,WARD
-- LISTAGG : 데이터를 가로로 출력 

-- 직업과 그 직업에 속한 사원들의 이름을 가로로 출력 
SELECT job, LISTAGG(ename, ',') WITHIN GROUP (ORDER BY ename ASC) as EMPLOYEE
    FROM emp 
    GROUP BY job;

-- 출력 예시 
--ANALYST	    FORD,SCOTT
--CLERK	        ADAMS,JAMES,MILLER,SMITH
--MANAGER	BLAKE,CLARK,JONES
--PRESIDENT	KING
--SALESMAN	ALLEN,MARTIN,TURNER,WARD

-- 이름 옆에 월급도 같이 출력하려면 연결 연산자를 사용
-- 각 직업별로 월급의 분포가 어떻게 되는지 한눈에 확인할 수 있음
SELECT job,
LISTAGG(ename||'(' ||sal||')',', ') WITHIN GROUP (ORDER BY ename ASC) as EMPLOYEE
    FROM emp 
    GROUP BY job;

-- 출력 예시 
--ANALYST	FORD(3000),SCOTT(3000)
--CLERK	ADAMS(1100),JAMES(950),MILLER(1300),SMITH(800)
--MANAGER	BLAKE(2850),CLARK(2450),JONES(2975)
--PRESIDENT	KING(5000)
--SALESMAN	ALLEN(1600),MARTIN(1250),TURNER(1500),WARD(1250)