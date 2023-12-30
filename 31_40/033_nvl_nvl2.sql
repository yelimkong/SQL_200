-- 033 NULL�� ��� �ٸ� ������ ��� (NVL, NVL2)
-- �̸��� Ŀ�̼� ���, Ŀ�̼��� NULL �� ������� 0���� ��� 
SELECT ename, NVL(comm, 0)
    FROM emp ; 

-- ��� ����
--KING	0
--BLAKE	0
--CLARK	0
--JONES	0
--MARTIN	1400

-- �̸�, ����, ���� + Ŀ�̼� ��ȸ 
-- NULL + 100 = NULL
SELECT ename, sal, comm, sal + comm
    FROM emp ;

-- ��� ���� 
--KING	    5000	(null) (null)
--BLAKE	    2850	(null) (null)
--CLARK	    2450	(null) (null)
--JONES  	2975	(null) (null)
--MARTIN	1250	1400  2650

-- NULL�� �� �� ���� ���̹Ƿ� NULL�� 0���� ġȯ�Ͽ� ���� +Ŀ�̼� ���
SELECT ename, sal, NVL(comm, 0), sal+NVL(comm, 0)
    FROM emp;

--��� ����
--KING	5000	0	5000
--BLAKE	2850	0	2850
--CLARK	2450	0	2450
--JONES	2975	0	2975
--MARTIN	1250	1400	2650

-- NVL2 ����Ͽ� Ŀ�̼��� NULL�� �ƴ� ����� sal + comm, 
-- Ŀ�̼��� NULL�� ������� sal ��� 
SELECT ename, sal, comm, NVL2(comm, sal + comm, sal)
    FROM emp;

--��� ����
--KING	5000		5000
--BLAKE	2850		2850
--CLARK	2450		2450
--JONES	2975		2975
--MARTIN	1250	1400	2650
