
-- 070 ���� �����ڷ� �������� ���̸� ��� (MINUS)
-- �μ� ��ȣ 10��, 20���� ����ϴ� ������ ������� 
-- �μ� ��ȣ 20��, 30���� ����ϴ� ������ ��� ���� 
SELECT ename, sal, job, deptno
    FROM emp
    WHERE deptno  IN (10, 20)
MINUS
SELECT ename, sal, job, deptno
    FROM emp
    WHERE deptno IN (20, 30);

-- ��� ����
--KING	5000	PRESIDENT	10
--CLARK	2450	MANAGER	10
--MILLER	1300	CLERK	    10

-- MINUS �����ڸ� �̿��Ͽ� MINUS ������ ���� ������ ��� �����Ϳ���
-- MINUS �Ʒ��� ������ ��� �������� ���̸� ����ϴ� ����

-- ���̺� G, H�� �����Ͽ� MINUS �������� �� ���
-- G = {1, 2, 3, 4, 5}
-- H = {3, 4, 5, 6, 7}
-- 1. [TABLE G ���� ��ũ��Ʈ]
CREATE TABLE G (COL1 NUMBER(10));
INSERT INTO G VALUES(1);
INSERT INTO G VALUES(2);
INSERT INTO G VALUES(3);
INSERT INTO G VALUES(4);
INSERT INTO G VALUES(5);

-- 2. [TABLE H ���� ��ũ��Ʈ]
CREATE TABLE H (COL1 NUMBER(10));
INSERT INTO H VALUES(3);
INSERT INTO H VALUES(4);
INSERT INTO H VALUES(5);
INSERT INTO H VALUES(6);
INSERT INTO H VALUES(7);

SELECT COL1 FROM G
MINUS
SELECT COL1 FROM H;
 
-- ��� ����
--COL1
--1
--2


-- MINUS �����ڵ� ��� �����͸� ������������ �����ؼ� ���
-- ���� �����ڿ� ��� �������� ���� ������ �ߺ� ���� ���� ����
-- �������� ����� ����� ��� ���� �����͸� ������ �ʿ䰡 ����
-- �ߺ��� �����ؼ� ����� �ʿ䰡 ���ٸ� UNION ALL�� ����ϴ� ���� 
-- �˻� ������ �� ���� �� �ִ�.

--���� ������    | ��� ������ ���� | �ߺ� ����
-- UNION ALL   |            X          |       X   
-- UNION         |           O          |       O
-- INTERSECT    |           O           |      O
-- MINUS         |           O           |      O
-- O :������ | X : ���� �� ��
