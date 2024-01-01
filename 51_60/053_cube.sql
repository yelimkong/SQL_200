--053 데이터 분석 함수로 집계 결과 출력 ② (CUBE)
-- 직업, 직업별 토탈 월급 출력 
-- 첫 번째 행에 토탈 월급 출력 
SELECT job, SUM(sal)
    FROM emp
    GROUP BY CUBE(job);

-- 출력 예시
--(null)  		    29025
--CLERK	        4150
--ANALYST	    6000
--MANAGER	8275
--SALESMAN	5600
--PRESIDENT	5000

-- CUBE를 추가하지 않았을 때 
SELECT job, SUM(sal)
    FROM emp
    GROUP BY job;
    
-- 출력 예시
--PRESIDENT	5000
--MANAGER	8275
--SALESMAN	5600
--CLERK	        4150
--ANALYST	    6000

-- CUBE를 추가 했을 때 
SELECT job, SUM(sal)
    FROM emp
    GROUP BY CUBE(job);

-- 출력 예시
--(null)  		    29025
--CLERK	        4150
--ANALYST	    6000
--MANAGER	8275
--SALESMAN	5600
--PRESIDENT	5000

SELECT deptno, job, sum(sal)
    FROM emp
    GROUP BY CUBE(deptno, job);
    
-- 출력 예시
--	     (null)       	29025 → 토탈 월급 출력 
--   	CLERK	    4150  → 직업별 토탈 월급 출력
--	    ANALYST 	6000
--	    MANAGER	8275
--	    SALESMAN	5600
--	    PRESIDENT	5000
--10	(null)       	8750  → 부서 번호별 토탈 월급이 출력 
--10	CLERK	    1300  → 부서 번호별 직업별토탈 월급 출력
--10	MANAGER	2450
--10	PRESIDENT	5000
--20	(null)       	10875
--20	CLERK	    1900
--20	ANALYST	    6000
--20	MANAGER	2975
--30	(null)          9400
--30	CLERK	    950

-- GROUP BY CUBE(deptno, job)는 총 4가지 경우 집계 결과가 나온다.

--[집계 결과]
-- ①전체 토탈 월급이 맨 위에 출력
-- ②직업별 토탈 월급이 출력됨
-- ③부서번호별 토탈 월급과 부서 번호별 직업별 토탈 월급
-- ④전체 토탈 월급