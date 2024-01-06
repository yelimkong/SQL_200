--058 ���� ���̺��� �����͸� �����ؼ� ��� �� (EQUI JOIN)
-- ���(EMP) ���̺�� �μ�(DEPT) ���̺��� �����Ͽ� �̸��� �μ� ��ġ�� ��� 
SELECT ename, loc
    FROM emp, dept
    WHERE emp.deptno = dept.deptno;

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


-- [�ؼ�]
-- ���� �ٸ� ���̺� �ִ� �÷����� �ϳ��� ����� ����Ϸ��� ����(JOIN)�� ����ؾ� �Ѵ�.
-- ename�� emp ���̺� �ְ� loc�� dept ���̺� �����ϹǷ� ename�� loc�� 
-- �ϳ��� ����� ����ϱ� ���ؼ��� from���� emp�� dept �� �� ����Ѵ�.

-- emp�� dept�� �����ϱ� ���ؼ��� ���� ������ �־�� �Ѵ�,
-- ���� ������ �� ���� ���̺��� �ذ��ϱ� ���� ������̴�. 
-- emp ���̺��� deptno�� �����ϰ� dept ���̺��� deptno���� �����ϹǷ� 
-- 'emp ���̺��� �μ� ��ȣ�� dept ���̺��� �μ� ��ȣ�� ����' ��� ���� 
-- emp.deptno = dept.deptno�� �־� ������ �����Ѵ�.

-- ���� ������ ���� �ʰ� ������ ���� ������ �ϰ� �Ǹ� ���δ� ������ �Ǿ� 
-- 56��(14 X 4)�� ���� ��µȴ�.


SELECT ename, sal
    FROM emp, dept;

-- ��� ����
--KING	    5000
--BLAKE	    2850
--CLARK	    2450
--JONES	    2975
--MARTIN	1250
-- :
--FORD   	3000
--SMITH    	800
--SCOTT	    3000
--ADAMS	1100
--MILLER	    1300
-- WHERE ���� ���� ������ ��Ȯ�ϰ� �ۼ��ϰ� ������ �ϰ� �Ǹ� 14���� �ุ ��� 
-- ������ �Ǿ� 14���� ���� ��µǴ� ������ ������ ���� 
-- ���� ��� ���̺��� ù ��° �̸� KING�� �����´�
-- KONG�� �μ� ��ġ�� ����ϱ� ���� KING�� �μ� ��ȣ 10������ dept ���̺��� 
-- �ش� �μ� ��ȣ�� 10���� �μ� ��ġ��NEW YORK ã�Ƽ� ��� 
-- KING���� ������ �� �Ʒ� ADAMS���� �� �۾��� �ݺ��Ͽ� ���� 
SELECT ename, loc 
    FROM emp, dept
    WHERE emp.deptno = dept.deptno;

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

-- �� ������ EQUI JOIN�̶�� �Ѵ�.
-- ���� ������ ����(=)�̸� EQUI JOIN �̴�.
-- ���� ������� ������ ANALYST�� ����鸸 ��� 
SELECT ename, loc, job
    FROM emp, dept
    WHERE emp.deptno = dept.deptno 
    AND emp.job = 'ANALYST';

-- ��� ����
--FORD	DALLAS	ANALYST
--SCOTT	DALLAS	ANALYST

-- emp.deptno = dept.deptno �� ���� �����̰� 
-- emp.job = 'ANALYST'�� �˻������̴�. 
-- ���� ������ �� ���̺��� �����ϱ� ���� �ʿ��� �����̰�,
-- �˻� ������ ��ü ������ �߿� Ư�� �����͸� �����ؼ� ���� ���� ���� 

-- ���� ���ǰ� �˻� ���� AND �����ڷ� �����Ͽ� �ۼ� 

-- [ERROR] �� ������ SELECT deptno�� �߰��Ͽ� ��� 
SELECT ename, loc, job, deptno
    FROM emp, dept
    WHERE emp.deptno = dept.deptno 
    AND emp.job = 'ANALYST';

-- ORA-00918: ���� ���ǰ� �ָ��մϴ�

-- deptno�� ��ǥ(*)�� ������ deptno ���� ���ǰ� �ָ��ϴٶ�� ������ ���� �ִ�. 
-- detpno�� emp ���̺��� �����ϰ� dept ���̺��� �����ϴ� �÷��̱� ������ 
-- ��� ���̺� �ִ� �÷��� ������� ���� ������ ���� ���̴�, 
-- �� �̸� �տ� ���̺���� ���ξ�� �ٿ��ش�.

SELECT ename, loc, job, emp.deptno -- emp.deptno : �� �̸� �տ� ���ξ� 
    FROM emp, dept
    WHERE emp.deptno = dept.deptno 
    AND emp.job = 'ANALYST';

-- ��� ����
--FORD	DALLAS	ANALYST	  20
--SCOTT	DALLAS	ANALYST	  20

-- ename�� loc�÷� �տ� ���̺���� ������ �ʾƵ� ����� �� �� �־��� ����
-- ename�� emp ���̺��� �����ϰ� loc�� dept ���̺��� �����ϴ� ���̱� ����
-- �˻� �ӵ� ����� ���� ������ �� �̸� �տ� ���̺���� �ٿ��� �ۼ��ϴ� ���� ���� 

SELECT emp.ename, dept.loc, emp.job
    FROM emp, dept
    WHERE emp.deptno = dept.deptno
    AND emp.job = 'ANALYST';

-- ��� ����
--FORD	DALLAS	ANALYST
--SCOTT	DALLAS	ANALYST

-- �÷��� �տ� ���̺���� ������ ���̴� ���� ���̺���� �ݺ��ϸ鼭 �ڵ尡 ������� �ȴ�.
-- ���̺�� �ڿ� ���̺� ��Ī�� ����Ͽ� ���� �ڵ带 �� �����ϰ� �ۼ��Ѵ�.

SELECT e.ename, d.loc, e.job
    FROM emp e, dept d 
    WHERE e.deptno = d.deptno 
    AND e.job = 'ANALYST';

-- ��� ����
--FORD	DALLAS	ANALYST
--SCOTT	DALLAS	ANALYST

-- ���� ���ι����� emp�� e�� ����ǰ�, dept�� d�� ����Ǿ� �����
-- emp.ename���� �����ϸ� ������ �߻��Ѵ�.


SELECT emp.ename, d.loc, e.job
    FROM emp e, dept d 
    WHERE e.deptno = d.deptno 
    AND e.job = 'ANALYST';

-- ORA-00904: "EMP"."ENAME": �������� �ĺ���
-- ���ι��� FROM ������ ����Ǹ鼭 emp �� ���̺� ��Ī�� e�� ����Ǿ���
-- dept�� d�� ����Ǿ���.
-- emp.ename�̶�� ����� �� ����, e.ename�̶�� �ۼ��ؾ� �Ѵ�.
