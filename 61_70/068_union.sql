DELETE FROM emp WHERE deptno = 50;
COMMIT ;

-- 068 집합 연산자로 데이터를 위아래로 연결하기 ②(UNION)
-- 부서 번호와 부서 번호별 토탈 월급을 출력하는데 
-- 맨 아래 행에 토탈 월급 출력

SELECT deptno, SUM(sal)
    FROM emp 
    GROUP BY deptno
UNION
SELECT null AS deptno, SUM(sal)
    FROM emp ;
    
-- 출력 예시
--10	    8750
--30	    9400
--20	    10875
--(null)	29025

-- 위의 예제는 UNION 연산자를 이용하여 두 개의 쿼리를 결과를 위아래로 
-- 이에 붙여 출력하는 쿼리
-- 출력된 결과를 보면 UNION ALL 과는 다르게 부서 번호가 내림차순으로 정렬됨

-- [UNION 연산자가 UNION ALL과 다른 점 ]
-- ① 중복된 데이터를 하나의 고유한 값으로 출력
-- ② 첫 번째 컬럼의 데이터를 기준으로 내림차순으로 정렬하여 출력 

-- C = {1, 2, 3, 4, 5}
-- D = {3, 4, 5, 6, 7}
-- UNION ALL 과는 다르게 C 집합과 D 집합의 중복된 데이터인 3, 4, 5가 한 번만 출력됨
-- 테이블 C와 테이블 D를 생성하여 UNION 합집합을 한 결과 
-- 1. [TABLE C 생성 스크립트]
CREATE TABLE C (COL1 NUMBER(10));
INSERT INTO C VALUES(1);
INSERT INTO C VALUES(2);
INSERT INTO C VALUES(3);
INSERT INTO C VALUES(4);
INSERT INTO C VALUES(5);

-- 2. [TABLE D 생성 스크립트]
CREATE TABLE D (COL1 NUMBER(10));
INSERT INTO D VALUES(3);
INSERT INTO D VALUES(4);
INSERT INTO D VALUES(5);
INSERT INTO D VALUES(6);
INSERT INTO D VALUES(7);

SELECT COL1 FROM C
UNION
SELECT COL1 FROM D;

-- 출력 예시
-- COL1
--1
--2
--3
--4
--5
--6
--7

-- 중복된 데이터가 제거되고 결과 데이터가 내림차순으로 정렬되어 출력

