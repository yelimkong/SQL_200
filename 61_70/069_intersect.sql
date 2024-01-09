-- 069 ���� �����ڷ� �������� �������� ����ϱ� (INTERSECT)
-- �μ� ��ȣ 10��, 20���� ������� ����ϴ� ������ ����� 
-- �μ� ��ȣ 20��, 30���� ����ϴ� ���� ����� �������� ���
SELECT ename, sal, job, deptno
    FROM emp 
    WHERE deptno IN (10, 20)
INTERSECT
SELECT ename, sal, job, deptno
    FROM emp 
    WHERE deptno IN (20, 30);

-- ��� ����
--JONES   	2975	MANAGER	20
--FORD	    3000	ANALYST	    20
--SMITH   	800	CLERK	    20
--SCOTT	    3000	ANALYST	    20
--ADAMS	1100	CLERK	    20

-- ���� ������ INTERSECT ���� ������ �μ� ��ȣ 10��, 20���� ����鿡 ���� 
-- �����Ϳ� INTERSECT �Ʒ��� ������ �μ� ��ȣ 20���� 30���� ���� ������ ���� �������� 
-- 20 �� �����͸� ����ϴ� ����


-- ���̺� E�� ���̺� F�� �����Ͽ� INTERSECT �������� �� ���
-- E = {1, 2, 3, 4, 5}
-- F = {3, 4, 5, 6, 7}
-- 1. [TABLE E ���� ��ũ��Ʈ]
CREATE TABLE E (COL1 NUMBER(10));
INSERT INTO E VALUES(1);
INSERT INTO E VALUES(2);
INSERT INTO E VALUES(3);
INSERT INTO E VALUES(4);
INSERT INTO E VALUES(5);

-- 2. [TABLE F ���� ��ũ��Ʈ]
CREATE TABLE F (COL1 NUMBER(10));
INSERT INTO F VALUES(3);
INSERT INTO F VALUES(4);
INSERT INTO F VALUES(5);
INSERT INTO F VALUES(6);
INSERT INTO F VALUES(7);

SELECT COL1 FROM E
INTERSECT
SELECT COL1 FROM F;
 
-- ��� ����
--COL1
--3
--4
--5

