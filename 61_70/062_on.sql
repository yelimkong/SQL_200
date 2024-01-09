-- 062 ���� ���̺��� �����͸� �����ؼ� ��� �� (ON��)
-- ON ���� ����� ���� ������� �̸��� ����, ����, �μ� ��ġ�� ��� 
SELECT e.ename as �̸�, e.job as ����, e.sal as ����, d.loc as "�μ� ��ġ"
    FROM emp e JOIN dept d
    ON (e.deptno = d.deptno)
    WHERE e.job = 'SALESMAN';

-- ��� ����
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO

-- ���� �ۼ����� ũ�� ����Ŭ ���� �ۼ����� ANSI/ISO SQL:1999 standards ���� �ۼ����� �ִ�.
--[����Ŭ ���� �ۼ���]
-- �� EQUI JOIN
-- �� NON EQUI JOIN
-- �� OUTER JOIN
-- �� SELF JOIN

-- [ANSI/ISO SQL : 1999 standard]
-- �� ON ���� ����� JOIN
-- �� LEFT/RIGHT/FULL OUTER JOIN
-- �� USING ���� ����� JOIN
-- �� NATURAL JOIN
-- �� CROSS JOIN 

-- �Ϲ������δ� ����Ŭ ���� �ۼ����� ���� ���δ�.
-- EQUI JOIN�� ON���� ����� ���� �ۼ����� ����
-- [����Ŭ EQUI JOIN]
SELECT e.ename, d.loc
   FROM  emp e, dept d
   WHERE e.deptno = d.deptno;

-- ��� ����
--KING	    NEW YORK
--BLAKE	    CHICAGO
--CLARK	    NEW YORK
--JONES	    DALLAS
--MARTIN	CHICAGO
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--JAMES    	CHICAGO
--WARD	    CHICAGO
--FORD	    DALLAS
--SMITH	    DALLAS
--SCOTT	    DALLAS
--ADAMS	DALLAS
--MILLER	    NEW YORK

-- WEHRE ���� �ۼ��ߴ� ���� ������ ON���� �ۼ��ߴ�,
-- ���� ���� ���̺��� ������ �� ���� �ۼ����� ���̴� ������ ����.
-- [����Ŭ EQUI JOIN]
SELECT e.ename, d.loc
    FROM emp e, dept d, salgrade s
    WHERE e.deptno  = d.deptno 
    AND e.sal BETWEEN s.losal AND s.hisal;

-- ��� ����
--KING	    NEW YORK
--SCOTT	    DALLAS
--FORD	    DALLAS
--JONES	    DALLAS
--BLAKE	    CHICAGO
--CLARK   	NEW YORK
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--MILLER	    NEW YORK
--WARD	    CHICAGO
--MARTIN	CHICAGO
--ADAMS	DALLAS
--JAMES   	CHICAGO
--SMITH	    DALLAS

-- [ON ���� ����� ����]
SELECT e.ename, d.loc, s.grade
    FROM emp e JOIN dept d
    ON (e.deptno = d.deptno)
    JOIN salgrade s 
    ON (e.sal BETWEEN s.losal AND s.hisal);

-- ��� ����
--KING	    NEW YORK	5
--SCOTT    	DALLAS	    4
--FORD	    DALLAS	    4
--JONES	    DALLAS	    4
--BLAKE	    CHICAGO	4
--CLARK	    NEW YORK	4
--ALLEN	    CHICAGO	3
--TURNER	CHICAGO	3
--MILLER	    NEW YORK	2
--WARD	    CHICAGO	2
--MARTIN	CHICAGO	2
--ADAMS	DALLAS	    1
--JAMES	    CHICAGO	1
--SMITH	    DALLAS	    1

-- ���� ���� ���̺��� ������ ���� ������� �Ǵ� ���� ������
-- ���̺��� �������� �ϳ��� �����ؼ� ���
-- (���� ������ ���� = ���̺� ���� -1 ) 
-- ���� ���������� ���̺��� 3���̹Ƿ� ���� ������ 2�� �ۼ��ߴ�. 