-- 031 ��¥������ ������ ���� ��ȯ�ϱ� (TO_DATE)
SELECT ename, hiredate 
    FROM emp 
    WHERE hiredate = TO_DATE('81/11/17', 'RR/MM/DD');

-- ��� ���� 
-- KING	81/11/17

-- ���� ������ ������ ��¥ ���� Ȯ��
SELECT * 
    FROM NLS_SESSION_PARAMETERS
    WHERE parameter = 'NLS_DATE_FORMAT' ;
    
-- ��� ���� 
-- NLS_DATE_FORMAT	RR/MM/DD


SELECT ename, hiredate 
    FROM emp 
    WHERE hiredate = '81/11/17';

-- ��� ���� 
-- KING	81/11/17

-- ��¥ ���� ����  -> ��/��/��
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/RR';

SELECT ename, hiredate
    FROM emp
    WHERE hiredate = '17/11/81';

-- ��� ����
-- KING	17/11/81

-- ��¥ ���� ����  -> ��/��/��
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

------------------------------------------------------------------------

-- 032 �Ͻ��� �� ��ȯ
SELECT ename, sal
    FROM emp 
    WHERE sal = '3000';

-- ��� ���� 
--FORD	3000
--SCOTT	3000

--sal�� ������ �������ε� '3000'�� ���������� ���ϰ� ���� 

-- sal�� �Ϻη� ���������� ����� ���� 
CREATE TABLE EMP32
(ENAME VARCHAR2(10), 
SAL VARCHAR2(10));

INSERT INTO EMP32 VALUES('SCOTT', '3000');
INSERT INTO EMP32 VALUES('SMITH', '1200');
COMMIT;

-- ������ = ������
SELECT ename, sal 
    FROM emp32
    WHERE sal = '3000';

--��� ���� 
--SCOTT	3000

-- ������ = ������
SELECT ename, sal 
    FROM emp32
    WHERE sal = 3000;
    
--��� ���� 
--SCOTT	3000

SELECT ename, sal
    FROM emp32
    WHERE TO_NUMBER(SAL) = 3000;

--��� ���� 
--SCOTT	3000

SET AUTOT ON 

SELECT ename, sal 
    FROM emp32
    WHERE sal = 3000;

--�ڵ� ���� ���
--���� ��ȹ�� ��ɹ� ��踦 ǥ���մϴ�.
-->>Query Run In:
--
--PLAN_TABLE_OUTPUT                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SQL_ID  4q3hu9pkhyzth, child number 0
---------------------------------------
--SELECT ename, sal      FROM emp32     WHERE sal = 3000
-- 
--Plan hash value: 4161066290
-- 
----------------------------------------------
--| Id  | Operation         | Name  | E-Rows |
----------------------------------------------
--|   0 | SELECT STATEMENT  |       |        |
--|*  1 |  TABLE ACCESS FULL| EMP32 |      1 |
--
--PLAN_TABLE_OUTPUT                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------
-- 
--Predicate Information (identified by operation id):
-----------------------------------------------------
-- 
--   1 - filter(TO_NUMBER("SAL")=3000)
 
-- ����Ŭ�� �Ͻ������� �������� ���������� ����ȯ��

------------------------------------------------------------------------

-- 033 NULL�� ��� �ٸ� ������ ��� (NVL, NVL2)
-- �̸��� Ŀ�̼� ���, Ŀ�̼��� NULL �� ������� 0���� ��� 
SELECT ename, NVL(comm, 0)
    FROM emp ; 

-- ��� ����
--KING	0
--BLAKE	0
--CLARK	0
--JONES	0
--MARTIN	1400

-- �̸�, ����, ���� + Ŀ�̼� ��ȸ 
-- NULL + 100 = NULL
SELECT ename, sal, comm, sal + comm
    FROM emp ;

-- ��� ���� 
--KING	    5000	(null) (null)
--BLAKE	    2850	(null) (null)
--CLARK	    2450	(null) (null)
--JONES  	2975	(null) (null)
--MARTIN	1250	1400  2650

-- NULL�� �� �� ���� ���̹Ƿ� NULL�� 0���� ġȯ�Ͽ� ���� +Ŀ�̼� ���
SELECT ename, sal, NVL(comm, 0), sal+NVL(comm, 0)
    FROM emp;

