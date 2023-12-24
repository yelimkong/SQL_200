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
    
------------------------------------------------------------------------------------
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
    
------------------------------------------------------------------------------------
-- 013 비교연산자 ④ (IS NULL)
-- 커미션이 NULL인 사원들의 이름과 커미션 조회 
SELECT ename, comm
    FROM emp
    WHERE comm IS NULL;
    
------------------------------------------------------------------------------------
-- 014 비교연산자 ⑤ (IN)
-- 직업이 SALESMAN, ANALYST, MANAGER인 사원들의 이름, 월급, 직업 조회 
SELECT ename, sal, job 
    FROM emp 
    WHERE job IN ('SALESMAN', 'ANALYST', 'MANAGER');

-- 위와 동일한 결과 출력하는 SQL
SELECT ename, sal, job 
    FROM emp 
    WHERE (job = 'SALESMAN' or job = 'ANALYST' or job = 'MANAGER');

-- 직업이 SALESMAN, ANALYST, MANAGER이 아닌 사원들의 이름, 월급, 직업 조회 
SELECT ename, sal, job 
    FROM emp 
    WHERE job NOT IN ('SALESMAN', 'ANALYST', 'MANAGER');

-- 위와 동일한 결과 출력하는 SQL
SELECT ename, sal, job 
    FROM emp 
    WHERE (job != 'SALESMAN' or job != 'ANALYST' or job != 'MANAGER');
     
------------------------------------------------------------------------------------
-- 015 논리연산자 (AND, OR, NOT)
-- 직업이 ANALYST이고, 월급이 1200 이상인 사원들의 이름, 월급, 직업 조회
SELECT ename, sal, job 
    FROM emp 
    WHERE job = 'ANALYST' AND sal >= 1200 ;
    
-- 둘 중에 하나라도 조건이 FLASE이면 반환되지 않음
SELECT ename, sal, job 
    FROM emp 
    WHERE job = 'ABCDEF' AND sal >= 1200 ;
      
------------------------------------------------------------------------------------
-- 016 대소문자 변환 함수 (UPPER, LOWER, INITCAP)
-- 첫 번째 컬럼 : 이름 대문자, 두 번째 컬럼 : 이름 소문자, 
-- 세 번째 컬럼 : 이름의 첫 번째 철자 대문자 나머지는 소문자 
SELECT UPPER(ename), LOWER(ename), INITCAP(ename)
    FROM emp ;

-- 출력 결과 예시 
--KING	king	King
--BLAKE	blake	Blake
--CLARK	clark	Clark
--JONES	jones	Jones
--MARTIN	martin	Martin

-- 이름이 scott인 사원의 이름과 월급 조회 
SELECT ename, sal
    FROM emp 
    WHERE LOWER(ename) = 'scott';

------------------------------------------------------------------------------------
-- 017 문자에서 특정 철자 추출
-- 영어 단어 SMITH에서 SMI만 잘라내서 출력 
SELECT SUBSTR('SMITH', 1, 3)
    FROM DUAL;
    
------------------------------------------------------------------------------------
-- 018 문자열의 길이 출력 (LENGTH)
SELECT ename, LENGTH(ename)
    FROM emp;

-- 출력 결과 예시
--KING	4
--BLAKE	5
--CLARK	5
--JONES	5
--MARTIN	6

-- LENGTH(ename)는 이름 철자의 개수 출력
SELECT LENGTH('가나다라마')
    FROM DUAL;

-- 출력 결과 
-- 5 

-- LENGTHB 는 바이트의 길이 반환 
SELECT LENGTHB('가나다라마')
    FROM DUAL;

-- 출력 결과 
-- 15

------------------------------------------------------------------------------------
-- 019 문자에서 특정 철자의 위치 출력(INSTR)
-- 사원 이름 SMITH에서 알파벳 철자 M이 몇 번째 자리에 있는지 출력 
SELECT INSTR('SMITH', 'M')
    FROM DUAL;

-- 출력 결과 
-- 2

-- abcdefg@naver.com 이메일에서 naver.com만 추출하고 싶다면 
-- INSTR과 SUBSTR을 이용하여 추출 가능 
SELECT INSTR('abcdefgh@naver.com', '@')
     FROM DUAL;

-- 출력 결과 
-- 9

SELECT SUBSTR('abcdefgh@naver.com', INSTR('abcdefgh@naver.com', '@') +1 )
    FROM DUAL;


-- 오른쪽에 .com 잘라내고 naver만 출력 
SELECT RTRIM (SUBSTR('abcdefgh@naver.com', INSTR('abcdefgh@naver.com', '@') +1 ), '.com')
    FROM DUAL;

------------------------------------------------------------------------------------
-- 020 특정 철자를 다른 철자로 변경 (REPLACE)
-- 이름과 월급 출력, 월급 출력 시 숫자 0을 별표(*)로 출력
SELECT ename, REPLACE(sal, 0, '*')
    FROM emp;

-- 출력 예시 
--KING	5***
--BLAKE	285*
--CLARK	245*
--JONES	2975
--MARTIN	125*

-- 이름과 월급 출력, 월급 출력 시 숫자 0~3을 별표(*)로 출력
SELECT ename, REGEXP_REPLACE(sal, '[0-3]', '*') SALARY
    FROM emp;

-- 출력 예시
--KING	5***
--BLAKE	*85*
--CLARK	*45*
--JONES	*975
--MARTIN	**5*

-- 이름의 두 번째 자리의 한글을 *로 출력 
SELECT REPLACE(ename, SUBSTR(ename, 2, 1), '*') 전광판_이름
    FROM emp ;

-- 출력 예시
--K*NG
--B*AKE
--C*ARK
--J*NES
--M*RTIN

    