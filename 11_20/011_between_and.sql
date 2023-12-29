-- 011 비교연산자② (BETWEEN AND)
-- 월급이 1000에서 3000 사이인 사원들의 이름과 월급 출력 
SELECT ename, sal
    FROM emp 
    WHERE sal BETWEEN 1000 AND 3000;
    
-- 월급이 1000과 3000이 포함, 위 SQL과 동일
SELECT ename, sal 
    FROM emp 
    WHERE (sal >= 1000 AND sal <= 3000) ;
    
-- 월급이 1000에서 3000 사이가 아닌 사원들의 이름과 월급 출력 
SELECT ename, sal 
    FROM emp 
    WHERE sal NOT BETWEEN 1000 AND 3000;
    
-- 월급이 1000과 3000이 포함되지 않음, 위 SQL과 동일
SELECT ename, sal
    FROM emp
    WHERE (sal < 1000 OR sal > 3000) ;
    
-- 1982년에 입사한 사원들의 이름과 입사일 조회 
SELECT ename, hiredate 
    FROM emp 
    WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31';
    