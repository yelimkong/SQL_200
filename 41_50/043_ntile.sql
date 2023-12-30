-- 043 ������ �м� �Լ��� ��� ��� (NTILE)
-- �̸��� ����, ����, ������ ��� ��� 
-- ������ ����� 4������� ������
-- 1���(0 ~ 25%), 2���(25 ~ 50%), 3���(50 ~ 75%), 4���(75 ~ 100%)
SELECT ename, job, sal ,
          NTILE(4) OVER (ORDER BY sal DESC NULLS LAST) ���
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER', 'CLECK');

-- ��� ���� 
--FORD	ANALYST    3000	1
--SCOTT	ANALYST	    3000	1
--JONES	MANAGER	2975	2
--BLAKE	MANAGER	2850	3
--CLARK	MANAGER	2450	4

-- 1���(0 ~ 20%), 2���(20 ~ 40%), 3���(40 ~ 60%), 4���(60 ~ 80%), 5���(80 ~ 100%)
SELECT ename, job, sal ,
          NTILE(5) OVER (ORDER BY sal DESC NULLS LAST) ���
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER', 'CLECK');

-- ��� ���� 
--FORD	ANALYST	    3000	1
--SCOTT	ANALYST	    3000	2
--JONES	MANAGER	2975	3
--BLAKE	MANAGER	2850	4
--CLARK	MANAGER	2450	5 

-- ORDER BY sal DESC NULLS LAST���� 
-- NULLS LAST�� NULL�� �� �Ʒ��� ��� 
-- 1) NULLS LAST�� ��� �� ���� �� 
SELECT ename, comm
    FROM emp 
    WHERE deptno = 30 
    ORDER BY comm DESC;

-- ��� ���� 
--BLAKE	    (null)
--JAMES  	(null)
--MARTIN	1400
--WARD	    500
--ALLEN  	300
--TURNER	0

-- 2) NULLS LAST�� ��� ���� �� 
SELECT ename, comm
    FROM emp
    WHERE deptno = 30
    ORDER BY comm DESC NULLS LAST;
    
-- ��� ���� 
--MARTIN	1400
--WARD	    500
--ALLEN  	300
--TURNER	0
--BLAKE	    (null)
--JAMES  	(null)