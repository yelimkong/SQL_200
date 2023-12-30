-- 047 COLUMN�� ROW�� ����ϱ� �� (SUM + DECODE)
-- �μ� ��ȣ, �μ� ��ȣ�� ��Ż ���� ���, ���η� ��� 
SELECT SUM(DECODE(deptno, 10, sal)) as "10",
           SUM(DECODE(deptno, 20, sal)) as "20",
           SUM(DECODE(deptno, 30, sal)) as "30"
    FROM emp;

-- ��� ���� 
-- 8750	10875	   9400

-- �μ� ��ȣ�� 10���̸� ������ ��µǰ� �ƴϸ� NULL�� ���
SELECT deptno, DECODE(deptno, 10, sal) as "10"
    FROM emp;

-- ��� ���� 
--10	5000
--30	(null)
--10	2450
--20	(null)
--30	(null)
--30	(null)
--30	(null)
--30	(null)
--30	(null)
--20	(null)
--20	(null)
--20	(null)
--20	(null)
--10	1300

-- �μ� ��ȣ�� 10���� ������� ������ ��
SELECT SUM(DECODE(deptno, 10, sal)) as "10"
    FROM emp;
    
-- ��� ���� 
-- 8750

-- ����, ������ ��Ż ���� ���, ���η� ���
-- ��� ���̺� ���� ������ �˾ƾ� ����� �� �ִ� ����
-- �𸥴ٸ� PL/SQL ����ؾ� ��
SELECT SUM(DECODE(job, 'ANALYST', sal)) as "ANALYST",
           SUM(DECODE(job, 'CLERK', sal)) as "CLERK",
           SUM(DECODE(job, 'CLERK', sal)) as "CLERK",
           SUM(DECODE(job, 'SALESMAN', sal)) as "SALESMAN"
    FROM emp;
           
-- ��� ����
-- 6000	4150	8275	5600

-- �μ���ȣ�� ������ ��Ż ���� ���� ��� 
SELECT deptno, SUM(DECODE(job, 'ANALYST', sal)) as "ANALYST",
                     SUM(DECODE(job, 'CLERK', sal)) as "CLERK",
                     SUM(DECODE(job, 'MANAGER', sal)) as "MANAGER",
                     SUM(DECODE(job, 'SALESMAN', sal)) as "SALESMAN"
    FROM emp
    GROUP BY deptno;
                     
-- ��� ���� 
--10	(null)	1300	2450	(null)
--30	(null)	950	2850	5600
--20	6000	1900	2975	(null)

-- [��� ��� �м�]
-- CLERK�� MANAGER�� ��� �μ��� ����������, 
-- ANALST�� 20������ ���� 
-- SALESMAN�� 30������ ���� 
