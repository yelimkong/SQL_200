drop  table  salgrade;

create table salgrade
( grade   number(10),
  losal   number(10),
  hisal   number(10) );

insert into salgrade  values(1,700,1200);
insert into salgrade  values(2,1201,1400);
insert into salgrade  values(3,1401,2000);
insert into salgrade  values(4,2001,3000);
insert into salgrade  values(5,3001,9999);

commit;

--059 ���� ���̺��� �����͸� �����ؼ� ��� �� (NON EQUI JOIN)
-- ���(EMP) ���̺�� �޿� ���(SALGRADE) ���̺��� �����Ͽ� �̸�, ����, �޿� ����� ��� 
SELECT e.ename, e.sal, s.grade
    FROM emp e, salgrade s
    WHERE e.sal BETWEEN s.losal AND s.hisal;
    
-- ��� ���� 
--SMITH	    800	1
--JAMES   	950	1
--ADAMS	1100	1
--WARD	    1250	2
--MARTIN	1250	2
--MILLER	    1300	2
--TURNER	1500	3
--ALLEN	    1600	3
--CLARK   	2450	4
--BLAKE	    2850	4
--JONES	    2975	4
--FORD	    3000	4
--SCOTT	    3000	4
--KING	    5000	5

-- [��� �ؼ�]
--  salgrade ���̺��� �޿� ��� ���̺� 
-- grade�� ����̰� losal�� ����� ������ ���� ������ �ϴ�, 
-- hisal�� ���� ������ ���
-- 5����� ���� ���� ���

SELECT * 
    FROM salgrade;

-- ��� ����
--1 	700	1200
--2	    1201	1400
--3  	1401	2000
--4	    2001	3000
--5	    3001	9999

-- emp ���̺�� salgrade ���̺��� �����ؼ� �̸�(ename)��  �޿� ��� (grade)�� �ϳ��� ����� ����ϰ��� �Ѵ�.
-- [����] emp�� dept ������ deptnoó�� ������ �÷��� ����
-- equal(=)�� ����� equi join�� �� �� ����.
-- ���� ���ǿ� equal ������ �� �� ���� �� ����ϴ� ������ non equi join

-- �� ���̺� ���̿� ������ �÷��� ������ ����� �÷��� �ִ�.
-- emp ���̺��� sal�÷��� salgrade ���̺��� losal��  hisal�÷�
-- emp ���̺��� ������ salgrade ���̺��� losal�� hisal ���̿� �ִ�.
-- �� ���� �����Ͽ� WHERE ���� ���� ������ �ۼ��Ͽ� �� ���̺��� �����Ѵ�.

SELECT e.ename, e.sal, s.grade
    FROM emp e, salgrade s
    WHERE e.sal BETWEEN s.losal AND s.hisal;

-- ��� ���� 
--SMITH	    800	1
--JAMES   	950	1
--ADAMS	1100	1
--WARD	    1250	2
--MARTIN	1250	2
--MILLER	    1300	2
--TURNER	1500	3
--ALLEN	    1600	3
--CLARK   	2450	4
--BLAKE	    2850	4
--JONES	    2975	4
--FORD	    3000	4
--SCOTT	    3000	4
--KING	    5000	5

-- [NON EQUI JOIN ��� ]
-- NTILE �м� �Լ��� ��� ����� ����� �� ������ �� ���ϰ� ������ �� ����.
-- NTILE(5)�� ����� ���� 20%�� �����ȴ�.
-- SALGRADE ���̺�� EMP ���̺��� �����ϰ� �Ǹ� ����� ������ 
-- SALGRADE ���̺��� losal�� hisal �÷��� �����Ϳ� ���� �����Ӱ� ������ �� �ִ�.
