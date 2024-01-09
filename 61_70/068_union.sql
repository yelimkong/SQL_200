DELETE FROM emp WHERE deptno = 50;
COMMIT ;

-- 068 ���� �����ڷ� �����͸� ���Ʒ��� �����ϱ� ��(UNION)
-- �μ� ��ȣ�� �μ� ��ȣ�� ��Ż ������ ����ϴµ� 
-- �� �Ʒ� �࿡ ��Ż ���� ���

SELECT deptno, SUM(sal)
    FROM emp 
    GROUP BY deptno
UNION
SELECT null AS deptno, SUM(sal)
    FROM emp ;
    
-- ��� ����
--10	    8750
--30	    9400
--20	    10875
--(null)	29025

-- ���� ������ UNION �����ڸ� �̿��Ͽ� �� ���� ������ ����� ���Ʒ��� 
-- �̿� �ٿ� ����ϴ� ����
-- ��µ� ����� ���� UNION ALL ���� �ٸ��� �μ� ��ȣ�� ������������ ���ĵ�

-- [UNION �����ڰ� UNION ALL�� �ٸ� �� ]
-- �� �ߺ��� �����͸� �ϳ��� ������ ������ ���
-- �� ù ��° �÷��� �����͸� �������� ������������ �����Ͽ� ��� 

-- C = {1, 2, 3, 4, 5}
-- D = {3, 4, 5, 6, 7}
-- UNION ALL ���� �ٸ��� C ���հ� D ������ �ߺ��� �������� 3, 4, 5�� �� ���� ��µ�
-- ���̺� C�� ���̺� D�� �����Ͽ� UNION �������� �� ��� 
-- 1. [TABLE C ���� ��ũ��Ʈ]
CREATE TABLE C (COL1 NUMBER(10));
INSERT INTO C VALUES(1);
INSERT INTO C VALUES(2);
INSERT INTO C VALUES(3);
INSERT INTO C VALUES(4);
INSERT INTO C VALUES(5);

-- 2. [TABLE D ���� ��ũ��Ʈ]
CREATE TABLE D (COL1 NUMBER(10));
INSERT INTO D VALUES(3);
INSERT INTO D VALUES(4);
INSERT INTO D VALUES(5);
INSERT INTO D VALUES(6);
INSERT INTO D VALUES(7);

SELECT COL1 FROM C
UNION
SELECT COL1 FROM D;

-- ��� ����
-- COL1
--1
--2
--3
--4
--5
--6
--7

-- �ߺ��� �����Ͱ� ���ŵǰ� ��� �����Ͱ� ������������ ���ĵǾ� ���

