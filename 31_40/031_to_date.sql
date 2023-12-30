-- 031 날짜형으로 데이터 유형 변환하기 (TO_DATE)
SELECT ename, hiredate 
    FROM emp 
    WHERE hiredate = TO_DATE('81/11/17', 'RR/MM/DD');

-- 출력 예시 
-- KING	81/11/17

-- 현재 접속한 세션의 날짜 형식 확인
SELECT * 
    FROM NLS_SESSION_PARAMETERS
    WHERE parameter = 'NLS_DATE_FORMAT' ;
    
-- 출력 예시 
-- NLS_DATE_FORMAT	RR/MM/DD


SELECT ename, hiredate 
    FROM emp 
    WHERE hiredate = '81/11/17';

-- 출력 예시 
-- KING	81/11/17

-- 날짜 형식 변경  -> 일/월/년
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/RR';

SELECT ename, hiredate
    FROM emp
    WHERE hiredate = '17/11/81';

-- 출력 예시
-- KING	17/11/81

-- 날짜 형식 변경  -> 년/월/일
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';