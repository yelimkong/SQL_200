-- 039 토탈값 출력 (SUM)
-- 부서 번호와 부서 번호별 토탈 월급 출력 
SELECT deptno, SUM(sal) 
    FROM emp 
    GROUP BY deptno;
    
-- 출력 예시
--10	8750
--30	9400
--20	10875

-- 직업과 직업별 토탈 월급을 출력 
-- 직업별 토탈 월급이 높은 것부터 출력
SELECT job, SUM(sal)
    FROM emp
    GROUP BY job
    ORDER BY SUM(sal) DESC;

-- 출력 예시
--MANAGER	8275
--ANALYST	6000
--SALESMAN	5600
--PRESIDENT	5000
--CLERK	4150

-- 직업과 직업별 토탈 월급 출력
-- (error)직업별 토탈 월급이 4000 이상인 것만 출력 
SELECT job, SUM(sal)
    FROM emp
    WHERE SUM(sal) >= 4000
    GROUP BY job;
-- ORA-00934: 그룹 함수는 허가되지 않습니다 

--(정상)직업별 토탈 월급이 4000 이상인 것만 출력 
SELECT job, SUM(sal)
    FROM emp
    GROUP BY job
    HAVING SUM(sal) >= 4000;

-- 출력 예시
--PRESIDENT	5000
--MANAGER	8275
--SALESMAN	5600
--CLERK	4150
--ANALYST	6000

-- 직업과 직업별 토탈 월급 출력하는데 직업에서 SALESMAN은 제외하고 
-- 직업별 토탈 월급이 4000이상인 사람 출력 
SELECT job, SUM(sal)
    FROM emp
    WHERE job != 'SALESMAN'
    GROUP BY job
    HAVING SUM(sal) >= 4000;

-- 출력 예시
--PRESIDENT	5000
--MANAGER	8275
--CLERK	4150
--ANALYST	6000

-- (error)직업과 직업별 토탈 월급 출력하는데 직업에서 SALESMAN은 제외하고 
-- 직업별 토탈 월급이 4000이상인 사람 출력 
SELECT job as 직업, SUM(sal)
    FROM emp
    WHERE job != 'SALESMAN'
    GROUP BY 직업
    HAVING SUM(sal) >= 4000;
-- ORA-00904: "직업": 부적합한 식별자

--실행 순서
-- FROM → WHERE → GROUP BY → HAVING → SELECT  → ORDER BY 