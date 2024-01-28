--073 ���� ���� ����ϱ� ��(NOT IN)
-- �����ڰ� �ƴ� ������� �̸��� ���ް� ������ ���
SELECT ename, sal, job 
    FROM emp 
    WHERE empno not in (SELECT mgr
                                    FROM emp
                                    WHERE mgr is not null);

-- ��� ����
--SMITH	    800	CLERK
--ALLEN	    1600	SALESMAN
--WARD	    1250	SALESMAN
--MARTIN	1250	SALESMAN
--TURNER	1500	SALESMAN
--ADAMS	1100	CLERK
--JAMES	    950	CLERK
--MILLER	    1300	CLERK

-- ���� ������ �ڱ� �ؿ� ���� ���� ����� �� �� ���� ������� ����ϴ� �����Դϴ�.
-- �ڱ� �ؿ� ���� ���ϰ� �� �� ���� ����� ��� ��ȣ(EMPNO)�� �Ǹ��� ��ȣ(MGR)�� �ƴ� 
-- ����� NOT IN �����ڸ� ����Ͽ� ������ ��ȣ�� �ƴ� ������� �˻��մϴ�. 
-- ���� �������� ���� ����Ǿ��ٰ� �����ϰ� ���� �������� �ۼ��ϸ� ������ ����.

SELECT ename, sal, job
    FROM emp
    WHERE empno not in (7839, 7698, 7902, 7566, 7788, 7782);

-- ��� ����
--MARTIN	1250	SALESMAN
--ALLEN	    1600	SALESMAN
--TURNER	1500	SALESMAN
--JAMES   	950	CLERK
--WARD	    1250	SALESMAN
--SMITH	    800	CLERK
--ADAMS	1100	CLERK
--MILLER	    1300	CLERK

-- ���� �������� WHERE ���� mgr is not null�� ������� �ʰ� �����ϸ� ������ ���� ����� ��µ��� �ʽ��ϴ�.
SELECT ename, sal, job 
    FROM emp 
    WHERE empno not in (SELECT mgr
                                    FROM emp);
-- ���õ� ���ڵ尡 �����ϴ�. 
--[����] mgr �÷��� NULL���� �ֱ� �����Դϴ�. 
-- NOT IN �� ����� ��� ���� �������� ���� ������ NULL ���� �ϳ��� ���ϵǸ� 
-- ����� ��µ��� �ʽ��ϴ�. 

-- NOT IN ���� �ۼ��� ���� �������� ������ SQL�� ���� �����Դϴ�. 

SELECT ename, sal, job
    FROM emp 
    WHERE empno != 7839 AND empno != 7698 AND empno != 7902
    AND empno != 7566 AND empno != 7566 AND empno != 7788
    AND empno != 7782 AND empno!= NULL;

-- ��ü�� NULL�� �Ǿ���� ����� ��µ��� �ʽ��ϴ�. 
-- ���� ���������� NOT IN�� ����� ���� �ݵ�� ���� ���������� ���� ���������� NULL ���� 
-- ���ϵ��� �ʰ� �ؾ� �մϴ�.