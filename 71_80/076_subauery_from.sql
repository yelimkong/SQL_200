--076 서브 쿼리 사용하기 ⑥ (FROM 절의 서브 쿼리)
-- 이름과 월급과 순위를 출력하는데 순위가 1위인 사원만 출력 
SELECT v.ename, v.sal, v.순위
    FROM (SELECT ename, sal, rank() over (order by sal desc) 순위
                FROM emp) v
    WHERE v.순위 = 1;

-- 출력 예시
-- KING	5000	1

-- 위와 같이 FROM절의 서브 쿼리를 in line view라고 합니다. 
-- FROM 절에 이름과 월금, 월급여 높은 순서로 순위를 출력하는 쿼리를 서브 쿼리로 사용했습니다. 
-- 서브 쿼리의 별칭을 v로 지정했습니다. 
-- 서브 쿼리를 사용하지 않고 다음과 같이 SQL을 작성한다면 에러가 발생합니다.
-- [ERROR] ORA-30483: 윈도우 함수를 여기에 사용할 수 없습니다
SELECT ename, sal, rank() over (order by sal desc) 순위 
    FROM emp 
    WHERE rank() over (order by sal desc) = 1;

-- WHERE절에는 분석 함수를 사용할 수 없습니다. 
-- 그래서 FROM 절에 서브 쿼리문을 사용하여 서브 쿼리문이 먼저 실행되게 하고 
-- 출력된 결과 데이터를 하나의 집합으로 만듭니다. 

-- FROM 절에서 만든 결과 집합은 사원 테이블의 모든 이름과 월급과 월급에 대한 순위입니다. 
-- 이 중에서 순위가 1위인 사원의 데이터만 골라냅니다. 