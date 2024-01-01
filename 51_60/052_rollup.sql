--052 데이터 분석 함수로 집계 결과 출력 ① (ROLLUP)
-- 직업과 직업별 토탈 월급 출력, 
-- 맨 마지막 행에 토탈 월급 출력 
SELECT job, SUM(sal)
    FROM emp
    GROUP BY ROLLUP(job);
    
-- 출력 예시
--PRESIDENT	5000
--MANAGER	8275
--SALESMAN	5600
--CLERK      	4150
--ANALYST   	6000
--(null)           29025

-- ROLLUP을 이용하여 직업과 직업별토탈 월급 출력 
-- 맨 아래쪽에 전체 토탈 월급 추가적으로 출력 

-- ① ROLLUP 추가하지 않았을 때
SELECT job, SUM(sal)
    FROM emp
    GROUP BY job;

-- 출력 예시
--PRESIDENT	5000
--MANAGER	8275
--SALESMAN	5600
--CLERK      	4150
--ANALYST	    6000 

-- ② ROLLUP 추가 했을 때
SELECT job, SUM(sal)
    FROM emp
    GROUP BY ROLLUP(job);
    
-- 출력 예시
--PRESIDENT	5000
--MANAGER	8275
--SALESMAN	5600
--CLERK      	4150
--ANALYST   	6000
--(null)           29025

--ROLLUP을 사용하면 맨 아래에 토탈 월급도 출력되고 JOB 컬럼의 데이터도 오름차순으로 정렬됨

-- ROLLUP에 컬럼 2개를 사용한 경우 
SELECT deptno, job, SUM(sal)
    FROM emp
    GROUP BY ROLLUP(deptno, job)
    ORDER BY deptno, job;

-- 출력 예시
--10	CLERK	    1300   →
--10	MANAGER	2450   → 부서번호별 직업별 토탈 월급 출력
--10	PRESIDENT	5000   →
--10	(null)  	    8750   →  부서 번호별 토탈 월급 출력
--20	ANALYST	    6000
--20	CLERK    	1900
--20	MANAGER	2975
--20	(null)  	    10875
--30	CLERK    	950
--30	MANAGER	2850
--30	SALESMAN	5600
--30  	(null)       	9400
--(null)  (null)  		29025
        