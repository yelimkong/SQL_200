-- 025  나눈 나머지 값 출력 (MOD)
-- 숫자 10을 3으로 나눈 나머지값 출력 
SELECT MOD(10, 3)
    FROM DUAL;

-- 출력 예시 
-- 1

-- 사원 번호와 사원번호가 홀수이면 1, 짝수이면 0을 출력하는 쿼리 
SELECT empno, MOD(empno, 2)
    FROM emp;

-- 출력 예시
--7369	1
--7499	1
--7521	1
--7566	0
--7654	0

-- 사원번호가 짝수인 사원의 사원번호와 이름 조회 
SELECT empno, ename
    FROM emp
    WHERE MOD(empno, 2) = '0';

-- 출력 예시
--7698	BLAKE
--7782	CLARK
--7566	JONES
--7654	MARTIN
--7844	TURNER

-- 숫자 10을 3으로 나눈 몫 출력 
SELECT FLOOR(10/3)
    FROM DUAL;

-- 출력 예시
-- 3
    