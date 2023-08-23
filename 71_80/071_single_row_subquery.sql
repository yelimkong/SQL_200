--071 서브 쿼리 사용하기 ① (단일행 서브쿼리)
--JONES 보다 더 많은 월급을 받는 사원들의 이름과 월급을 출력
SELECT ename, sal
    FROM emp 
    WHERE sal > (SELECT sal
                        FROM emp 
                        WHERE ename = 'JONES');
                        
-- 출력 예시
--KING	5000
--FORD	3000
--SCOTT	3000 

--[결과]
-- JONES보다 더 많은 월급을 받는 사원들을 검색하려면 
-- 먼저 JONES의 월급이 얼마인지를 알아야 한다
-- 1. JONES의 월급을 검색하는 쿼리
SELECT ename, sal
    FROM emp
    WHERE ename = 'JONES';

-- 출력 예시
--JONES	2975


--2. JONES의 월급인 2975를 가지고 이 보다 높은 사원들의 이름과 월급 출력
SELECT ename, sal
    FROM emp
    WHERE sal > 2975;

-- 출력 예시
--KING	5000
--FORD	3000
--SCOTT	3000

-- 3. 이와 같이 쿼리를 두 번을 수행해야 결과를 볼 수 있다,
-- 그런데 서브쿼리문을 사용하면 다음과 같이 한 번에 결과를 출력할 수 있다.
SELECT ename, sal                                     -- 메인 쿼리
    FROM emp 
    WHERE sal > (SELECT sal                        --  서브 쿼리
                        FROM emp 
                        WHERE ename = 'JONES');
                        
-- 괄호로 감싸는 쿼리문이 서브(sub) 쿼리이다.
-- JONES의 월급을 출력하는 쿼리문을 메인 쿼리 다음에 작성하여 한 번에 수행한다.

-- SCOTT과 같은 월급을 받는 사원들의 이름과 월급을 출력하는 쿼리
SELECT ename, sal
    FROM emp
    WHERE sal = (SELECT sal
                        FROM emp
                        WHERE ename = 'SCOTT');
                        
-- 출력 예시
--FORD	3000
--SCOTT	3000

-- 결과를 보면 SCOTT도 같이 출력되었다.
-- SCOTT이 출력되지 않게 하려면 다음과 같이 메인 쿼리에 조건을 추가하면 된다.

SELECT ename, sal
    FROM emp
    WHERE sal = (SELECT sal
                        FROM emp
                        WHERE ename = 'SCOTT')
    AND ename != 'SCOTT';
    
-- 출력 예시
-- FORD	3000
