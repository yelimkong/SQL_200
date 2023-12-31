-- 023 반올림해서 출력 (ROUND)
-- 876.567 숫자 출력하는데 소수점 두 번째 자리인 6에서 반올림해서 출력
SELECT '876.567' as 숫자, ROUND(876.567, 1)
    FROM DUAL;

-- 출력 예시
-- 876.567	876.6

-- ROUND(876.567, 1)는 876.567을 출력할 때 소수점 이후 두 번째 자리에서 반올림 
-- ROUND(876.567, 2)는 876.567을 출력할 때 소수점 이후 세 번째 자리에서 반올림 
-- ROUND(876.567, -1)는 876.567을 출력할 때 소수점 이전 일의 자리에서 바로 반올림 
-- ROUND(876.567, -1)는 876.567을 출력할 때 소수점 이전 십의 자리에서 바로 반올림 
-- ROUND(876.567, 0)과  ROUND(876.567)는 876.567을 출력할 때 소수점 이후 첫 번째 자리에서 반올림 
