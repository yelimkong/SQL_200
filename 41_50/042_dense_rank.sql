-- 042 ������ �м� �Լ��� ���� �� (DENSE_RANK) 
-- ������ ANALYST, MANAGER�� ������� �̸�, ����, ����, ������ ���� ���
-- 1���� ����� 2���� ���� ��� ���� ������ 3���� ��µ��� �ʰ� 2���� ���
SELECT ename, job, sal, RANK() OVER (ORDER BY sal DESC) as RANK,
                                DENSE_RANK() OVER (ORDER BY sal DESC) as DENSE_RANK
    FROM emp 
    WHERE job IN ('ANALYST', 'MANAGER'); 


-- ��� ���� 
--FORD	ANALYST	    3000	1	1
--SCOTT	ANALYST 	3000  1	1
--JONES	MANAGER	2975	3	2  RANK �Լ��� 3��, DENSE_RANK�� 2�� ���
--BLAKE	MANAGER	2850	4	3
--CLARK	MANAGER	2450	5	4

-- 81�⵵�� �Ի��� ������� ����, �̸�, ����, ���� ���
-- �������� ������ ���� ������� ���� �ο� 
SELECT job, ename, sal, DENSE_RANK() OVER (PARTITION BY job
                                                              ORDER BY sal DESC) ����
    FROM emp 
    WHERE hiredate BETWEEN TO_DATE('1981/01/01', 'RRRR/MM/DD')
                                AND TO_DATE('1981/12/31', 'RRRR/MM/DD');

-- ��� ���� 
--ANALYST	     FORD	3000	1
--CLERK	        JAMES	950	1
--MANAGER	JONES	2975	1
--MANAGER	BLAKE	2850	2
--MANAGER	CLARK	2450	3
--PRESIDENT	KING  	5000	1
--SALESMAN	ALLEN	1600	1
--SALESMAN	TURNER	1500	2
--SALESMAN	WARD	1250	3
--SALESMAN	MARTIN	1250	3


-- DENSE_RANK �ٷ� ������ ������ ��ȣ���� �����͸� �ְ� ����� �� �ִ�.
-- ������ 2975�� ����� ������ ������ ��� �Ǵ��� ��� 
-- DENSE_RANK �ٷ� ������ ������ ��ȣ �ȿ� ���� �Է�
-- �� ���� ������ ��ü������ ������ ��� �Ǵ��� ��� 
-- WHITIN : ~ �̳��� 
-- WHITIN GROUP : ��� �׷� �̳����� 2975�� ������ ��� �Ǵ��� 

SELECT DENSE_RANK(2975) WITHIN GROUP (ORDER BY sal desc) ����
    FROM emp;

-- ��� ���� 
-- ���� 
-- 3

-- �Ի��� 81�� 11�� 17�� ��� ���̺� ��ü ����� �� �� ��°�� �Ի��� ������ ���
SELECT DENSE_RANK('81/11/17') WITHIN GROUP (ORDER BY hiredate ASC) ���� 
    FROM emp;

-- ��� ���� 
-- ���� 
-- 9