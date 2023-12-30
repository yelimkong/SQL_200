-- 041 데이터 분석 함수로 순위 ① (RANK) 
-- 직업이 ANALYST, MANAGER인 사원들의 이름, 직업, 월급, 월급의 순위 출력
SELECT ename, job, sal, RANK() OVER (ORDER BY sal DESC) 순위
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER');
 
-- 출력 예시 
--FORD	ANALYST	3000	1
--SCOTT	ANALYST	3000	1
--JONES	MANAGER	2975	3
--BLAKE	MANAGER	2850	4
--CLARK	MANAGER	2450	5
-- RANK 함수 : 1등이 2명이어서 2등이 출력되지 않고 바로 3등 출력

-- 직업별로 월급이 높은 순서대로 순위 부여 
SELECT ename, sal, job, RANK() OVER (PARTITION BY job
                                                    ORDER BY sal DESC) as 순위
         FROM emp;

-- 출력 예시 
--SCOTT	3000	ANALYST	1
--FORD	3000	ANALYST	1
--MILLER	1300	CLERK	1
--ADAMS	1100	CLERK	2
--JAMES	950	CLERK	3
-- 직업별로 묶어서 순위를 부여하기 위해
-- ORDER BY 앞에 PARTITION BY job 을 사용 