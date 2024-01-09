-- 61 ���� ���̺��� �����͸� �����ؼ� ��� �� (SELF JOIN)
-- ��� (EMP) ���̺� �ڱ� �ڽ��� ���̺�� �����Ͽ� �̸�, ����,�ش� ����� 
-- ������ �̸��� �������� ������ ��� 
SELECT e.ename �̸�, e.job ����, m.ename ������, m.job "������ ����"
    FROM emp e, emp m
    WHERE e.mgr = m.empno AND e.job = 'SALESMAN';
    
-- ��� ����
--MARTIN	SALESMAN	BLAKE	MANAGER
--WARD	    SALESMAN	BLAKE	MANAGER
--TURNER	SALESMAN	BLAKE	MANAGER
--ALLEN	    SALESMAN	BLAKE	MANAGER

-- [��� �ؼ�]
-- MARTIN, WARD, TURNER, ALLEN�� �����ڴ� BLAKE �̴�.
-- �Ʒ� ������ ���� ������ KING�� �����ڷ� �ΰ� �ִ� 
-- KING�� ���� ���� �������  BLAKE, CLARK, JONES�̴�.
-- �׸��� BLAKE �ؿ� ���� ���� ������� JAMES, WARD, TURNER, ALLEN, MARTIN�̴�. 
-- �̸� ���ϴ� ������ MGR �÷��̴�.
-- MGR�� �ش� ����� ���� ����� ��� ��ȣ�̴�.

-- ���� ���� �ٷ� �ش� ����� �������̴�.

-- KING �� ��� ��ȣ�� 7839�� MGR ��ȣ�� �ϰ� �ִ� ������� BLAKE, CLARK, JONES�̴�.
-- BLAKE�� ��� ��ȣ�� 7698��  MGR ��ȣ�� �ϰ� �ִ� ������� JAMES, WARD, TURNER, ALLEN, MARTIN�̴�

-- FROM ���� ��� ���̺��� 2�� ����ϰ� �ϳ��� e�� ��Ī�� �ְ� 
-- �ٸ� �ϳ��� m���� ��Ī�� �ش�.

-- emp ���̺��� ����� �����ڰ� ������ �����Ǿ� �����Ƿ� 
-- emp ���̺��� ��� ���̺��̶� �� �� �ְ� ������ ���̺��̶� �� ���� �ִ�.

-- �׷��� ��� ���̺� ��Ī�� "e", ������ ���̺� ��Ī�� "m"�̴�.

SELECT e.empno �����ȣ, e.ename �̸�, m.empno "������ �����ȣ", m.ename �����ڸ�
    FROM emp e, emp m 
    WHERE e.mgr = m.empno;

-- ��� ����
--7788	SCOTT	7566	JONES
--7902	FORD	    7566	JONES
--7900	JAMES	7698	BLAKE
--7521	WARD	7698	BLAKE
--7844	TURNER	7698	BLAKE
--7499	ALLEN	7698	BLAKE
--7654	MARTIN	7698	BLAKE
--7934	MILLER	7782	CLARK
--7876	ADAMS	7788	SCOTT
--7698	BLAKE	7839	KING
--7782	CLARK	7839	KING
--7566	JONES	7839	KING
--7369	SMITH	7902	FORD

SELECT empno, ename, mgr
    FROM emp;

-- ��� ����
--7839	KING	    (null)
--7698	BLAKE	7839
--7782	CLARK	7839
--7566	JONES	7839
--7654	MARTIN	7698
--7499	ALLEN	7698
--7844	TURNER	7698
--7900	JAMES	7698
--7521	WARD	7698
--7902	FORD	    7566
--7369	SMITH	7902
--7788	SCOTT	7566
--7876	ADAMS	7788
--7934	MILLER	7782

-- ��� ���̺� emp�� ������ ���̺� emp�� ������δ� e.mgr = m.empno�� ���Ǿ���.