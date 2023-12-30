-- 037 최소값 출력 (MIN)
-- SALESMAN 인 사원들 중 최소 월급을 출력
SELECT MIN(sal)
    FROM emp
    WHERE job = 'SALESMAN';

-- 출력 예시
-- 1250

-- 직업과 직업별 최소 월급 출력 
-- ORDER BY 절을 사용하여 최소 월급이 높은 것부터 출력
--  ORDER BY 절은 항상 맨 마지막에 작성하고 실행 또한 맨 마지막에 실행
SELECT job, MIN(sal) as 최소값
    FROM emp
    GROUP BY job
    ORDER BY 최소값 DESC;

-- 출력 예시
--PRESIDENT	5000
--ANALYST	3000
--MANAGER	2450
--SALESMAN	1250
--CLERK	800

-- 그룹 함수의 특징은 WHERE절의 조건이 거짓이어도 결과를 출력한다는 것 
SELECT MIN(sal) 
    FROM emp 
    WHERE 1 = 2;

-- 출력 예시
-- (null)
-- WHERE 절에 1=2는 조건이 거짓이지만 실행됨
-- NULL로 출력되었는지 NVL 함수 사용해보면 알 수 있음 
SELECT NVL(MIN(sal), 0)
    FROM emp 
    WHERE 1 = 2;

-- 출력 예시
-- 0 

-- 직업, 직업별 최소 월급 출력 
-- 직업에서 SALESMAN은 제외하고 출력하고 직업별 최소 월급이 높은 것부터 출력 
SELECT job, MIN(sal) 
    FROM emp 
    WHERE job != 'SALESMAN'
    GROUP BY job 
    ORDER BY MIN(sal) DESC;

-- 출력 예시
--PRESIDENT	5000
--ANALYST	3000
--MANAGER	2450
--CLERK	800