-- 034 IF���� SQL�� ���� �� (DECODE)
-- �μ���ȣ�� 10���̸� 300
-- �μ���ȣ�� 20���̸� 400
-- �μ���ȣ�� 10��, 20���� �ƴϸ� 0���� ���
SELECT ename, deptno, DECODE(deptno, 10, 300, 20, 400, 0) as ���ʽ�
    FROM emp;

--��� ����
--KING	10	300
--BLAKE	30	0
--CLARK	10	300
--JONES	20	400
--MARTIN	30	0

-- IF�� / ���� 
-- IF DEPTNO = 10 THEN 300 / �μ���ȣ�� 10���̸� 300�� ��� 
-- ELSE IF DEPTNO = 20 THEN 400 / �μ���ȣ�� 20���̸� 400�� ���
-- ELSE 0 / ���� ���ǿ� �� �ش���� �ʴ´ٸ� 0 ��� 

-- �����ȣ�� �����ȣ�� ¦������ Ȧ������ ���
SELECT empno, MOD(empno, 2), DECODE(MOD(empno, 2), 0, '¦��', 1, 'Ȧ��') as ���ʽ�
    FROM emp;

--��� ����
--7369	1	Ȧ��
--7499	1	Ȧ��
--7521	1	Ȧ��
--7566	0	¦��
--7654	0	¦��

-- IF�� / ���� 
--IF MOD(empno, 2), 0 THEN '¦��' / MOD(empno, 2)�� 0�̸� '¦��' ��� 
--ELSE IF MOD(empno, 2), 1 THEN 'Ȧ��' / MOD(empno, 2)�� 1�̸� 'Ȧ��' ���
--ELSE 0 / ���� ���ǿ� �� �ش���� �ʴ´ٸ� 0 ���

-- �̸��� ������ ���ʽ����, 
-- ������ SALESMAN�̸� ���ʽ� 5000�� ���, �������� ���ʽ� 2000 ��� 
SELECT ename, job, DECODE(job, 'SALESMAN', 5000, 2000) as ���ʽ� 
    FROM emp;

--��� ����
--KING	PRESIDENT	2000
--BLAKE	MANAGER	2000
--CLARK	MANAGER	2000
--JONES	MANAGER	2000
--MARTIN	SALESMAN	5000

-- IF�� / ���� 
--IF job, 'SALESMAN' THEN 5000 / ������ SALESMAN�̸� 5000 ���
--ELSE 2000 / �׷��� �ʴٸ� 2000 ���