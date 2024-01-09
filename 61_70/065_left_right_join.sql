-- 065 ���� ���̺��� �����͸� �����ؼ� ��� ��(LEFT/RIGHT OUTER JOIN)
SELECT e.ename �̸�, e.job ����, e.sal ����, d.loc "�μ� ��ġ"
    FROM emp e RIGHT OUTER JOIN dept d
    ON (e.deptno = d.deptno);

-- ��� ����
--KING	    PRESIDENT	5000	NEW YORK
--BLAKE	    MANAGER	2850	CHICAGO
--CLARK	    MANAGER	2450	NEW YORK
--JONES	    MANAGER	2975	DALLAS
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--JAMES	    CLERK    	950	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO
--FORD	    ANALYST	    3000	DALLAS
--SMITH	    CLERK	    800	DALLAS
--SCOTT	    ANALYST	    3000	DALLAS
--ADAMS	CLERK	    1100	DALLAS
--MILLER	    CLERK	    1300	NEW YORK
--(null)       (null)         	(null)  BOSTON

-- ����Ŭ ���� �ۼ��� �� OUTER ������ 1999 ANSI/ISO JOIN�� RIGHT OUTER JOIN���� �ۼ��� SQL
-- EMP�� DEPT�� ������ �� �������� DEPT ���̺��� �����ʹ� ���� ��� 

-- ����Ŭ �ƿ��� ���ΰ� 1999 ANSI/ISO ���� SQL �ۼ��� ����
-- ��[����Ŭ OUTER JOIN]
SELECT e.ename, d.loc
    FROM emp e, dept d
    where e.deptno (+) = d.deptno ;


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
--MILLER   	NEW YORK
--(null)	    BOSTON

--��[1999 ANSI/ISO RIGHT OUTER JOIN]
SELECT e.ename, d.loc
    FROM emp e RIGHT OUTER JOIN dept d 
    ON (e.deptno = d.deptno);
    
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
--MILLER   	NEW YORK
--(null)	    BOSTON

-- LEFT OUTER JOIN�� �����ϱ� ���� DEPT ���̺��� ���� �μ� ��ȣ 50����
-- ��� ���̺� �Է� 
INSERT INTO EMP(EMPNO, ENAME, SAL, JOB, DEPTNO) VALUES(8282, 'JACK', 3000, 'ANALYST', 50);


-- EMP ���̺� �������� Ȯ�� 
SELECT constraint_name, search_condition
FROM user_constraints
WHERE table_name = 'EMP';

-- ��� ���
--EMP_MGR_FK	        (null)
--SYS_C008348	        "EMPNO" IS NOT NULL
--EMP_ENAME_NN	"ENAME" IS NOT NULL
--EMP_SAL_CK	        sal BETWEEN 0 AND 9000
--EMP_DEPTNO_CK	deptno IN( 10, 20, 30 ) 
--EMP_EMAIL_CK	    email= '%@%.%'
--EMP_EMPNO_PK	(null)

-- ���� �������� ����:
ALTER TABLE EMP DROP CONSTRAINT EMP_DEPTNO_CK;


-- ���ο� �������� �߰�:
ALTER TABLE EMP ADD CONSTRAINT EMP_DEPTNO_CK CHECK (deptno IN (10, 20, 30, 50));

-- 1999 ANSI/ISO LEFT OUTER JOIN ���� 
SELECT e.ename �̸�, e.job ����, e.sal ����, d.loc "�μ� ��ġ"
    FROM emp e LEFT OUTER JOIN dept d
    ON (e.deptno = d.deptno);

-- ��� ����
--KING    	PRESIDENT	5000	NEW YORK
--CLARK	    MANAGER	2450	NEW YORK
--MILLER  	CLERK	    1300	NEW YORK
--JONES    	MANAGER	2975	DALLAS
--FORD	    ANALYST  	3000	DALLAS
--SMITH    	CLERK	    800	DALLAS
--SCOTT	    ANALYST	    3000	DALLAS
--ADAMS	CLERK	    1100	DALLAS
--BLAKE	    MANAGER	2850	CHICAGO
--MARTIN	SALESMAN	1250	CHICAGO
--ALLEN	    SALESMAN	1600	CHICAGO
--TURNER	SALESMAN	1500	CHICAGO
--JAMES	    CLERK	    950	CHICAGO
--WARD	    SALESMAN	1250	CHICAGO
--JACK	    ANALYST 	3000	(null)
-- EMP ���̺� �����ʹ� ���� ���
-- DEPT ���̺��� 70���� �������� �ʾ� �μ� ��ġ�� null�� ��� �� 

-- ����Ŭ OUTER JOIN ���ΰ� 1999 ANSI/ISO SQL�� LEFT OUTER JOIN �ۼ��� ���� 
--��[����Ŭ OUTER JOIN]
SELECT e.ename, d.loc
    FROM emp e, dept d
    WHERE e.deptno = d.deptno (+);

-- ��� ����
--KING	    NEW YORK
--CLARK	    NEW YORK
--MILLER	    NEW YORK
--JONES	    DALLAS
--FORD	    DALLAS
--SMITH	    DALLAS
--SCOTT	    DALLAS
--ADAMS	DALLAS
--BLAKE	    CHICAGO
--MARTIN	CHICAGO
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--JAMES   	CHICAGO
--WARD	    CHICAGO
--JACK	    (null)

--��[1999 ANSI/ISO LEFT OUTER JOIN]
SELECT e.ename, d.loc
    FROM emp e LEFT OUTER JOIN dept d
    ON (e.deptno = d.deptno);

-- ��� ����
--KING	    NEW YORK
--CLARK	    NEW YORK
--MILLER	    NEW YORK
--JONES	    DALLAS
--FORD	    DALLAS
--SMITH	    DALLAS
--SCOTT	    DALLAS
--ADAMS	DALLAS
--BLAKE   	CHICAGO
--MARTIN	CHICAGO
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--JAMES	    CHICAGO
--WARD	    CHICAGO
--JACK	    (null)

-- ����Ŭ OUTER JOIN�� �ƿ��� ���� ���� (+)�� �����Ͱ� �� ��µǴ� �ʿ� �ٿ��ش�.
-- EMP ���̺� �����ϴ� �����ʹ� ���� ��µǰ� �ִ�.