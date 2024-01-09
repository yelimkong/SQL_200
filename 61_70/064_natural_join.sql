
-- 064 ���� ���̺��� �����͸� �����ؼ� ��� ��(NATURAL JOIN)
-- NATURAL ���� ������� �̸�, ����, ���ް� �μ� ��ġ ��� 
SELECT e.ename �̸�, e.job ����, e.sal ����, d.loc "�μ� ��ġ"
    FROM emp e NATURAL JOIN dept d 
    WHERE e.job = 'SALESMAN';

-- ��� ����
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO

-- ���� ������ ���� ������ ��������� �ۼ����� �ʾƵ� FROM ���� EMP�� DEPT
-- ���̿� NATURAL JOIN�ϰڴٰ� ����ϸ� ������ �Ǵ� ����
-- �� ���̺� �� �� �����ϴ� ������ �÷��� ������� �Ͻ����� ������ �����Ѵ�.
-- �� �� �����ϴ� ������ �÷��� DEPTNO�� ����Ŭ�� �˾Ƽ� ã�� �̸� �̿��Ͽ� ���� ���� 
-- ������ ���� WHERE ���� ������ ����� �� ������ ������� �Ǵ� �÷��� 
-- DEPTNO�� ���̺���� ���̺� ��Ī ���� ����ؾ� �Ѵ�.

--[ERROR] ���̺� ��Ī�� ����ϰ� �Ǹ� ������ ���� ������ �߻�
--SELECT e.ename AS �̸�, e.job AS ����, e.sal ����, d.loc AS "�μ� ��ġ"
--    FROM emp e NATURAL JOIN dept d
--    WHERE e.job = 'SALESMAN' AND e.deptno = 30;

-- ORA-25155: NATURAL ���ο� ���� ���� �ĺ��ڸ� ���� �� ����

SELECT e.ename AS �̸�, e.job AS ����, e.sal ����, d.loc AS "�μ� ��ġ"
    FROM emp e NATURAL JOIN dept d
    WHERE e.job = 'SALESMAN' AND deptno = 30;

-- ��� ����
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO