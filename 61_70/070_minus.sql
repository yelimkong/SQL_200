
-- 070 집합 연산자로 데이터의 차이를 출력 (MINUS)
-- 부서 번호 10번, 20번을 출력하는 쿼리의 결과에서 
-- 부서 번호 20번, 30번을 출력하는 쿼리의 결과 차이 
SELECT ename, sal, job, deptno
    FROM emp
    WHERE deptno  IN (10, 20)
MINUS
SELECT ename, sal, job, deptno
    FROM emp
    WHERE deptno IN (20, 30);

-- 출력 예시
--KING	5000	PRESIDENT	10
--CLARK	2450	MANAGER	10
--MILLER	1300	CLERK	    10

-- MINUS 연산자를 이용하여 MINUS 연산자 위쪽 쿼리이 결과 데이터에서
-- MINUS 아래쪽 쿼리의 결과 데이터의 차이를 출력하는 쿼리

-- 테이블 G, H를 생성하여 MINUS 차집합을 한 결과
-- G = {1, 2, 3, 4, 5}
-- H = {3, 4, 5, 6, 7}
-- 1. [TABLE G 생성 스크립트]
CREATE TABLE G (COL1 NUMBER(10));
INSERT INTO G VALUES(1);
INSERT INTO G VALUES(2);
INSERT INTO G VALUES(3);
INSERT INTO G VALUES(4);
INSERT INTO G VALUES(5);

-- 2. [TABLE H 생성 스크립트]
CREATE TABLE H (COL1 NUMBER(10));
INSERT INTO H VALUES(3);
INSERT INTO H VALUES(4);
INSERT INTO H VALUES(5);
INSERT INTO H VALUES(6);
INSERT INTO H VALUES(7);

SELECT COL1 FROM G
MINUS
SELECT COL1 FROM H;
 
-- 출력 예시
--COL1
--1
--2


-- MINUS 연산자도 결과 데이터를 내림차순으로 정렬해서 출력
-- 집합 연산자에 결과 데이터의 정렬 유무와 중복 제거 유무 정리
-- 합집합의 결과를 출력할 경우 굳이 데이터를 정렬할 필요가 없고
-- 중복을 제거해서 출력할 필요가 없다면 UNION ALL을 사용하는 것이 
-- 검색 성능을 더 높일 수 있다.

--집합 연산자    | 결과 데이터 정렬 | 중복 제거
-- UNION ALL   |            X          |       X   
-- UNION         |           O          |       O
-- INTERSECT    |           O           |      O
-- MINUS         |           O           |      O
-- O :수행함 | X : 수행 안 함
