-- 044 데이터 분석 함수로 순위의 비율 출력 (CUME_DIST)
-- 이름과 월급, 월급의 순위, 월급의 순위 비율 출력
SELECT ename, sal, RANK() OVER (ORDER BY sal DESC) as RANK,
                         DENSE_RANK() OVER (ORDER BY sal DESC) as DENSE_RANK,
                         ROUND(CUME_DIST() OVER (ORDER BY sal DESC),2) as CUME_DIST
    FROM emp;

---- 출력 예시 
--ename sal  RANK DENSE_RANK CUME_DIST
--KING	    5000	1	1	0.07
--SCOTT  	3000	2	2	0.21
--FORD	    3000	2	2	0.21
--JONES  	2975	4	3	0.29
--BLAKE  	2850	5	4	0.36
--CLARK   	2450	6	5	0.43
--ALLEN   	1600	7	6	0.5
--TURNER	1500	8	7	0.57
--MILLER	    1300	9	8	0.64
--WARD	    1250	10	9	0.79
--MARTIN	1250	10	9	0.79
--ADAMS	1100	12	10	0.86
--JAMES	    950	13	11	0.93
--SMITH	    800	14	12	1

-- PARTITION BY JOB 을 사용해 CUME_DIST를 출력 
SELECT job, ename, sal, RANK() OVER (PARTITION BY job
                                                    ORDER BY sal DESC ) as RANK, 
                                ROUND(CUME_DIST() OVER (PARTITION BY job
                                                            ORDER BY sal DESC),2) as CUME_DIST
    FROM emp;

-- 출력 예시
--  job,           ename,   sal,   RANK, CUME_DIST
--ANALYST   	SCOTT	3000	1	1
--ANALYST   	FORD	    3000	1	1
--CLERK       	MILLER	1300	1	0.25
--CLERK	        ADAMS	1100	2	0.5
--CLERK       	JAMES	950	3	0.75
--CLERK	        SMITH	800	4	1
--MANAGER	JONES	2975	1	0.33
--MANAGER	BLAKE	2850	2	0.67
--MANAGER	CLARK	2450	3	1
--PRESIDENT	KING	    5000	1	1
--SALESMAN	ALLEN	1600	1	0.25
--SALESMAN	TURNER	1500	2	0.5
--SALESMAN	MARTIN	1250	3	1
--SALESMAN	WARD	1250	3	1