--��� ����
--KING	5000	0	5000
--BLAKE	2850	0	2850
--CLARK	2450	0	2450
--JONES	2975	0	2975
--MARTIN	1250	1400	2650

-- NVL2 ����Ͽ� Ŀ�̼��� NULL�� �ƴ� ����� sal + comm, 
-- Ŀ�̼��� NULL�� ������� sal ��� 
SELECT ename, sal, comm, NVL2(comm, sal + comm, sal)
    FROM emp;

--��� ����
--KING	5000		5000
--BLAKE	2850		2850
--CLARK	2450		2450
--JONES	2975		2975
--MARTIN	1250	1400	2650

------------------------------------------------------------------------

-- 034 IF���� SQL�� ���� �� (DECODE)
-- �μ���ȣ�� 10���̸� 300
-- �μ���ȣ�� 20���̸� 400
-- �μ���ȣ�� 10��, 20���� �ƴϸ� 0���� ���
SELECT ename, deptno, DECODE(deptno, 10, 300, 20, 400, 0) as ���ʽ�
    FROM emp;

--��� ����
--KING	10	300
--BLAKE	30	0
--CLARK	10	300
--JONES	20	400
--MARTIN	30	0

-- IF�� / ���� 
-- IF DEPTNO = 10 THEN 300 / �μ���ȣ�� 10���̸� 300�� ��� 
-- ELSE IF DEPTNO = 20 THEN 400 / �μ���ȣ�� 20���̸� 400�� ���
-- ELSE 0 / ���� ���ǿ� �� �ش���� �ʴ´ٸ� 0 ��� 

-- �����ȣ�� �����ȣ�� ¦������ Ȧ������ ���
SELECT empno, MOD(empno, 2), DECODE(MOD(empno, 2), 0, '¦��', 1, 'Ȧ��') as ���ʽ�
    FROM emp;

--��� ����
--7369	1	Ȧ��
--7499	1	Ȧ��
--7521	1	Ȧ��
--7566	0	¦��
--7654	0	¦��

-- IF�� / ���� 
--IF MOD(empno, 2), 0 THEN '¦��' / MOD(empno, 2)�� 0�̸� '¦��' ��� 
--ELSE IF MOD(empno, 2), 1 THEN 'Ȧ��' / MOD(empno, 2)�� 1�̸� 'Ȧ��' ���
--ELSE 0 / ���� ���ǿ� �� �ش���� �ʴ´ٸ� 0 ���

-- �̸��� ������ ���ʽ����, 
-- ������ SALESMAN�̸� ���ʽ� 5000�� ���, �������� ���ʽ� 2000 ��� 
SELECT ename, job, DECODE(job, 'SALESMAN', 5000, 2000) as ���ʽ� 
    FROM emp;

--��� ����
--KING	PRESIDENT	2000
--BLAKE	MANAGER	2000
--CLARK	MANAGER	2000
--JONES	MANAGER	2000
--MARTIN	SALESMAN	5000

-- IF�� / ���� 
--IF job, 'SALESMAN' THEN 5000 / ������ SALESMAN�̸� 5000 ���
--ELSE 2000 / �׷��� �ʴٸ� 2000 ���

------------------------------------------------------------------------

-- 035 IF���� SQL�� ���� �� (CASE)
-- �̸�, ����, ����, ���ʽ� ��� 
-- ���ʽ��� ������ 3000 �̻��̸� 500 ���
-- ������ 2000 �̻��̰� 3000 ���� ������ 300 ���
-- ������ 1000�̻��̰� 2000 ���� ������ 200 ��� 
-- ������ ������� 0 ��� 
SELECT ename, job, sal, CASE WHEN sal >= 3000 THEN 500
                                        WHEN sal >= 2000 THEN 300
                                        WHEN sal >= 1000 THEN 200
                                        ELSE 0 END AS BONUS 
    FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST');

-- ��� ���� 
--MARTIN	SALESMAN	1250	200
--ALLEN	SALESMAN	1600	200
--TURNER	SALESMAN	1500	200
--WARD	SALESMAN	1250	200
--FORD	ANALYST	3000	500

-- CASE�� DECODE�� ������ 
-- DECODE�� ��ȣ(=) �񱳸� ����, 
-- CASE�� ��ȣ�񱳿� �ε�ȣ (>=, <=, >, <) �� �� ���� 

