
-- 066 ���� ���̺��� �����͸� �����ؼ� ��� �� (FULL OUTER JOIN)
-- FULL OUTER JOIN ������� �̸�, ����, ����, �μ� ��ġ ���
SELECT e.ename �̸�, e.job ����, e.sal ����, d.loc "�μ� ��ġ"
    FROM emp e FULL OUTER JOIN dept d
    ON (e.deptno = d.deptno);

-- ��� ����
--JACK	    ANALYST  	3000	(null)
--KING	    PRESIDENT	5000	NEW YORK
--BLAKE  	MANAGER	2850	CHICAGO
--CLARK	    MANAGER	2450	NEW YORK
--JONES	    MANAGER	2975	DALLAS
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--JAMES	    CLERK	    950	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO
--FORD	    ANALYST	    3000	DALLAS
--SMITH	    CLERK	    800	DALLAS
--SCOTT	    ANALYST	    3000	DALLAS
--ADAMS	CLERK	    1100	DALLAS
--MILLER  	CLERK	    3000	NEW YORK
--(null)       (null)          (null)  BOSTON

--  ���� ������ RIGHT OUTER JOIN�� LEFT OUTER JOIN�� �� ���� �����Ͽ� ��� 
-- EMP ���̺��� �ִ� �μ� ��ȣ 50���� JACK �����Ϳ� DEPT ���̺��� �ִ� 
-- �μ� ��ȣ 40 ���� ���� �������� BOSTON �� ����ϸ� �����ϰ� �ִ�.

-- [ERROR] �ƿ��� ���� ����(+) ���ʿ� �־��� ���
--SELECT e.ename, d.loc
--    FROM emp e, dept d
--    WHERE e.deptno (+) = d.deptno (+) ;
-- ORA-01468: outer-join�� ���̺��� 1���� ������ �� �ֽ��ϴ�

-- FULL OUTER JOIN �� ������� �ʰ� ������ ��� ���
SELECT e.ename �̸�, e.job ����, e.sal ����, d.loc "�μ� ���"
    FROM emp e LEFT OUTER JOIN dept d
    ON (e.deptno = d.deptno)
UNION 
SELECT e.ename, e.job, e.sal, d.loc
    FROM emp e RIGHT OUTER JOIN dept d
    ON (e.deptno = d.deptno);


-- ��� ����
--JACK	    ANALYST  	3000	(null)
--KING	    PRESIDENT	5000	NEW YORK
--BLAKE  	MANAGER	2850	CHICAGO
--CLARK	    MANAGER	2450	NEW YORK
--JONES	    MANAGER	2975	DALLAS
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--JAMES	    CLERK	    950	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO
--FORD	    ANALYST	    3000	DALLAS
--SMITH	    CLERK	    800	DALLAS
--SCOTT	    ANALYST	    3000	DALLAS
--ADAMS	CLERK	    1100	DALLAS
--MILLER  	CLERK	    3000	NEW YORK
--(null)       (null)          (null)  BOSTON
