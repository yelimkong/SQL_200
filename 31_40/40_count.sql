-- 040 건수 출력 (COUNT)
--  사원 테이블 전체 사원수 출력 
SELECT COUNT(empno)
    FROM emp;

-- 출력 예시
-- 14

SELECT COUNT(*)
    FROM emp;
    
-- 출력 예시
-- 14

-- COUNT(empno)는 EMP만 카운트하고, COUNT(*)는 전체 행을 하나씩 카운트 함
-- 커미션을 카운트하면 4가 출력 된다.
-- 커미션 카운트 
SELECT COUNT(comm)
    FROM emp;

-- 출력 예시
-- 4
-- 커미션이 NULL이 아닌 사원들 4명만 카운트하고 결과 출력 
-- 그룹함수 COUNT는 NULL값을 COUNT하지 않음
-- 평균값을 출력할 때는 특히 NULL값을 더 고려해야 함 