-- �̸�, ����, Ŀ�̼�, ���ʽ� ��� 
-- ���ʽ��� Ŀ�̼��� NULL�̸� 500 ���
-- NULL�� �ƴϸ� 0�� ��� 
SELECT ename, job, comm, CASE WHEN comm is null then 500
                                            ELSE 0 END BONUS
    FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST');

-- ��� ����
--MARTIN	SALESMAN	1400	0
--ALLEN	SALESMAN	300	0
--TURNER	SALESMAN	0	0
--WARD	SALESMAN	500	0
--FORD	ANALYST		(null) 500

-- ���ʽ� ����� �� ������ 'SALESMAN', 'ANALYST' �̸� 500 ��� 
-- ������ 'CLECK', 'MANAGER' �̸� 400 ��� 
-- ������ ������ 0�� ��� 
SELECT ename, job, CASE WHEN job IN ( 'SALESMAN', 'ANALYST' ) THEN 500 
                                   WHEN job IN ('CLECK', 'MANAGER') THEN 400 
                                   ELSE 0 END BONUS
    FROM emp;
    
-- ��� ����
--KING	PRESIDENT	0
--BLAKE	MANAGER	400
--CLARK	MANAGER	400
--JONES	MANAGER	400
--MARTIN	SALESMAN	500

------------------------------------------------------------------------

-- 036 �ִ밪 ��� (MAX)
-- ��� ���̺��� �ִ� ������ ��� 
SELECT MAX(sal)
    FROM emp;

-- ��� ����
-- 5000

-- ������ SALESMAN�� ��� �� �ִ� ���� ��� 
SELECT MAX(sal)
    FROM emp 
    WHERE job = 'SALESMAN';
    
-- ��� ����
-- 1600

-- (error)������ ������ SALESMAN�� ��� �� �ִ� ���� ��� 
SELECT job, MAX(sal)
    FROM emp 
    WHERE job = 'SALESMAN';
-- ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�    
-- ���� �߻� ���� : job Ŀ���� ���� ���� ���� ���� ��µǷ��� �ϴµ� 
-- MAX(sal) ���� �ϳ��� ���� �ϳ��� ��µǷ� �ϱ� ������ ������ �߻�
-- GROUP BY job���� ������ �׷����ϸ� ����� �� ��µ�

-- (error)�̸��� ������ SALESMAN�� ��� �� �ִ� ���� ��� 
SELECT job, MAX(sal)
    FROM emp 
    WHERE job = 'SALESMAN'
    GROUP BY job;

-- ��� ����
-- SALESMAN	1600

-- �μ� ��ȣ�� �μ� ��ȣ�� �ִ� ���� ���
SELECT deptno, MAX(deptno)
    FROM emp
    GROUP BY deptno;
    
-- ��� ����
-- 10	10
-- 30	30
-- 20	20
------------------------------------------------------------------------

-- 037 �ּҰ� ��� (MIN)
-- SALESMAN �� ����� �� �ּ� ������ ���
SELECT MIN(sal)
    FROM emp
    WHERE job = 'SALESMAN';

-- ��� ����
-- 1250

-- ������ ������ �ּ� ���� ��� 
-- ORDER BY ���� ����Ͽ� �ּ� ������ ���� �ͺ��� ���
--  ORDER BY ���� �׻� �� �������� �ۼ��ϰ� ���� ���� �� �������� ����
SELECT job, MIN(sal) as �ּҰ�
    FROM emp
    GROUP BY job
    ORDER BY �ּҰ� DESC;

-- ��� ����
--PRESIDENT	5000
--ANALYST	3000
--MANAGER	2450
--SALESMAN	1250
--CLERK	800

-- �׷� �Լ��� Ư¡�� WHERE���� ������ �����̾ ����� ����Ѵٴ� �� 
SELECT MIN(sal) 
    FROM emp 
    WHERE 1 = 2;

-- ��� ����
-- (null)
-- WHERE ���� 1=2�� ������ ���������� �����
-- NULL�� ��µǾ����� NVL �Լ� ����غ��� �� �� ���� 
SELECT NVL(MIN(sal), 0)
    FROM emp 
    WHERE 1 = 2;

-- ��� ����
-- 0 

