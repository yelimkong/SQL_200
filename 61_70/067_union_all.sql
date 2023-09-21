-- 067 집합 연산자로 데이터를 위아래로 연결하기 ① (UNION ALL)
-- 부서 번호와 부서 번호별 토탈 월급을 출력 
-- 맨 아래쪽 행에 토탈 월급을 출력 
SELECT deptno, SUM(sal) 
    FROM emp
    GROUP BY deptno
UNION ALL 
SELECT TO_NUMBER(null) AS deptno, SUM(sal)
    FROM emp;

-- 출력 예시
--50	    3000
--10	    8750
--30	    9400
--20	    10875
--(null)	32025

-- UNION ALL 연산자는 위아래의 쿼리 결과를 하나의 결과로 출력하는 집합 
-- 위의 예제는 UNION ALL 집합 연산자를 이용하여 부서 번호와 부서 번호별 토탈 월급을 출력하는
-- 위쪽 쿼리의 결과와 전체 토탈 월급을 출력하는 아래쪽 쿼리의 결과를 하나의 결과로 출력

-- [집합 연산자를 작성할 때 주의사항]
-- ①UNION ALL  위쪽 쿼리와 아래쪽 쿼리 컬럼의 개수가 동일해야 한다.
-- ②UNION ALL 위쪽 쿼리와 아래쪽 쿼리 커럼의 데이터 타입이 동일해야 한다.
-- ③결과로 출력되는 컬럼명은 위쪽 쿼리의 컬럼명으로 출력된다 
-- ④ORDER BY 절을 제일 아래쪽 쿼리에만 작성할 수 있다.

-- TO_NUMBER(null)은 UNION ALL 위쪽 쿼리 DEPTNO의 데이터 유형이 숫자이기 때문에 
-- TO_NUMVER를 사용하여 숫자형으로 동일하게 맞춰 줬다.


--[UNION 연산자가 UNION ALL과 다른 점]
-- ① 중복된 데이터를 하나의 고유한 값으로 출력
-- ② 첫 번째 컬럼의 데이터를 기준으로 내림차순으로 정렬하여 출력

-- UNION ALL은 위쪽 쿼리의 결과와 아래쪽 쿼리의 결과를 그대로 출력하며 
-- 위쪽 쿼리의 결과 데이터와 아래쪽 쿼리의 결과 데이터 중 동일한 데이터가 있어도 
-- 중복을 제거하지 않고 그대로 출력 
-- 예를 들어, A집합과 B집합이 있으면 A 집합과 B집합의 합집합을 출력하는 
-- 집합 연산자는 UNION ALL

-- A = {1, 2, 3, 4, 5}
-- B = {3, 4, 5, 6, 7}
-- A UNION ALL B

-- 테이블 A와 테이블 B를 생성하여 UNION 합집합을 한 결과 
-- 1. [TABLE A 생성 스크립트]
CREATE TABLE A (COL1 NUMBER(10));
INSERT INTO A VALUES(1);
INSERT INTO A VALUES(2);
INSERT INTO A VALUES(3);
INSERT INTO A VALUES(4);
INSERT INTO A VALUES(5);

-- 2. [TABLE B 생성 스크립트]
CREATE TABLE B (COL1 NUMBER(10));
INSERT INTO B VALUES(3);
INSERT INTO B VALUES(4);
INSERT INTO B VALUES(5);
INSERT INTO B VALUES(6);
INSERT INTO B VALUES(7);

SELECT COL1 FROM A
UNION ALL
SELECT COL1 FROM B;

-- 출력 예시
-- COL1
--1
--2
--3
--4
--5
--3
--4
--5
--6
--7