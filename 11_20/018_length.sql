-- 018 문자열의 길이 출력 (LENGTH)
SELECT ename, LENGTH(ename)
    FROM emp;

-- 출력 결과 예시
--KING	4
--BLAKE	5
--CLARK	5
--JONES	5
--MARTIN	6

-- LENGTH(ename)는 이름 철자의 개수 출력
SELECT LENGTH('가나다라마')
    FROM DUAL;

-- 출력 결과 
-- 5 

-- LENGTHB 는 바이트의 길이 반환 
SELECT LENGTHB('가나다라마')
    FROM DUAL;

-- 출력 결과 
-- 15
