-- 042 데이터 분석 함수로 순위 ② (DENSE_RANK) 
-- 직업이 ANALYST, MANAGER인 사원들의 이름, 직업, 월급, 월급의 순위 출력
-- 1위인 사원이 2명이 있을 경우 다음 순위가 3위로 출력되지 않고 2위로 출력
SELECT ename, job, sal, RANK() OVER (ORDER BY sal DESC) as RANK,
                                DENSE_RANK() OVER (ORDER BY sal DESC) as DENSE_RANK
    FROM emp 
    WHERE job IN ('ANALYST', 'MANAGER'); 


-- 출력 예시 
--FORD	ANALYST	    3000	1	1
--SCOTT	ANALYST 	3000  1	1
--JONES	MANAGER	2975	3	2  RANK 함수는 3위, DENSE_RANK는 2위 출력
--BLAKE	MANAGER	2850	4	3
--CLARK	MANAGER	2450	5	4

-- 81년도에 입사한 사원들의 직업, 이름, 월급, 순위 출력
-- 직업별로 월급이 높은 순서대로 순위 부여 
SELECT job, ename, sal, DENSE_RANK() OVER (PARTITION BY job
                                                              ORDER BY sal DESC) 순위
    FROM emp 
    WHERE hiredate BETWEEN TO_DATE('1981/01/01', 'RRRR/MM/DD')
                                AND TO_DATE('1981/12/31', 'RRRR/MM/DD');

-- 출력 예시 
--ANALYST	     FORD	3000	1
--CLERK	        JAMES	950	1
--MANAGER	JONES	2975	1
--MANAGER	BLAKE	2850	2
--MANAGER	CLARK	2450	3
--PRESIDENT	KING  	5000	1
--SALESMAN	ALLEN	1600	1
--SALESMAN	TURNER	1500	2
--SALESMAN	WARD	1250	3
--SALESMAN	MARTIN	1250	3


-- DENSE_RANK 바로 다음에 나오는 괄호에도 데이터를 넣고 사용할 수 있다.
-- 월급이 2975인 사원의 월급의 순위가 어떻게 되는지 출력 
-- DENSE_RANK 바로 다음에 나오는 괄호 안에 값을 입력
-- 그 값이 데이터 전체에서의 순위가 어떻게 되는지 출력 
-- WHITIN : ~ 이내에 
-- WHITIN GROUP : 어느 그룹 이내에서 2975의 순위가 어떻게 되는지 

SELECT DENSE_RANK(2975) WITHIN GROUP (ORDER BY sal desc) 순위
    FROM emp;

-- 출력 예시 
-- 순위 
-- 3

-- 입사일 81년 11월 17일 사원 테이블 전체 사원들 중 몇 번째로 입사한 것인지 출력
SELECT DENSE_RANK('81/11/17') WITHIN GROUP (ORDER BY hiredate ASC) 순위 
    FROM emp;

-- 출력 예시 
-- 순위 
-- 9