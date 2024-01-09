-- 063 ���� ���̺��� �����͸� �����ؼ� ��� ��(USING��)
-- USING���� ����� ���� ������� �̸�, ����, ����, �μ� ��ġ�� ���
SELECT e.ename �̸�, e.job ����, e.sal ����, d.loc "�μ� ��ġ"
    FROM emp e JOIN dept d 
    USING (deptno)
    WHERE e.job = 'SALESMAN';

-- ��� ����
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO

-- ���� ������ WHERE �� USING ���� ����Ͽ� EMP �� DEPT ���̺��� �����ϴ� ����
-- USING ������ ���� ���� ��� �� ���̺��� ������ �� ����� �÷��� DEPTNO�� ����ϸ� �ȴ�.
-- DEPTNO �տ��� ���̺���̳� ���̺� ��Ī�� ����� �� ����. 
-- [ERROR ����]
--SELECT e.ename �̸�, e.job ����, e.sal ����, d.loc "�μ� ��ġ"
--    FROM emp e JOIN dept d 
--    USING (e.deptno)
--    WHERE e.job = 'SALESMAN';

-- ORA-01748: ���� �� ��ü�� ����� �� �ֽ��ϴ�

-- EQUI JOIN �� USING ���� ����� �ۼ����� ���� 
-- ��[����Ŭ EUQI JOIN]
SELECT e.ename, d.loc
    FROM emp e, dept d
    WHERE e.deptno = d.deptno ;

-- ��� ����
--KING	    NEW YORK
--BLAKE	    CHICAGO
--CLARK   	NEW YORK
--JONES	    DALLAS
--MARTIN	CHICAGO
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--JAMES	    CHICAGO
--WARD	    CHICAGO
--FORD	    DALLAS
--SMITH	    DALLAS
--SCOTT   	DALLAS
--ADAMS	DALLAS
--MILLER 	NEW YORK

-- ��[USING ���� ����� ����]
SELECT e.ename, d.loc
    FROM emp e JOIN dept d 
    USING (deptno);

-- ��� ����
--KING	    NEW YORK
--BLAKE	    CHICAGO
--CLARK	    NEW YORK
--JONES	    DALLAS
--MARTIN	CHICAGO
--ALLEN   	CHICAGO
--TURNER	CHICAGO
--JAMES	    CHICAGO
--WARD	    CHICAGO
--FORD	    DALLAS
--SMITH	    DALLAS
--SCOTT	    DALLAS
--ADAMS	DALLAS
--MILLER	    NEW YORK

-- [ERROR ������ �°�ȣ]
--SELECT e.ename �̸�, e.job ����, e.sal ����, d.loc "�μ� ��ġ"
--    FROM emp e JOIN dept d
--    USING deptno 
--    WHERE e.job = 'SALESMAN';
    
-- ORA-00906: ������ �°�ȣ

-- [����Ŭ EQUI JOIN]
SELECT e.ename, d.loc 
    FROM emp e, dept d, salgrade s
    WHERE e.deptno =  d.deptno 
    AND e.sal BETWEEN s.losal AND s.hisal;

--��� ����
--KING	    NEW YORK
--SCOTT    	DALLAS
--FORD	    DALLAS
--JONES	    DALLAS
--BLAKE	    CHICAGO
--CLARK	    NEW YORK
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--MILLER    	NEW YORK
--WARD	    CHICAGO
--MARTIN	CHICAGO
--ADAMS	DALLAS
--JAMES    	CHICAGO
--SMITH	    DALLAS

-- [USING ���� ����� ����]
SELECT e.ename, d.loc, s.grade 
    FROM emp e JOIN dept d
    USING (deptno)
    JOIN salgrade s 
    ON (e.sal BETWEEN s.losal AND s.hisal);

--KING	    NEW YORK	5
--SCOTT	    DALLAS    	4
--FORD	    DALLAS      4
--JONES	    DALLAS      4
--BLAKE	    CHICAGO 	4
--CLARK	    NEW YORK	4
--ALLEN	    CHICAGO	3
--TURNER	CHICAGO	3
--MILLER	    NEW YORK	2
--WARD   	CHICAGO	2
--MARTIN	CHICAGO	2
--ADAMS	DALLAS	    1
--JAMES	    CHICAGO	1
--SMITH	    DALLAS	    1  
