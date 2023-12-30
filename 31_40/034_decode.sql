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