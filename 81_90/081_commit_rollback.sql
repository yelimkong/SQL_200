--081 데이터 저장 및 취소하기 (COMMIT, ROLLBACK)
-- 사원 테이블에 사원 테이블에 입력한 데이터가 데이터베이스에 저장되도록 하기 

INSERT INTO emp(empno, ename, sal, deptno)
    VALUES(1122, 'JACK', 3000, 20 );

-- 출력 예시
--1 행 이(가) 삽입되었습니다.

COMMIT ;

-- 출력 예시
-- 커밋 완료.

UPDATE emp 
    SET sal = 4000
    WHERE ename = 'SCOTT';
    
ROLLBACK;

-- 출력 예시
-- 롤백 완료.

-- 전체 테이블 조회 
SELECT table_name FROM user_tables;

-- emp 테이블 생성
--CREATE TABLE emp (
--    empno NUMBER(5) PRIMARY KEY,
--    ename VARCHAR2(50),
--    job VARCHAR2(50),
--    mgr NUMBER(5),
--    hiredate DATE,
--    sal NUMBER(7, 2),
--    comm NUMBER(7, 2),
--    deptno NUMBER(3)
--);


-- COMMIT 명령어는 COMMIT 이전에 수행했던 DML 작업들을 데이터베이스에 영구히 
-- 반영하는 TCL (Transaction Control Language ) 입니다. 

-- ROLLBACK 명령어는 마지막 COMMIT  명령어를 수행한 이후 DML 문을 취소하는 TCL
-- (Transaction Control Language )입니다. 
-- 위의 예제에서 SCOTT의 월급을 4000으로 변경한 UPDATE문이 취소됩니다. 

-- TCL문(Transaction Control Language ) 의 종류는 다음과 같습니다.
--      종류      |       설명 
-- COMMIT     |   모든 변경 사항을 데이터베이스에 반영합니다.
-- ROLLBACK   |   모든 변경 사항을 취소합니다. 
-- SAVEPOINT  |  특정 지점까지의 변경을 취소합니다. 
