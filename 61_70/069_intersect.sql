-- 069 집합 연산자로 데이터의 교집합을 출력하기 (INTERSECT)
-- 부서 번호 10번, 20번인 사원들을 출력하는 쿼리의 결과와 
-- 부서 번호 20번, 30번을 출력하는 쿼리 결과의 교집합을 출력
SELECT ename, sal, job, deptno
    FROM emp 
    WHERE deptno IN (10, 20)
INTERSECT
SELECT ename, sal, job, deptno
    FROM emp 
    WHERE deptno IN (20, 30);

-- 출력 예시
--JONES   	2975	MANAGER	20
--FORD	    3000	ANALYST	    20
--SMITH   	800	CLERK	    20
--SCOTT	    3000	ANALYST	    20
--ADAMS	1100	CLERK	    20

-- 위의 예제는 INTERSECT 위쪽 쿼리인 부서 번호 10번, 20번인 사원들에 대한 
-- 데이터와 INTERSECT 아래쪽 쿼리의 부서 번호 20번과 30번에 대한 데이터 간의 교집합인 
-- 20 번 데이터를 출력하는 쿼리


-- 테이블 E와 테이블 F를 생성하여 INTERSECT 교집합을 한 결과
-- E = {1, 2, 3, 4, 5}
-- F = {3, 4, 5, 6, 7}
-- 1. [TABLE E 생성 스크립트]
CREATE TABLE E (COL1 NUMBER(10));
INSERT INTO E VALUES(1);
INSERT INTO E VALUES(2);
INSERT INTO E VALUES(3);
INSERT INTO E VALUES(4);
INSERT INTO E VALUES(5);

-- 2. [TABLE F 생성 스크립트]
CREATE TABLE F (COL1 NUMBER(10));
INSERT INTO F VALUES(3);
INSERT INTO F VALUES(4);
INSERT INTO F VALUES(5);
INSERT INTO F VALUES(6);
INSERT INTO F VALUES(7);

SELECT COL1 FROM E
INTERSECT
SELECT COL1 FROM F;
 
-- 출력 예시
--COL1
--3
--4
--5

