--075 서브 쿼리 사용하기 ⑤ (HAVING 절의 서브 쿼리) 
-- 직업과 직업별 토탈 월급을 출력하는데, 직업이 SALESMAN인 사원들의 토탈 월급보다 더 큰 값들만 출력 
SELECT job, sum(sal)
    FROM emp 
    GROUP BY job 
    HAVING sum(sal) > (SELECT sum(sal)
                                FROM emp
                                WHERE job = 'SALESMAN');

-- 출력 예시
--MANAGER	8275
--ANALYST   	6000

-- 직업과 직업별 토탈 월급을 출력하는 메인 쿼리문입니다.
-- 그룹 함수로 검색 조건을 작성할 때는 WHERE 절을 사용할 수 없어 HAVING 절을 사용했습니다, 
-- HAVING 절이 아닌 WHERE 절을 사용하게 되면 다음과 같이 에러가 발생합니다. 
SLEECT job, sum(sal)
    FROM emp 
    WHERE sum(sal) > (SELECT sum(sal)
                                FROM emp 
                                WHERE job = 'SALESMAN')
    GROUP BY job;

-- 그룹 함수를 이용한 데이터 검색은 WHERER 절이 아닌 HAVING 절에 작성해야 합니다. 
-- SELECT 문에서 서브 쿼리문을 사용할 수 있는 절은 다음과 같습니다.
---------------------------------------------------------------------------------------------
-- SELECT문의 6가지 절   |   서브 쿼리 사용 여부   |  서브 쿼리 이름
-- SELECT                     |   가능                       |  스칼라(Scalar) 서브 쿼리 
-- FROM                      |    가능                      |   IN LINE VIEW
-- WHERE                     |    가능                      |  서브 쿼리
-- GROUP BY                |    불가능                    |   
-- HAVING                   |    가능                       |  서브 쿼리
-- ORDER BY                |     가능                      |   스칼라(Scaler) 서브 쿼리
---------------------------------------------------------------------------------------------

-- SELECT문 6가지 절 중에서 GROUP BY 절만 빼고 전부 서브 쿼리를 사용할 수 있습니다.

