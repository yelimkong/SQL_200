-- 027 개월 수 더한 날짜 출력  (ADD_MONTHS)
-- 2019년 5월 1일로부터 100달 뒤의 날짜 구하기 ① ADD_MONTHS
SELECT ADD_MONTHS(TO_DATE('2019-05-01', 'RRRR-MM-DD'), 100)
    FROM DUAL;

-- 출력 예시
-- 27/09/01

-- 2019년 5월 1일로부터 100일 뒤의 날짜 구하기 
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + 100
    FROM DUAL;

-- 출력 예시
-- 19/08/09

-- 2019년 5월 1일로부터 100달 뒤의 날짜 구하기 ② INTERVAL 함수
-- INTERVAL 함수는 좀더 섬세하게 날짜 산술 연산 구현 가능 
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + INTERVAL '100' MONTH
    FROM DUAL;

-- 출력 예시
-- 27/09/01

-- 2019년 5월 1일부터 1년 3개월 후의 날짜 출력 
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + INTERVAL'1-3' YEAR(1) TO MONTH
    FROM DUAL;

-- 출력 예시
-- 20/08/01

-- 2019년 5월 1일부터 3년 후의 날짜 출력 
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + INTERVAL '3' YEAR
    FROM DUAL;

-- 출력 예시 
-- 22/05/01

-- 2019년 5월 1일부터 3년 5개월 후의 날짜 출력
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + TO_YMINTERVAL('03-05') AS 날짜
    FROM DUAL;

-- 출력 예시 
-- 22/10/01