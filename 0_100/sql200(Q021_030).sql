-- 031 날짜형으로 데이터 유형 변환하기 (TO_DATE)
SELECT ename, hiredate 
    FROM emp 
    WHERE hiredate = TO_DATE('81/11/17', 'RR/MM/DD');

-- 출력 예시 
-- KING	81/11/17

-- 현재 접속한 세션의 날짜 형식 확인
SELECT * 
    FROM NLS_SESSION_PARAMETERS
    WHERE parameter = 'NLS_DATE_FORMAT' ;
    
-- 출력 예시 
-- NLS_DATE_FORMAT	RR/MM/DD


SELECT ename, hiredate 
    FROM emp 
    WHERE hiredate = '81/11/17';

-- 출력 예시 
-- KING	81/11/17

-- 날짜 형식 변경  -> 일/월/년
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/RR';

SELECT ename, hiredate
    FROM emp
    WHERE hiredate = '17/11/81';

-- 출력 예시
-- KING	17/11/81

-- 날짜 형식 변경  -> 년/월/일
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

------------------------------------------------------------------------

-- 032 암시적 형 변환
SELECT ename, sal
    FROM emp 
    WHERE sal = '3000';

-- 출력 예시 
--FORD	3000
--SCOTT	3000

--sal은 숫자형 데이터인데 '3000'을 문자형으로 비교하고 있음 

-- sal을 일부러 문자형으로 만들어 생성 
CREATE TABLE EMP32
(ENAME VARCHAR2(10), 
SAL VARCHAR2(10));

INSERT INTO EMP32 VALUES('SCOTT', '3000');
INSERT INTO EMP32 VALUES('SMITH', '1200');
COMMIT;

-- 문자형 = 문자형
SELECT ename, sal 
    FROM emp32
    WHERE sal = '3000';

--출력 예시 
--SCOTT	3000

-- 문자형 = 숫자형
SELECT ename, sal 
    FROM emp32
    WHERE sal = 3000;
    
--출력 예시 
--SCOTT	3000

SELECT ename, sal
    FROM emp32
    WHERE TO_NUMBER(SAL) = 3000;

--출력 예시 
--SCOTT	3000

SET AUTOT ON 

SELECT ename, sal 
    FROM emp32
    WHERE sal = 3000;

--자동 추적 사용
--실행 계획과 명령문 통계를 표시합니다.
-->>Query Run In:
--
--PLAN_TABLE_OUTPUT                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SQL_ID  4q3hu9pkhyzth, child number 0
---------------------------------------
--SELECT ename, sal      FROM emp32     WHERE sal = 3000
-- 
--Plan hash value: 4161066290
-- 
----------------------------------------------
--| Id  | Operation         | Name  | E-Rows |
----------------------------------------------
--|   0 | SELECT STATEMENT  |       |        |
--|*  1 |  TABLE ACCESS FULL| EMP32 |      1 |
--
--PLAN_TABLE_OUTPUT                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------
-- 
--Predicate Information (identified by operation id):
-----------------------------------------------------
-- 
--   1 - filter(TO_NUMBER("SAL")=3000)
 
-- 오라클이 암시적으로 문자형을 숫자형으로 형변환함

------------------------------------------------------------------------

-- 033 NULL값 대신 다른 데이터 출력 (NVL, NVL2)
-- 이름과 커미션 출력, 커미션이 NULL 인 사원들은 0으로 출력 
SELECT ename, NVL(comm, 0)
    FROM emp ; 

-- 출력 예시
--KING	0
--BLAKE	0
--CLARK	0
--JONES	0
--MARTIN	1400

-- 이름, 월급, 월급 + 커미션 조회 
-- NULL + 100 = NULL
SELECT ename, sal, comm, sal + comm
    FROM emp ;

-- 출력 예시 
--KING	    5000	(null) (null)
--BLAKE	    2850	(null) (null)
--CLARK	    2450	(null) (null)
--JONES  	2975	(null) (null)
--MARTIN	1250	1400  2650

-- NULL은 알 수 없는 값이므로 NULL을 0으로 치환하여 월급 +커미션 계산
SELECT ename, sal, NVL(comm, 0), sal+NVL(comm, 0)
    FROM emp;

--출력 예시
--KING	5000	0	5000
--BLAKE	2850	0	2850
--CLARK	2450	0	2450
--JONES	2975	0	2975
--MARTIN	1250	1400	2650

