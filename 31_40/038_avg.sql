-- 038 평균값 출력 (AVG)
-- 사원 테이블의 평균 커미션 출력 
-- 그룹 함수는 NULL값을 무시함
SELECT  AVG(comm) 
    FROM emp;

-- 출력 예시
-- 550

SELECT comm
    FROM emp;

-- 출력 예시
--(null)
--(null)
--(null)
--(null)
--1400
--300
--0
--(null)
--500
--(null)
--(null)
--(null)
--(null)
--(null)

--NULL 값이 10개이고, 
--NULL 이 아닌 값이 4개 있음 

SELECT ROUND(AVG(NVL(comm, 0)))
    FROM emp;
    
-- 출력 예시
-- 157
-- 157로 출력되는 이유 : 커미션을 다 더한 후에 14로 나누었기 때문에 