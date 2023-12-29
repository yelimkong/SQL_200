-- 019 문자에서 특정 철자의 위치 출력(INSTR)
-- 사원 이름 SMITH에서 알파벳 철자 M이 몇 번째 자리에 있는지 출력 
SELECT INSTR('SMITH', 'M')
    FROM DUAL;

-- 출력 결과 
-- 2

-- abcdefg@naver.com 이메일에서 naver.com만 추출하고 싶다면 
-- INSTR과 SUBSTR을 이용하여 추출 가능 
SELECT INSTR('abcdefgh@naver.com', '@')
     FROM DUAL;

-- 출력 결과 
-- 9

SELECT SUBSTR('abcdefgh@naver.com', INSTR('abcdefgh@naver.com', '@') +1 )
    FROM DUAL;

-- 출력 결과 
-- naver.com

-- 오른쪽에 .com 잘라내고 naver만 출력 
SELECT RTRIM (SUBSTR('abcdefgh@naver.com', INSTR('abcdefgh@naver.com', '@') +1 ), '.com')
    FROM DUAL;

-- 출력 결과 
-- naver

