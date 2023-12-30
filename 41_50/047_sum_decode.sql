-- 047 COLUMN을 ROW로 출력하기 ① (SUM + DECODE)
-- 부서 번호, 부서 번호별 토탈 월급 출력, 가로로 출력 
SELECT SUM(DECODE(deptno, 10, sal)) as "10",
           SUM(DECODE(deptno, 20, sal)) as "20",
           SUM(DECODE(deptno, 30, sal)) as "30"
    FROM emp;

-- 출력 예시 
-- 8750	10875	   9400

-- 부서 번호가 10번이면 월급이 출력되고 아니면 NULL이 출력
SELECT deptno, DECODE(deptno, 10, sal) as "10"
    FROM emp;

-- 출력 예시 
--10	5000
--30	(null)
--10	2450
--20	(null)
--30	(null)
--30	(null)
--30	(null)
--30	(null)
--30	(null)
--20	(null)
--20	(null)
--20	(null)
--20	(null)
--10	1300

-- 부서 번호가 10번인 사원들의 월급의 합
SELECT SUM(DECODE(deptno, 10, sal)) as "10"
    FROM emp;
    
-- 출력 예시 
-- 8750

-- 직업, 직업별 토탈 월급 출력, 가로로 출력
-- 사원 테이블에 직업 종류를 알아야 사용할 수 있는 쿼리
-- 모른다면 PL/SQL 사용해야 함
SELECT SUM(DECODE(job, 'ANALYST', sal)) as "ANALYST",
           SUM(DECODE(job, 'CLERK', sal)) as "CLERK",
           SUM(DECODE(job, 'CLERK', sal)) as "CLERK",
           SUM(DECODE(job, 'SALESMAN', sal)) as "SALESMAN"
    FROM emp;
           
-- 출력 예시
-- 6000	4150	8275	5600

-- 부서번호별 직업의 토탈 월급 분포 출력 
SELECT deptno, SUM(DECODE(job, 'ANALYST', sal)) as "ANALYST",
                     SUM(DECODE(job, 'CLERK', sal)) as "CLERK",
                     SUM(DECODE(job, 'MANAGER', sal)) as "MANAGER",
                     SUM(DECODE(job, 'SALESMAN', sal)) as "SALESMAN"
    FROM emp
    GROUP BY deptno;
                     
-- 출력 예시 
--10	(null)	1300	2450	(null)
--30	(null)	950	2850	5600
--20	6000	1900	2975	(null)

-- [출력 결과 분석]
-- CLERK과 MANAGER는 모든 부서에 존재하지만, 
-- ANALST는 20번에만 존재 
-- SALESMAN은 30번에만 존재 