-- NVL2 사용하여 커미션이 NULL이 아닌 사원은 sal + comm, 
-- 커미션이 NULL인 사원들은 sal 출력 
SELECT ename, sal, comm, NVL2(comm, sal + comm, sal)
    FROM emp;

--출력 예시
--KING	5000		5000
--BLAKE	2850		2850
--CLARK	2450		2450
--JONES	2975		2975
--MARTIN	1250	1400	2650

------------------------------------------------------------------------

-- 034 IF문을 SQL로 구현 ① (DECODE)
-- 부서번호가 10번이면 300
-- 부서번호가 20번이면 400
-- 부서번호가 10번, 20번이 아니면 0으로 출력
SELECT ename, deptno, DECODE(deptno, 10, 300, 20, 400, 0) as 보너스
    FROM emp;

--출력 예시
--KING	10	300
--BLAKE	30	0
--CLARK	10	300
--JONES	20	400
--MARTIN	30	0

-- IF문 / 설명 
-- IF DEPTNO = 10 THEN 300 / 부서번호가 10번이면 300번 출력 
-- ELSE IF DEPTNO = 20 THEN 400 / 부서번호가 20번이면 400번 출력
-- ELSE 0 / 위의 조건에 다 해당되지 않는다면 0 출력 

-- 사원번호와 사원번호가 짝수인지 홀수인지 출력
SELECT empno, MOD(empno, 2), DECODE(MOD(empno, 2), 0, '짝수', 1, '홀수') as 보너스
    FROM emp;

--출력 예시
--7369	1	홀수
--7499	1	홀수
--7521	1	홀수
--7566	0	짝수
--7654	0	짝수

-- IF문 / 설명 
--IF MOD(empno, 2), 0 THEN '짝수' / MOD(empno, 2)가 0이면 '짝수' 출력 
--ELSE IF MOD(empno, 2), 1 THEN '홀수' / MOD(empno, 2)가 1이면 '홀수' 출력
--ELSE 0 / 위에 조건에 다 해당되지 않는다면 0 출력

-- 이름과 직업과 보너스출력, 
-- 직업이 SALESMAN이면 보너스 5000을 출력, 나머지는 보너스 2000 출력 
SELECT ename, job, DECODE(job, 'SALESMAN', 5000, 2000) as 보너스 
    FROM emp;

--출력 예시
--KING	PRESIDENT	2000
--BLAKE	MANAGER	2000
--CLARK	MANAGER	2000
--JONES	MANAGER	2000
--MARTIN	SALESMAN	5000

-- IF문 / 설명 
--IF job, 'SALESMAN' THEN 5000 / 직업이 SALESMAN이면 5000 출력
--ELSE 2000 / 그렇지 않다면 2000 출력

------------------------------------------------------------------------

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

------------------------------------------------------------------------

-- 036 최대값 출력 (MAX)
-- 사원 테이블에서 최대 월급을 출력 
SELECT MAX(sal)
    FROM emp;

-- 출력 예시
-- 5000

-- 직업이 SALESMAN인 사원 중 최대 월급 출력 
SELECT MAX(sal)
    FROM emp 
    WHERE job = 'SALESMAN';
    
-- 출력 예시
-- 1600

-- (error)직업과 직업이 SALESMAN인 사원 중 최대 월급 출력 
SELECT job, MAX(sal)
    FROM emp 
    WHERE job = 'SALESMAN';
-- ORA-00937: 단일 그룹의 그룹 함수가 아닙니다    
-- 에러 발생 이유 : job 커럼의 값은 여러 개의 행이 출력되려고 하는데 
-- MAX(sal) 값은 하나의 값은 하나가 출력되려 하기 때문에 에러가 발생
-- GROUP BY job으로 직업을 그룹핑하면 결과가 잘 출력됨

-- (error)이름과 직업이 SALESMAN인 사원 중 최대 월급 출력 
SELECT job, MAX(sal)
    FROM emp 
    WHERE job = 'SALESMAN'
    GROUP BY job;

-- 출력 예시
-- SALESMAN	1600

-- 부서 번호와 부서 번호별 최대 월급 출력
SELECT deptno, MAX(deptno)
    FROM emp
    GROUP BY deptno;
    
-- 출력 예시
-- 10	10
-- 30	30
-- 20	20
------------------------------------------------------------------------

-- 037 최소값 출력 (MIN)
-- SALESMAN 인 사원들 중 최소 월급을 출력
SELECT MIN(sal)
    FROM emp
    WHERE job = 'SALESMAN';

-- 출력 예시
-- 1250

