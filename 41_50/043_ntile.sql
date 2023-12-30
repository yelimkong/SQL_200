-- 043 데이터 분석 함수로 등급 출력 (NTILE)
-- 이름과 월급, 직업, 월급의 등급 출력 
-- 월급의 등급은 4등급으로 나누기
-- 1등급(0 ~ 25%), 2등급(25 ~ 50%), 3등급(50 ~ 75%), 4등급(75 ~ 100%)
SELECT ename, job, sal ,
          NTILE(4) OVER (ORDER BY sal DESC NULLS LAST) 등급
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER', 'CLECK');

-- 출력 예시 
--FORD	ANALYST    3000	1
--SCOTT	ANALYST	    3000	1
--JONES	MANAGER	2975	2
--BLAKE	MANAGER	2850	3
--CLARK	MANAGER	2450	4

-- 1등급(0 ~ 20%), 2등급(20 ~ 40%), 3등급(40 ~ 60%), 4등급(60 ~ 80%), 5등급(80 ~ 100%)
SELECT ename, job, sal ,
          NTILE(5) OVER (ORDER BY sal DESC NULLS LAST) 등급
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER', 'CLECK');

-- 출력 예시 
--FORD	ANALYST	    3000	1
--SCOTT	ANALYST	    3000	2
--JONES	MANAGER	2975	3
--BLAKE	MANAGER	2850	4
--CLARK	MANAGER	2450	5 

-- ORDER BY sal DESC NULLS LAST에서 
-- NULLS LAST는 NULL을 맨 아래에 출력 
-- 1) NULLS LAST를 사용 안 했을 때 
SELECT ename, comm
    FROM emp 
    WHERE deptno = 30 
    ORDER BY comm DESC;

-- 출력 예시 
--BLAKE	    (null)
--JAMES  	(null)
--MARTIN	1400
--WARD	    500
--ALLEN  	300
--TURNER	0

-- 2) NULLS LAST를 사용 했을 때 
SELECT ename, comm
    FROM emp
    WHERE deptno = 30
    ORDER BY comm DESC NULLS LAST;
    
-- 출력 예시 
--MARTIN	1400
--WARD	    500
--ALLEN  	300
--TURNER	0
--BLAKE	    (null)
--JAMES  	(null)