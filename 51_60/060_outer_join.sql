--060 ���� ���̺��� �����͸� �����ؼ� ��� �� (OUTER JOIN)
-- ���(EMP) ���̺�� �μ�(DEPT) ���̺��� �����ؼ� �̸��� �μ� ��ġ�� ����ϴµ�, 
-- BOSTON �� ���� ��µǰ� �ϱ�
SELECT e.ename, d.loc
    FROM emp e, dept d
    WHERE e.deptno (+) = d.deptno;

-- ��� ����
--KING	    NEW YORK
--BLAKE	    CHICAGO
--CLARK	    NEW YORK
--JONES	    DALLAS
--MARTIN	CHICAGO
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--JAMES	    CHICAGO
--WARD	    CHICAGO
--FORD	    DALLAS
--SMITH	    DALLAS
--SCOTT	    DALLAS
--ADAMS	DALLAS
--MILLER	    NEW YORK
--(null)	    BOSTON -- EQUI JOIN ���� �ٸ��� BOSTON�� ��µǰ� �ִ�.

-- [���]
-- EQUI JOIN �� EMP�� DEPT ���̺���� ���� ������� BOSTON �� ��µ��� �ʾҴ�
-- BOSTON�� ��µ��� ���� �̿�� EMP ���̺� 40�� �μ� ��ȣ�� ���
-- DEPT ���̺�� ������ ���� �ʾұ� ����

--"BOSTON���� ����� ��ġ���� �ʾҴ�"�� ������ �� ���� Ȯ���Ϸ��� 
-- OUTER JOIN �� ����ؾ� �Ѵ�.

-- OUTER JOIN�� ���� EQUI JOIN������ OUTER ���� ���� (+)�� �߰��� ���̴�.

-- WHERE e.deptno (+) = d.deptno ;
--OUTER JOIN ���� (+) �� EMP�� DEPT ���̺� �� ����� �� ������ �ʿ� �ٿ��ش�.

-- ���� ��������� EMP ���̺��� ENAME �����Ͱ� DEPT ���̺��� LOC �����ͺ���
-- ���ڶ�� ��µǰ� �����Ƿ� EMP ���̺� �ʿ� (+) �� �ٿ��ش�.

-- EQUI JOIN�� ���ʿ� �� �����ϴ� �����͸� ����Ѵ�. 
-- RIGHT OUTER JOIN�� DEPT ���̺����� �����ϰ� EMP ���̺� �������� �ʴ� �����͵� ����Ѵ�.
-- LEFT OUTER JOIN�� EMP ���̺��� �����ϴµ� 
-- DEPT ���̺��� �������� �ʴ� �����͵� ����Ѵ�.