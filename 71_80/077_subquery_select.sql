--077  서브 쿼리 사용하기 ⑦ (SELECT 절의 서브 쿼리)
-- 직업이 SALESMAN인 사원들의 이름과 월급을 출력하는데, 
-- 직업이 SALESMAN인 사원들의 최대 월급과 최소 월급 출력

SELECT ename, sal, (SELECT MAX(sal) FROM emp WHERE job = 'SALESMAN' ) as "최대 월급",
                          (SELECT MIN(sal) FROM emp WHERE job = 'SALESMAN' ) as "최소 월급"
    FROM emp 
    WHERE job = 'SALESMAN';

-- 출력 예시
-- MARTIN	1250	1600	1250
--ALLEN	    1600	1600	1250
--TURNER	1500	1600	1250
--WARD	    1250	1600	1250


--[ERROR] ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
-- SELECT절에 서브 쿼리를 사용하여 직업이 SALESMAN인 사원의 최대 월급과 최소 월급을 각각 출력하고 있다.
-- SELECT 절에 서브 쿼리를 사용하지 않고 출력하면 다음과 같은 에러가 발생한다. 
SELECT ename, sal, MAX(sal), MIN(sal)
    FROM emp 
    WHERE job = 'SALESMAN';
-- 출력 예시
--[ERROR] ORA-00937: 단일 그룹의 그룹 함수가 아닙니다

-- SELECT절의 서브 쿼리는 서브쿼리가 SELECT 절로 확장되었다고 해서 스칼라(scalar) 서브 쿼리로 불립니다. 
-- 스칼라 서브 쿼리는 출력되는 행 수만큼 반복되어 실행합니다. 