--081 ������ ���� �� ����ϱ� (COMMIT, ROLLBACK)
-- ��� ���̺� ��� ���̺� �Է��� �����Ͱ� �����ͺ��̽��� ����ǵ��� �ϱ� 

INSERT INTO emp(empno, ename, sal, deptno)
    VALUES(1122, 'JACK', 3000, 20 );

-- ��� ����
--1 �� ��(��) ���ԵǾ����ϴ�.

COMMIT ;

-- ��� ����
-- Ŀ�� �Ϸ�.

UPDATE emp 
    SET sal = 4000
    WHERE ename = 'SCOTT';
    
ROLLBACK;

-- ��� ����
-- �ѹ� �Ϸ�.

-- ��ü ���̺� ��ȸ 
SELECT table_name FROM user_tables;

-- emp ���̺� ����
--CREATE TABLE emp (
--    empno NUMBER(5) PRIMARY KEY,
--    ename VARCHAR2(50),
--    job VARCHAR2(50),
--    mgr NUMBER(5),
--    hiredate DATE,
--    sal NUMBER(7, 2),
--    comm NUMBER(7, 2),
--    deptno NUMBER(3)
--);


-- COMMIT ��ɾ�� COMMIT ������ �����ߴ� DML �۾����� �����ͺ��̽��� ������ 
-- �ݿ��ϴ� TCL (Transaction Control Language ) �Դϴ�. 

-- ROLLBACK ��ɾ�� ������ COMMIT  ��ɾ ������ ���� DML ���� ����ϴ� TCL
-- (Transaction Control Language )�Դϴ�. 
-- ���� �������� SCOTT�� ������ 4000���� ������ UPDATE���� ��ҵ˴ϴ�. 

-- TCL��(Transaction Control Language ) �� ������ ������ �����ϴ�.
--      ����      |       ���� 
-- COMMIT     |   ��� ���� ������ �����ͺ��̽��� �ݿ��մϴ�.
-- ROLLBACK   |   ��� ���� ������ ����մϴ�. 
-- SAVEPOINT  |  Ư�� ���������� ������ ����մϴ�. 
