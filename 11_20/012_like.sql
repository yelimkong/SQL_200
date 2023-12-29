-- 012 비교연산자 ③ (LIKE)
-- 이름에 첫 글자가 S로 시작하는 사원들의 이름과 월급 조회 
SELECT ename, sal
    FROM emp 
    WHERE ename LIKE 'S%';
    
-- 이름의 두 번째 철자가 M인 사원의 이름 조회 
SELECT ename
    FROM emp 
    WHERE ename LIKE '_M%';
    
-- 이름의 끝 글자가 T로 끝나는 사원 이름 조회 
SELECT ename
    FROM emp 
    WHERE ename LIKE '%T';
    
-- 이름에 A가 포함되는 사원의 이름을 조회 
SELECT ename
    FROM emp 
    WHERE ename LIKE '%A%';