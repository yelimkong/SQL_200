-- 048 COLUMN을 ROW로 출력 ② (PIVOT)
-- 부서 번호, 부서 번호별 토탈 월급을 PIVOT문 사용해서 가로로 출력 
SELECT *
    FROM (SELECT deptno, sal FROM emp)
    PIVOT (SUM(sal) for deptno IN (10, 20, 30));
    
-- 출력 예시 
-- 10      20      30 
-- 8750	10875	  9400

SELECT *
    FROM (SELECT job, sal FROM emp)
    PIVOT (SUM(sal) for JOB IN ('ANALYST', 'CLERK', 'MANAGER', 'SALESMAN')) ;

SELECT DISTINCT(job)
    FROM emp;

-- 출력 예시 
-- 'ANALYST', 'CLERK', 'MANAGER', 'SALESMAN'
-- 6000	4150	8275	5600

-- [해설]
-- 출력되는 결과에 필요한 데이터가 있는 컬럼인 직업과 월급을 선택한다.
-- 위에서 필요한 컬럼은 직업과 월급뿐
-- PIVOT문을 사용할 때는 FROM 절에 괄호를 사용해서 특정 컬럼만 선택해야 합니다. 
-- FROM emp 라고 작성하면 에러가 발생 
-- 반드시 괄호 안에 결과에 필요한 컬럼만 선택하는 쿼리문 작성해야 함 

-- PIVOT문을 이용해서 토탈 월급 출력 
-- in 다음에 토탈 월급을 출력할 직업 리스트를 나열
-- 싱글 쿼테이션 마크가 출력되지 않게 하려면 다음과 같이 as 뒤에 해당 직업을
-- 더블 쿼테이션으로 둘러서 작성하게 되면 싱글 쿼테이션 마크 없이 출력이 가능해짐
SELECT *
    FROM (SELECT job, sal FROM emp) 
    PIVOT (SUM(sal) for job IN ('ANALYST' as "ANALYST", 'CLERK' as "CLERK", 'MANAGER' as "MANAGER",
                                        'SALESMAN' as "SALESMAN") ) ;

-- 출력 예시 
-- ANALYST CLERK MANAGER SALESMAN
-- 6000	4150	8275	5600

