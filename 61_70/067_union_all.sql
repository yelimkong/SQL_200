-- 067 ���� �����ڷ� �����͸� ���Ʒ��� �����ϱ� �� (UNION ALL)
-- �μ� ��ȣ�� �μ� ��ȣ�� ��Ż ������ ��� 
-- �� �Ʒ��� �࿡ ��Ż ������ ��� 
SELECT deptno, SUM(sal) 
    FROM emp
    GROUP BY deptno
UNION ALL 
SELECT TO_NUMBER(null) AS deptno, SUM(sal)
    FROM emp;

-- ��� ����
--50	    3000
--10	    8750
--30	    9400
--20	    10875
--(null)	32025

-- UNION ALL �����ڴ� ���Ʒ��� ���� ����� �ϳ��� ����� ����ϴ� ���� 
-- ���� ������ UNION ALL ���� �����ڸ� �̿��Ͽ� �μ� ��ȣ�� �μ� ��ȣ�� ��Ż ������ ����ϴ�
-- ���� ������ ����� ��ü ��Ż ������ ����ϴ� �Ʒ��� ������ ����� �ϳ��� ����� ���

-- [���� �����ڸ� �ۼ��� �� ���ǻ���]
-- ��UNION ALL  ���� ������ �Ʒ��� ���� �÷��� ������ �����ؾ� �Ѵ�.
-- ��UNION ALL ���� ������ �Ʒ��� ���� Ŀ���� ������ Ÿ���� �����ؾ� �Ѵ�.
-- ������ ��µǴ� �÷����� ���� ������ �÷������� ��µȴ� 
-- ��ORDER BY ���� ���� �Ʒ��� �������� �ۼ��� �� �ִ�.

-- TO_NUMBER(null)�� UNION ALL ���� ���� DEPTNO�� ������ ������ �����̱� ������ 
-- TO_NUMVER�� ����Ͽ� ���������� �����ϰ� ���� ���.


--[UNION �����ڰ� UNION ALL�� �ٸ� ��]
-- �� �ߺ��� �����͸� �ϳ��� ������ ������ ���
-- �� ù ��° �÷��� �����͸� �������� ������������ �����Ͽ� ���

-- UNION ALL�� ���� ������ ����� �Ʒ��� ������ ����� �״�� ����ϸ� 
-- ���� ������ ��� �����Ϳ� �Ʒ��� ������ ��� ������ �� ������ �����Ͱ� �־ 
-- �ߺ��� �������� �ʰ� �״�� ��� 
-- ���� ���, A���հ� B������ ������ A ���հ� B������ �������� ����ϴ� 
-- ���� �����ڴ� UNION ALL

-- A = {1, 2, 3, 4, 5}
-- B = {3, 4, 5, 6, 7}
-- A UNION ALL B

-- ���̺� A�� ���̺� B�� �����Ͽ� UNION �������� �� ��� 
-- 1. [TABLE A ���� ��ũ��Ʈ]
CREATE TABLE A (COL1 NUMBER(10));
INSERT INTO A VALUES(1);
INSERT INTO A VALUES(2);
INSERT INTO A VALUES(3);
INSERT INTO A VALUES(4);
INSERT INTO A VALUES(5);

-- 2. [TABLE B ���� ��ũ��Ʈ]
CREATE TABLE B (COL1 NUMBER(10));
INSERT INTO B VALUES(3);
INSERT INTO B VALUES(4);
INSERT INTO B VALUES(5);
INSERT INTO B VALUES(6);
INSERT INTO B VALUES(7);

SELECT COL1 FROM A
UNION ALL
SELECT COL1 FROM B;

-- ��� ����
-- COL1
--1
--2
--3
--4
--5
--3
--4
--5
--6
--7