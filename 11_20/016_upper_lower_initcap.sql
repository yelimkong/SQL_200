-- 016 대소문자 변환 함수 (UPPER, LOWER, INITCAP)
-- 첫 번째 컬럼 : 이름 대문자, 두 번째 컬럼 : 이름 소문자, 
-- 세 번째 컬럼 : 이름의 첫 번째 철자 대문자 나머지는 소문자 
SELECT UPPER(ename), LOWER(ename), INITCAP(ename)
    FROM emp ;

-- 출력 결과 예시 
--KING	king	King
--BLAKE	blake	Blake
--CLARK	clark	Clark
--JONES	jones	Jones
--MARTIN	martin	Martin

-- 이름이 scott인 사원의 이름과 월급 조회 
SELECT ename, sal
    FROM emp 
    WHERE LOWER(ename) = 'scott';

-- 출력 예시
-- SCOTT	 3000
-- LOWER(ename) : 대문자였던 사원 이름을 소문자로 변환 