-- 직업과 직업별 최소 월급 출력 
-- ORDER BY 절을 사용하여 최소 월급이 높은 것부터 출력
--  ORDER BY 절은 항상 맨 마지막에 작성하고 실행 또한 맨 마지막에 실행
SELECT job, MIN(sal) as 최소값
    FROM emp
    GROUP BY job
    ORDER BY 최소값 DESC;

-- 출력 예시
--PRESIDENT	5000
--ANALYST	3000
--MANAGER	2450
--SALESMAN	1250
--CLERK	800

-- 그룹 함수의 특징은 WHERE절의 조건이 거짓이어도 결과를 출력한다는 것 
SELECT MIN(sal) 
    FROM emp 
    WHERE 1 = 2;

-- 출력 예시
-- (null)
-- WHERE 절에 1=2는 조건이 거짓이지만 실행됨
-- NULL로 출력되었는지 NVL 함수 사용해보면 알 수 있음 
SELECT NVL(MIN(sal), 0)
    FROM emp 
    WHERE 1 = 2;

-- 출력 예시
-- 0 

-- 직업, 직업별 최소 월급 출력 
-- 직업에서 SALESMAN은 제외하고 출력하고 직업별 최소 월급이 높은 것부터 출력 
SELECT job, MIN(sal) 
    FROM emp 
    WHERE job != 'SALESMAN'
    GROUP BY job 
    ORDER BY MIN(sal) DESC;

-- 출력 예시
--PRESIDENT	5000
--ANALYST	3000
--MANAGER	2450
--CLERK	800

------------------------------------------------------------------------

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

------------------------------------------------------------------------

-- 039 토탈값 출력 (SUM)
-- 부서 번호와 부서 번호별 토탈 월급 출력 
SELECT deptno, SUM(sal) 
    FROM emp 
    GROUP BY deptno;
    
-- 출력 예시
--10	8750
--30	9400
--20	10875

-- 직업과 직업별 토탈 월급을 출력 
-- 직업별 토탈 월급이 높은 것부터 출력
SELECT job, SUM(sal)
    FROM emp
    GROUP BY job
    ORDER BY SUM(sal) DESC;

-- 출력 예시
--MANAGER	8275
--ANALYST	6000
--SALESMAN	5600
--PRESIDENT	5000
--CLERK	4150

-- 직업과 직업별 토탈 월급 출력
-- (error)직업별 토탈 월급이 4000 이상인 것만 출력 
SELECT job, SUM(sal)
    FROM emp
    WHERE SUM(sal) >= 4000
    GROUP BY job;
-- ORA-00934: 그룹 함수는 허가되지 않습니다 

--(정상)직업별 토탈 월급이 4000 이상인 것만 출력 
SELECT job, SUM(sal)
    FROM emp
    GROUP BY job
    HAVING SUM(sal) >= 4000;

-- 출력 예시
--PRESIDENT	5000
--MANAGER	8275
--SALESMAN	5600
--CLERK	4150
--ANALYST	6000

-- 직업과 직업별 토탈 월급 출력하는데 직업에서 SALESMAN은 제외하고 
-- 직업별 토탈 월급이 4000이상인 사람 출력 
SELECT job, SUM(sal)
    FROM emp
    WHERE job != 'SALESMAN'
    GROUP BY job
    HAVING SUM(sal) >= 4000;

-- 출력 예시
--PRESIDENT	5000
--MANAGER	8275
--CLERK	4150
--ANALYST	6000

-- (error)직업과 직업별 토탈 월급 출력하는데 직업에서 SALESMAN은 제외하고 
-- 직업별 토탈 월급이 4000이상인 사람 출력 
SELECT job as 직업, SUM(sal)
    FROM emp
    WHERE job != 'SALESMAN'
    GROUP BY 직업
    HAVING SUM(sal) >= 4000;
-- ORA-00904: "직업": 부적합한 식별자

--실행 순서
-- FROM → WHERE → GROUP BY → HAVING → SELECT  → ORDER BY 

------------------------------------------------------------------------

-- 040 건수 출력 (COUNT)
--  사원 테이블 전체 사원수 출력 
SELECT COUNT(empno)
    FROM emp;

-- 출력 예시
-- 14

-- 커미션 카운트 
SELECT COUNT(comm)
    FROM emp;

-- 출력 예시
-- 4
-- 그룹함수 COUNT는 NULL값을 COUNT하지 않음
-- 평균값을 출력할 때는 특히 NULL값을 더 고려해야 함 
