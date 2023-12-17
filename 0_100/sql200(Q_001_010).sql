-- 001 테이블에서 특정 열(COLUMN) 선택하기
SELECT empno, ename, sal
    FROM emp ;
    
-- 002 테이블에서 모든 열(COLUMN)  출력하기
SELECT * 
    FROM emp ;
    
-- 003 컬럼 별칭을 사용하여 출력되는 컬럼명 변경하기 
SELECT empno as 사원번호, ename as 사원이름, sal as "Salary"
    FROM emp ;
    
-- 004 연결 연산자 사용하기 (||)
SELECT ename || sal
    FROM emp ;
    
SELECT ename || '의 월급은 ' || sal || '입니다.' as 월급정보 
    FROM emp ;
    
SELECT ename || '의 직업은 ' || job || '입니다.' as 직업정보
    FROM emp;
    
-- 005 중복된 데이터를 제거해서 출력하기 (DISTINCT)
SELECT DISTINCT job
    FROM emp ;
    
SELECT UNIQUE job 
    FROM emp ;
    
-- 006 데이터를 정렬해서 출력하기 (ORDER BY)
SELECT ename, sal
    FROM emp 
    ORDER BY sal asc ;

-- 월급 오름차순
SELECT ename, sal as 월급 
    FROM emp
    ORDER BY 월급 asc ;

-- 사원번호 오름차순, 월급 내림차순
SELECT ename, deptno, sal
    FROM emp
    ORDER BY deptno asc ; sal desc ;

-- 컬럼 순서로 ORDER BY 사용 가능 
SELECT ename, deptno, sal
    FROM emp 
    ORDER BY 2 asc, 3 desc ;

-- 007 WHERE절 배우기① (숫자 데이터 검색)
-- 월급이 3000인 사람 출력
SELECT ename, sal, job
    FROM emp 
    WHERE sal = 3000 ;

--출력 결과
--FORD	3000	ANALYST
--SCOTT	3000	ANALYST

-- 월급이 3000이상인 사원의 이름과 월급 출력
SELECT ename 이름, sal 월급
    FROM emp 
    WHERE sal >= 3000 ;

--출력결과
--KING	5000
--FORD	3000
--SCOTT	3000

-- 008 WHERE절 배우기 ② (문자와 날짜 검색)
-- 사원이름이 SCOTT 인 사원의 이름, 월급, 직업, 입사날짜, 부서번호 출력
SELECT ename, sal, job, hiredate, deptno 
    FROM emp
    WHERE ename = 'SCOTT' ;

-- 출력 결과    
-- SCOTT	3000	ANALYST	82/12/22	20

SELECT ename, hiredate
    FROM emp 
    WHERE hiredate = '81/11/17' ;
    
-- 출력 결과 
-- KING	81/11/17


-- 현재 접속한 세션의 날짜 형식 조회
SELECT * 
    FROM NLS_SESSION_PARAMETERS
    WHERE PARAMETER = 'NLS_DATE_FORMAT' ;

-- 출력 결과
-- NLS_DATE_FORMAT	RR/MM/DD

-- 세션 날짜 형식 변경 
-- ALTER SESSION SET NLS_DATE_FORMAT = 'YY/MM/DD'

-- 009 산술 연살자 배우기 (*, /, +, -)
--연봉이 36000 이상인 사원들의 이름과 연봉 출력 
SELECT ename, sal * 12 as 연봉 
    FROM emp
    WHERE  sal * 12 >= 36000 ;
    
-- 부서번호가 10번인 사원들의 이름, 월급, 커미션, 월급 + 커미션 출력
SELECT ename, sal, comm, sal + comm 
    FROM emp 
    WHERE deptno = 10 ;

--출력 결과 
--KING	5000	(null)   (null)	
--CLARK	2450	(null)   (null)		
--MILLER	1300	(null)   (null)		

-- NVL 함수 사용 
SELECT sal + NVL(comm, 0) 
    FROM emp 
    WHERE ename = 'KING';

--출력 결과 
-- 5000

--010 비교 연산자 배우기 ③
-- 월급이 1200 이하인 사원들의 이름과 월급, 직업, 부서 번호 출력 
SELECT ename, sal, job, deptno 
    FROM emp 
    WHERE sal <= 1200 ;

-- '같지 않다' 비교 연산자 종류 
-- 1) !- 2) <> 3) ^=





