-- 015 논리연산자 (AND, OR, NOT)
-- 직업이 ANALYST이고, 월급이 1200 이상인 사원들의 이름, 월급, 직업 조회
SELECT ename, sal, job 
    FROM emp 
    WHERE job = 'ANALYST' AND sal >= 1200 ;

-- 출력 예시
--FORD	3000	ANALYST
--SCOTT	3000	ANALYST
    
-- 둘 중에 하나라도 조건이 FLASE이면 반환되지 않음
SELECT ename, sal, job 
    FROM emp 
    WHERE job = 'ABCDEF' AND sal >= 1200 ;
    
-- TRUE AND TRUE → TRUE
-- TRUE AND FALSE → FALSE
-- TRUE AND NULL → NULL
-- NULL은 알 수 없는 값이기 때문