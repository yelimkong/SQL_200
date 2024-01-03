
--054 데이터 분석 함수로 집계 결과 출력 ③ (GROUPING SETS)
-- 부서 번호와 직업, 부서 번호별 토탈 월급과 직업별 토탈 월급, 전체 토탈 월급 출력
SELECT deptno, job, SUM(sal)
    FROM emp
    GROUP BY GROUPING SETS((deptno), (job), ());

-- 출력 예시
--deptno  job          SUM(sal)
--10       (null)	        8750
--30       (null)		    9400
--20       (null)      	10875
--(null)	PRESIDENT	5000
--(null)	MANAGER	8275
--(null)	SALESMAN	5600
--(null)	CLERK	    4150
--(null)	ANALYST 	6000
--(null)	(null)	        29025
-- GROUPING SETS는 앞에서 배운 ROLLUP과 CUBE보다 집계된 결과를 예상하기 더 쉽다.
-- GROUPING SETS에 집계하고 싶은 컬럼들을 기술하면 그대로 출력되기 때문이다. 

-- GROUPING SETS 괄호 안에 집계하고 싶은 컬럼명을 기술하면, 기술한대로 결과를 출력해주면 된다.

-- GROUPING SETS                           출력 결과 
-- GROUPING SETS((deptno), (job), ())    부서 번호별 집계, 직업별 집계, 전체 집계 
-- GROUPING SETS((deptno), (job))        부서 번호별 집계, 직업별 집계
-- GROUPING SETS((deptno, job), ())      부서 번호와 직업별 집계, 전체 집계 
-- GROUPING SETS((deptno, job))         부서 번호와 직업별 집계
    
-- ROLLUP문을 GROUPING SETS로 변경
-- ① ROLLUP 사용했을 때 
SELECT deptno, SUM(sal)
    FROM emp
    GROUP BY ROLLUP(deptno);
    
-- 출력 예시
--10   	8750
--30	    9400
--20	    10875
--(null)	29025   

--② GROUPING SETS 사용했을 때
SELECT deptno, SUM(sal)
    FROM emp
    GROUP BY GROUPING SETS((deptno), ());
    
-- 출력 예시
--10   	8750
--30	    9400
--20	    10875
--(null)	29025 

-- 괄호 ()는 전체를 의미
-- 전체를 대상으로 월급 집계 
-- 두 가지 모두 결과는 동일하나 GROUPING SETS가 결과를 예측하기 더 쉽다.
 
    
-- 토탈 값이 맨 아래에 출력이 안 되어.. UNION ALL을 사용하여 별도로 계산한 후 합치기   
-- 부서 번호별 토탈 월급 출력
SELECT deptno, NULL AS job, SUM(sal) AS total_salary
FROM emp
GROUP BY deptno
UNION ALL
-- 직업별 토탈 월급 출력
SELECT NULL AS deptno, job, SUM(sal)
FROM emp
GROUP BY job
UNION ALL
-- 전체 토탈 월급 출력
SELECT NULL AS deptno, NULL AS job, SUM(sal)
FROM emp;
    

-- 출력 예시
--deptno  job          total_salary
--10       (null)	        8750
--30       (null)		    9400
--20       (null)      	10875
--(null)	PRESIDENT	5000
--(null)	MANAGER	8275
--(null)	SALESMAN	5600
--(null)	CLERK	    4150
--(null)	ANALYST 	6000
--(null)	(null)	        29025

-------