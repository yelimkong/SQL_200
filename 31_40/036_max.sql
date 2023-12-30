-- 036 최대값 출력 (MAX)
-- 사원 테이블에서 최대 월급을 출력 
SELECT MAX(sal)
    FROM emp;

-- 출력 예시
-- 5000

-- 직업이 SALESMAN인 사원 중 최대 월급 출력 
SELECT MAX(sal)
    FROM emp 
    WHERE job = 'SALESMAN';
    
-- 출력 예시
-- 1600

-- (error)직업과 직업이 SALESMAN인 사원 중 최대 월급 출력 
SELECT job, MAX(sal)
    FROM emp 
    WHERE job = 'SALESMAN';
-- ORA-00937: 단일 그룹의 그룹 함수가 아닙니다    
-- 에러 발생 이유 : job 커럼의 값은 여러 개의 행이 출력되려고 하는데 
-- MAX(sal) 값은 하나의 값은 하나가 출력되려 하기 때문에 에러가 발생
-- GROUP BY job으로 직업을 그룹핑하면 결과가 잘 출력됨

-- (error)이름과 직업이 SALESMAN인 사원 중 최대 월급 출력 
SELECT job, MAX(sal)
    FROM emp 
    WHERE job = 'SALESMAN'
    GROUP BY job;

-- 출력 예시
-- SALESMAN	1600

-- 부서 번호와 부서 번호별 최대 월급 출력
SELECT deptno, MAX(deptno)
    FROM emp
    GROUP BY deptno;
    
-- 출력 예시
-- 10	10
-- 30	30
-- 20	20