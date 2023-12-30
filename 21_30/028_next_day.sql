-- 028 특정 날짜 뒤에 오는 요일 날짜 출력 (NEXT_DAY)
-- 2019년 5월 22일로부터 바로 돌아올 월요일의 날짜 출력 
SELECT '2019/05/22' AS 날짜, NEXT_DAY('2019/05/22', '월요일')
    FROM DUAL;

-- 출력 예시 
-- 2019/05/22	19/05/27
    
-- 오늘 날짜 출력 
SELECT SYSDATE as "오늘 날짜"
    FROM DUAL;
    
-- 출력 예시
-- 23/12/25

-- 오늘부터 앞으로 돌아올 화요일의 날짜 출력 
SELECT NEXT_DAY(SYSDATE, '화요일') AS "다음 날짜"
    FROM DUAL;

-- 출력 예시 
-- 23/12/26

-- 2019년 5월 22일부터 100달 뒤에 돌아오는 화요일의 날짜 출력 
SELECT NEXT_DAY(ADD_MONTHS('2019/05/22', 100), '화요일') AS "다음 날짜"
    FROM DUAL;

-- 출력 예시 
-- 27/09/28

-- 오늘부터 100달 뒤에 돌아오는 월요일의 날짜 출력 
SELECT NEXT_DAY(ADD_MONTHS(SYSDATE, 100), '월요일') AS "다음 날짜"
    FROM DUAL;

-- 출력 예시 
-- 32/04/26