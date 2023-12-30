-- 029 특정 날짜가 있는 달의 마지막 날짜 출력 (LAST_DAY)
-- 2019년 5월 22일 해당 달의 마지막 날짜 출력 
SELECT '2019/05/22' AS "날짜", LAST_DAY('2019/05/22') AS "마지막 날짜"
    FROM DUAL;

-- 출력 예시 
-- 2019/05/22	19/05/31

-- 오늘부터 이번달 말일까지 총 며칠 남았는지 출력 
SELECT LAST_DAY(SYSDATE) - SYSDATE AS "남은 날짜"
    FROM DUAL;
    
--  출력 예시 
-- 6
-- 수행하는 오늘 날짜가 다르므로 결과값이 결과 값이 다를 수 있다

-- 이름이 KING인 사원의 이름, 입사일, 입사한 달의 마지막 날짜 출력 
SELECT ename, hiredate, LAST_DAY(hiredate)
    FROM emp
    WHERE ename = 'KING';
    
-- 출력 예시 
-- KING	81/11/17	81/11/30