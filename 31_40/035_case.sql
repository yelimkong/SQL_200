-- 035 IF문을 SQL로 구현 ② (CASE)
-- 이름, 직업, 월급, 보너스 출력 
-- 보너스는 월급이 3000 이상이면 500 출력
-- 월급이 2000 이상이고 3000 보다 작으면 300 출력
-- 월급이 1000이상이고 2000 보다 작으면 200 출력 
-- 나머지 사원들은 0 출력 
SELECT ename, job, sal, CASE WHEN sal >= 3000 THEN 500
                                        WHEN sal >= 2000 THEN 300
                                        WHEN sal >= 1000 THEN 200
                                        ELSE 0 END AS BONUS 
    FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST');

-- 출력 예시 
--MARTIN	SALESMAN	1250	200
--ALLEN	SALESMAN	1600	200
--TURNER	SALESMAN	1500	200
--WARD	SALESMAN	1250	200
--FORD	ANALYST	3000	500

-- CASE와 DECODE의 차이점 
-- DECODE는 등호(=) 비교만 가능, 
-- CASE는 등호비교와 부등호 (>=, <=, >, <) 둘 다 가능 

-- 이름, 직업, 커미션, 보너스 출력 
-- 보너스는 커미션이 NULL이면 500 출력
-- NULL이 아니면 0을 출력 
SELECT ename, job, comm, CASE WHEN comm is null then 500
                                            ELSE 0 END BONUS
    FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST');

-- 출력 예시
--MARTIN	SALESMAN	1400	0
--ALLEN	SALESMAN	300	0
--TURNER	SALESMAN	0	0
--WARD	SALESMAN	500	0
--FORD	ANALYST		(null) 500

-- 보너스 출력할 때 직업이 'SALESMAN', 'ANALYST' 이면 500 출력 
-- 직업이 'CLECK', 'MANAGER' 이면 400 출력 
-- 나머지 직업은 0을 출력 
SELECT ename, job, CASE WHEN job IN ( 'SALESMAN', 'ANALYST' ) THEN 500 
                                   WHEN job IN ('CLECK', 'MANAGER') THEN 400 
                                   ELSE 0 END BONUS
    FROM emp;
    
-- 출력 예시
--KING	PRESIDENT	0
--BLAKE	MANAGER	400
--CLARK	MANAGER	400
--JONES	MANAGER	400
--MARTIN	SALESMAN	500