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
