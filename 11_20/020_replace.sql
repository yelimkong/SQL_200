-- 020 특정 철자를 다른 철자로 변경 (REPLACE)
-- 이름과 월급 출력, 월급 출력 시 숫자 0을 별표(*)로 출력
SELECT ename, REPLACE(sal, 0, '*')
    FROM emp;

-- 출력 예시 
--KING	5***
--BLAKE	285*
--CLARK	245*
--JONES	2975
--MARTIN	125*

-- 이름과 월급 출력, 월급 출력 시 숫자 0~3을 별표(*)로 출력
SELECT ename, REGEXP_REPLACE(sal, '[0-3]', '*') SALARY
    FROM emp;

-- 출력 예시
--KING	5***
--BLAKE	*85*
--CLARK	*45*
--JONES	*975
--MARTIN	**5*

-- 이름의 두 번째 자리의 한글을 *로 출력 
SELECT REPLACE(ename, SUBSTR(ename, 2, 1), '*') 전광판_이름
    FROM emp ;

-- 출력 예시
--K*NG
--B*AKE
--C*ARK
--J*NES
--M*RTIN
