-- 025  ���� ������ �� ��� (MOD)
-- ���� 10�� 3���� ���� �������� ��� 
SELECT MOD(10, 3)
    FROM DUAL;

-- ��� ���� 
-- 1

-- ��� ��ȣ�� �����ȣ�� Ȧ���̸� 1, ¦���̸� 0�� ����ϴ� ���� 
SELECT empno, MOD(empno, 2)
    FROM emp;

-- ��� ����
--7369	1
--7499	1
--7521	1
--7566	0
--7654	0

-- �����ȣ�� ¦���� ����� �����ȣ�� �̸� ��ȸ 
SELECT empno, ename
    FROM emp
    WHERE MOD(empno, 2) = '0';

-- ��� ����
--7698	BLAKE
--7782	CLARK
--7566	JONES
--7654	MARTIN
--7844	TURNER

-- ���� 10�� 3���� ���� �� ��� 
SELECT FLOOR(10/3)
    FROM DUAL;

-- ��� ����
-- 3
    