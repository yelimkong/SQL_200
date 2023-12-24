-- 001 ���̺��� Ư�� ��(COLUMN) �����ϱ�
SELECT empno, ename, sal
    FROM emp ;
    
-- 002 ���̺��� ��� ��(COLUMN)  ����ϱ�
SELECT * 
    FROM emp ;
    
-- 003 �÷� ��Ī�� ����Ͽ� ��µǴ� �÷��� �����ϱ� 
SELECT empno as �����ȣ, ename as ����̸�, sal as "Salary"
    FROM emp ;
    
-- 004 ���� ������ ����ϱ� (||)
SELECT ename || sal
    FROM emp ;
    
SELECT ename || '�� ������ ' || sal || '�Դϴ�.' as �������� 
    FROM emp ;
    
SELECT ename || '�� ������ ' || job || '�Դϴ�.' as ��������
    FROM emp;
    
-- 005 �ߺ��� �����͸� �����ؼ� ����ϱ� (DISTINCT)
SELECT DISTINCT job
    FROM emp ;
    
SELECT UNIQUE job 
    FROM emp ;
    
-- 006 �����͸� �����ؼ� ����ϱ� (ORDER BY)
SELECT ename, sal
    FROM emp 
    ORDER BY sal asc ;

-- ���� ��������
SELECT ename, sal as ���� 
    FROM emp
    ORDER BY ���� asc ;

-- �����ȣ ��������, ���� ��������
SELECT ename, deptno, sal
    FROM emp
    ORDER BY deptno asc ; sal desc ;

-- �÷� ������ ORDER BY ��� ���� 
SELECT ename, deptno, sal
    FROM emp 
    ORDER BY 2 asc, 3 desc ;

-- 007 WHERE�� ����� (���� ������ �˻�)
-- ������ 3000�� ��� ���
SELECT ename, sal, job
    FROM emp 
    WHERE sal = 3000 ;

--��� ���
--FORD	3000	ANALYST
--SCOTT	3000	ANALYST

-- ������ 3000�̻��� ����� �̸��� ���� ���
SELECT ename �̸�, sal ����
    FROM emp 
    WHERE sal >= 3000 ;

--��°��
--KING	5000
--FORD	3000
--SCOTT	3000

-- 008 WHERE�� ���� �� (���ڿ� ��¥ �˻�)
-- ����̸��� SCOTT �� ����� �̸�, ����, ����, �Ի糯¥, �μ���ȣ ���
SELECT ename, sal, job, hiredate, deptno 
    FROM emp
    WHERE ename = 'SCOTT' ;

-- ��� ���    
-- SCOTT	3000	ANALYST	82/12/22	20

SELECT ename, hiredate
    FROM emp 
    WHERE hiredate = '81/11/17' ;
    
-- ��� ��� 
-- KING	81/11/17


-- ���� ������ ������ ��¥ ���� ��ȸ
SELECT * 
    FROM NLS_SESSION_PARAMETERS
    WHERE PARAMETER = 'NLS_DATE_FORMAT' ;

-- ��� ���
-- NLS_DATE_FORMAT	RR/MM/DD

-- ���� ��¥ ���� ���� 
-- ALTER SESSION SET NLS_DATE_FORMAT = 'YY/MM/DD'

-- 009 ��� ������ ���� (*, /, +, -)
--������ 36000 �̻��� ������� �̸��� ���� ��� 
SELECT ename, sal * 12 as ���� 
    FROM emp
    WHERE  sal * 12 >= 36000 ;
    
-- �μ���ȣ�� 10���� ������� �̸�, ����, Ŀ�̼�, ���� + Ŀ�̼� ���
SELECT ename, sal, comm, sal + comm 
    FROM emp 
    WHERE deptno = 10 ;

--��� ��� 
--KING	5000	(null)   (null)	
--CLARK	2450	(null)   (null)		
--MILLER	1300	(null)   (null)		

-- NVL �Լ� ��� 
SELECT sal + NVL(comm, 0) 
    FROM emp 
    WHERE ename = 'KING';

--��� ��� 
-- 5000

--010 �� ������ ���� ��
-- ������ 1200 ������ ������� �̸��� ����, ����, �μ� ��ȣ ��� 
SELECT ename, sal, job, deptno 
    FROM emp 
    WHERE sal <= 1200 ;

-- '���� �ʴ�' �� ������ ���� 
-- 1) !- 2) <> 3) ^=





