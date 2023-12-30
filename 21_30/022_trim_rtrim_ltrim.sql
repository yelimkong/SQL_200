-- 022 특정 철자 잘라내기 (TRIM, RTRIM, LTRIM)
-- 첫 번째 컬럼은 영어 단어 smith 철자 출력, 
-- 두 번째 컬럼은 영어 단어 smith 에서 s를 잘라서 출력 
-- 세 번째 컬럼은 영어 단어 smith 에서 h를 잘라서 출력 
-- 네 번째 컬럼은 smiths의 양쪽에 s를 잘라서 출력 
SELECT 'smith', LTRIM('smith', 's'), RTRIM('smith', 'h'), TRIM('s' from 'smiths')
    FROM dual;

-- 출력 예시
--smith	mith	smit	mith

-- 새로운 JACK 사원 데이터 삽입
INSERT INTO emp(empno, ename, sal, job, deptno) values(8291, 'JACK   ', 3000, 'SALESMAN', 30);
COMMIT;

-- JACK 사원의 이름과 월급 조회 
SELECT ename, sal
     FROM emp
     WHERE ename = 'JACK';
-- 출력 조회 안 됨 

SELECT ename, sal
     FROM emp
     WHERE RTRIM(ename) = 'JACK';

-- 출력 예시 
--JACK   	3000

-- 새로운 JACK 사원 데이터 삭제
DELETE FROM emp WHERE TRIM(ename) = 'JACK' ; 
COMMIT;
    