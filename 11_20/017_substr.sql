-- 017 문자에서 특정 철자 추출
-- 영어 단어 SMITH에서 SMI만 잘라내서 출력 
SELECT SUBSTR('SMITH', 1, 3)
    FROM DUAL;

-- 출력 예시
-- SMI

-- [결과 해석]
-- SUBSTR 함수 :  문자에서 특정 위치의 문자열 추출 
-- SUBSTR('SMITH', 1, 3)
-- 1은 추출할 철자의 위치 번호 → S
-- 3은 시작 위치로부터 몇 개의 철자를 추출할지 정하는 숫자 : SMI