-- ����, ������ �ּ� ���� ��� 
-- �������� SALESMAN�� �����ϰ� ����ϰ� ������ �ּ� ������ ���� �ͺ��� ��� 
SELECT job, MIN(sal) 
    FROM emp 
    WHERE job != 'SALESMAN'
    GROUP BY job 
    ORDER BY MIN(sal) DESC;

-- ��� ����
--PRESIDENT	5000
--ANALYST	3000
--MANAGER	2450
--CLERK	800

------------------------------------------------------------------------

-- 038 ��հ� ��� (AVG)
-- ��� ���̺��� ��� Ŀ�̼� ��� 
-- �׷� �Լ��� NULL���� ������
SELECT  AVG(comm) 
    FROM emp;

-- ��� ����
-- 550

SELECT comm
    FROM emp;

-- ��� ����
--(null)
--(null)
--(null)
--(null)
--1400
--300
--0
--(null)
--500
--(null)
--(null)
--(null)
--(null)
--(null)

--NULL ���� 10���̰�, 
--NULL �� �ƴ� ���� 4�� ���� 

SELECT ROUND(AVG(NVL(comm, 0)))
    FROM emp;
    
-- ��� ����
-- 157
-- 157�� ��µǴ� ���� : Ŀ�̼��� �� ���� �Ŀ� 14�� �������� ������ 

------------------------------------------------------------------------

-- 039 ��Ż�� ��� (SUM)
-- �μ� ��ȣ�� �μ� ��ȣ�� ��Ż ���� ��� 
SELECT deptno, SUM(sal) 
    FROM emp 
    GROUP BY deptno;
    
-- ��� ����
--10	8750
--30	9400
--20	10875

-- ������ ������ ��Ż ������ ��� 
-- ������ ��Ż ������ ���� �ͺ��� ���
SELECT job, SUM(sal)
    FROM emp
    GROUP BY job
    ORDER BY SUM(sal) DESC;

-- ��� ����
--MANAGER	8275
--ANALYST	6000
--SALESMAN	5600
--PRESIDENT	5000
--CLERK	4150

-- ������ ������ ��Ż ���� ���
-- (error)������ ��Ż ������ 4000 �̻��� �͸� ��� 
SELECT job, SUM(sal)
    FROM emp
    WHERE SUM(sal) >= 4000
    GROUP BY job;
-- ORA-00934: �׷� �Լ��� �㰡���� �ʽ��ϴ� 

--(����)������ ��Ż ������ 4000 �̻��� �͸� ��� 
SELECT job, SUM(sal)
    FROM emp
    GROUP BY job
    HAVING SUM(sal) >= 4000;

-- ��� ����
--PRESIDENT	5000
--MANAGER	8275
--SALESMAN	5600
--CLERK	4150
--ANALYST	6000

-- ������ ������ ��Ż ���� ����ϴµ� �������� SALESMAN�� �����ϰ� 
-- ������ ��Ż ������ 4000�̻��� ��� ��� 
SELECT job, SUM(sal)
    FROM emp
    WHERE job != 'SALESMAN'
    GROUP BY job
    HAVING SUM(sal) >= 4000;

-- ��� ����
--PRESIDENT	5000
--MANAGER	8275
--CLERK	4150
--ANALYST	6000

-- (error)������ ������ ��Ż ���� ����ϴµ� �������� SALESMAN�� �����ϰ� 
-- ������ ��Ż ������ 4000�̻��� ��� ��� 
SELECT job as ����, SUM(sal)
    FROM emp
    WHERE job != 'SALESMAN'
    GROUP BY ����
    HAVING SUM(sal) >= 4000;
-- ORA-00904: "����": �������� �ĺ���

--���� ����
-- FROM �� WHERE �� GROUP BY �� HAVING �� SELECT  �� ORDER BY 

------------------------------------------------------------------------

-- 040 �Ǽ� ��� (COUNT)
--  ��� ���̺� ��ü ����� ��� 
SELECT COUNT(empno)
    FROM emp;

-- ��� ����
-- 14

-- Ŀ�̼� ī��Ʈ 
SELECT COUNT(comm)
    FROM emp;

-- ��� ����
-- 4
-- �׷��Լ� COUNT�� NULL���� COUNT���� ����
-- ��հ��� ����� ���� Ư�� NULL���� �� ����ؾ� �� 
