-- 041 ������ �м� �Լ��� ���� �� (RANK) 
-- ������ ANALYST, MANAGER�� ������� �̸�, ����, ����, ������ ���� ���
SELECT ename, job, sal, RANK() OVER (ORDER BY sal DESC) ����
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER');
 
-- ��� ���� 
--FORD	ANALYST	3000	1
--SCOTT	ANALYST	3000	1
--JONES	MANAGER	2975	3
--BLAKE	MANAGER	2850	4
--CLARK	MANAGER	2450	5
-- RANK �Լ� : 1���� 2���̾ 2���� ��µ��� �ʰ� �ٷ� 3�� ���

-- �������� ������ ���� ������� ���� �ο� 
SELECT ename, sal, job, RANK() OVER (PARTITION BY job
                                                    ORDER BY sal DESC) as ����
         FROM emp;

-- ��� ���� 
--SCOTT	3000	ANALYST	1
--FORD	3000	ANALYST	1
--MILLER	1300	CLERK	1
--ADAMS	1100	CLERK	2
--JAMES	950	CLERK	3
-- �������� ��� ������ �ο��ϱ� ����
-- ORDER BY �տ� PARTITION BY job �� ��� 

-----------------------------------------------------------------------

-- 042 ������ �м� �Լ��� ���� �� (DENSE_RANK) 
-- ������ ANALYST, MANAGER�� ������� �̸�, ����, ����, ������ ���� ���
-- 1���� ����� 2���� ���� ��� ���� ������ 3���� ��µ��� �ʰ� 2���� ���
SELECT ename, job, sal, RANK() OVER (ORDER BY sal DESC) as RANK,
                                DENSE_RANK() OVER (ORDER BY sal DESC) as DENSE_RANK
    FROM emp 
    WHERE job IN ('ANALYST', 'MANAGER'); 


-- ��� ���� 
--FORD	ANALYST	    3000	1	1
--SCOTT	ANALYST 	3000  1	1
--JONES	MANAGER	2975	3	2  RANK �Լ��� 3��, DENSE_RANK�� 2�� ���
--BLAKE	MANAGER	2850	4	3
--CLARK	MANAGER	2450	5	4

-- 81�⵵�� �Ի��� ������� ����, �̸�, ����, ���� ���
-- �������� ������ ���� ������� ���� �ο� 
SELECT job, ename, sal, DENSE_RANK() OVER (PARTITION BY job
                                                              ORDER BY sal DESC) ����
    FROM emp 
    WHERE hiredate BETWEEN TO_DATE('1981/01/01', 'RRRR/MM/DD')
                                AND TO_DATE('1981/12/31', 'RRRR/MM/DD');

-- ��� ���� 
--ANALYST	     FORD	3000	1
--CLERK	        JAMES	950	1
--MANAGER	JONES	2975	1
--MANAGER	BLAKE	2850	2
--MANAGER	CLARK	2450	3
--PRESIDENT	KING  	5000	1
--SALESMAN	ALLEN	1600	1
--SALESMAN	TURNER	1500	2
--SALESMAN	WARD	1250	3
--SALESMAN	MARTIN	1250	3


-- DENSE_RANK �ٷ� ������ ������ ��ȣ���� �����͸� �ְ� ����� �� �ִ�.
-- ������ 2975�� ����� ������ ������ ��� �Ǵ��� ��� 
-- DENSE_RANK �ٷ� ������ ������ ��ȣ �ȿ� ���� �Է�
-- �� ���� ������ ��ü������ ������ ��� �Ǵ��� ��� 
-- WHITIN : ~ �̳��� 
-- WHITIN GROUP : ��� �׷� �̳����� 2975�� ������ ��� �Ǵ��� 

SELECT DENSE_RANK(2975) WITHIN GROUP (ORDER BY sal desc) ����
    FROM emp;

-- ��� ���� 
-- ���� 
-- 3

-- �Ի��� 81�� 11�� 17�� ��� ���̺� ��ü ����� �� �� ��°�� �Ի��� ������ ���
SELECT DENSE_RANK('81/11/17') WITHIN GROUP (ORDER BY hiredate ASC) ���� 
    FROM emp;

-- ��� ���� 
-- ���� 
-- 9

-----------------------------------------------------------------------

-- 043 ������ �м� �Լ��� ��� ��� (NTILE)
-- �̸��� ����, ����, ������ ��� ��� 
-- ������ ����� 4������� ������
-- 1���(0 ~ 25%), 2���(25 ~ 50%), 3���(50 ~ 75%), 4���(75 ~ 100%)
SELECT ename, job, sal ,
          NTILE(4) OVER (ORDER BY sal DESC NULLS LAST) ���
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER', 'CLECK');

-- ��� ���� 
--FORD	ANALYST    3000	1
--SCOTT	ANALYST	    3000	1
--JONES	MANAGER	2975	2
--BLAKE	MANAGER	2850	3
--CLARK	MANAGER	2450	4

-- 1���(0 ~ 20%), 2���(20 ~ 40%), 3���(40 ~ 60%), 4���(60 ~ 80%), 5���(80 ~ 100%)
SELECT ename, job, sal ,
          NTILE(5) OVER (ORDER BY sal DESC NULLS LAST) ���
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER', 'CLECK');

-- ��� ���� 
--FORD	ANALYST	    3000	1
--SCOTT	ANALYST	    3000	2
--JONES	MANAGER	2975	3
--BLAKE	MANAGER	2850	4
--CLARK	MANAGER	2450	5 

-- ORDER BY sal DESC NULLS LAST���� 
-- NULLS LAST�� NULL�� �� �Ʒ��� ��� 
-- 1) NULLS LAST�� ��� �� ���� �� 
SELECT ename, comm
    FROM emp 
    WHERE deptno = 30 
    ORDER BY comm DESC;

-- ��� ���� 
--BLAKE	    (null)
--JAMES  	(null)
--MARTIN	1400
--WARD	    500
--ALLEN  	300
--TURNER	0

-- 2) NULLS LAST�� ��� ���� �� 
SELECT ename, comm
    FROM emp
    WHERE deptno = 30
    ORDER BY comm DESC NULLS LAST;
    
-- ��� ���� 
--MARTIN	1400
--WARD	    500
--ALLEN  	300
--TURNER	0
--BLAKE	    (null)
--JAMES  	(null)

-----------------------------------------------------------------------

-- 044 ������ �м� �Լ��� ������ ���� ��� (CUME_DIST)
-- �̸��� ����, ������ ����, ������ ���� ���� ���
SELECT ename, sal, RANK() OVER (ORDER BY sal DESC) as RANK,
                         DENSE_RANK() OVER (ORDER BY sal DESC) as DENSE_RANK,
                         ROUND(CUME_DIST() OVER (ORDER BY sal DESC),2) as CUME_DIST
    FROM emp;

---- ��� ���� 
--ename sal  RANK DENSE_RANK CUME_DIST
--KING	    5000	1	1	0.07
--SCOTT  	3000	2	2	0.21
--FORD	    3000	2	2	0.21
--JONES  	2975	4	3	0.29
--BLAKE  	2850	5	4	0.36
--CLARK   	2450	6	5	0.43
--ALLEN   	1600	7	6	0.5
--TURNER	1500	8	7	0.57
--MILLER	    1300	9	8	0.64
--WARD	    1250	10	9	0.79
--MARTIN	1250	10	9	0.79
--ADAMS	1100	12	10	0.86
--JAMES	    950	13	11	0.93
--SMITH	    800	14	12	1

-- PARTITION BY JOB �� ����� CUME_DIST�� ��� 
SELECT job, ename, sal, RANK() OVER (PARTITION BY job
                                                    ORDER BY sal DESC ) as RANK, 
                                ROUND(CUME_DIST() OVER (PARTITION BY job
                                                            ORDER BY sal DESC),2) as CUME_DIST
    FROM emp;

-- ��� ����
--  job,           ename,   sal,   RANK, CUME_DIST
--ANALYST   	SCOTT	3000	1	1
--ANALYST   	FORD	    3000	1	1
--CLERK       	MILLER	1300	1	0.25
--CLERK	        ADAMS	1100	2	0.5
--CLERK       	JAMES	950	3	0.75
--CLERK	        SMITH	800	4	1
--MANAGER	JONES	2975	1	0.33
--MANAGER	BLAKE	2850	2	0.67
--MANAGER	CLARK	2450	3	1
--PRESIDENT	KING	    5000	1	1
--SALESMAN	ALLEN	1600	1	0.25
--SALESMAN	TURNER	1500	2	0.5
--SALESMAN	MARTIN	1250	3	1
--SALESMAN	WARD	1250	3	1

-----------------------------------------------------------------------

-- 045 ������ �м� �Լ��� �����͸� ���η� ��� (LISTAGG)
-- �μ� ��ȣ�� ���, 
-- �μ� ��ȣ ���� �ش� �μ��� ���ϴ� ������� �̸��� ���η� ���
SELECT deptno, LISTAGG(ename, ',') WITHIN GROUP (ORDER BY ename) as EMPLOYEE
    FROM emp 
    GROUP BY deptno;

-- ��� ���� 
--10	CLARK,KING,MILLER
--20	ADAMS,FORD,JONES,SCOTT,SMITH
--30	ALLEN,BLAKE,JAMES,MARTIN,TURNER,WARD
-- LISTAGG : �����͸� ���η� ��� 

-- ������ �� ������ ���� ������� �̸��� ���η� ��� 
SELECT job, LISTAGG(ename, ',') WITHIN GROUP (ORDER BY ename ASC) as EMPLOYEE
    FROM emp 
    GROUP BY job;

-- ��� ���� 
--ANALYST	    FORD,SCOTT
--CLERK	        ADAMS,JAMES,MILLER,SMITH
--MANAGER	BLAKE,CLARK,JONES
--PRESIDENT	KING
--SALESMAN	ALLEN,MARTIN,TURNER,WARD

-- �̸� ���� ���޵� ���� ����Ϸ��� ���� �����ڸ� ���
-- �� �������� ������ ������ ��� �Ǵ��� �Ѵ��� Ȯ���� �� ����
SELECT job,
LISTAGG(ename||'(' ||sal||')',', ') WITHIN GROUP (ORDER BY ename ASC) as EMPLOYEE
    FROM emp 
    GROUP BY job;

-- ��� ���� 
--ANALYST	FORD(3000),SCOTT(3000)
--CLERK	ADAMS(1100),JAMES(950),MILLER(1300),SMITH(800)
--MANAGER	BLAKE(2850),CLARK(2450),JONES(2975)
--PRESIDENT	KING(5000)
--SALESMAN	ALLEN(1600),MARTIN(1250),TURNER(1500),WARD(1250)

-----------------------------------------------------------------------

-- 046 ������ �м� �Լ��� �ٷ� �� ��� ���� �� ��� (LAG, LEAD)
SELECT empno, ename, sal,
            LAG(sal, 1) OVER (ORDER BY sal ASC) "�� ��",
            LEAD(sal, 1) OVER (ORDER BY sal ASC) "���� ��"
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER');

-- ��� ���� 
-- empno ename  sal     LAG   LEAD
--7782	CLARK	2450	(null)  2850
--7698	BLAKE	2850	2450	2975
--7566	JONES	2975	2850	3000
--7902	FORD	    3000	2975	3000
--7788	SCOTT	3000	3000	(null) 
-- LAG : �ٷ� �� ���� ������ ���
-- LEAD : �ٷ� ���� ���� ������ ��� 

-- ������ ANALYST �Ǵ� MANAGER�� ������� ��� ��ȣ, �̸�, �Ի���,
-- �ٷ� ���� �Ի��� ����� �Ի���, �ٷ� ������ �Ի��� ����� �Ի��� ��� 
SELECT empno, ename, hiredate,
            LAG(hiredate, 1)  OVER (ORDER BY hiredate ASC) "�� ��",
            LEAD(hiredate, 1) OVER (ORDER BY hiredate ASC) "���� ��"
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER');

-- ��� ���� 
--7566	JONES	81/04/01		(null)         81/05/01
--7698	BLAKE	81/05/01 	81/04/01	   81/05/09
--7782	CLARK	81/05/09	    81/05/01	   81/12/11
--7902	FORD	    81/12/11	    81/05/09	   82/12/22
--7788	SCOTT	82/12/22  	81/12/11	   (null)

-- �μ� ��ȣ, ��� ��ȣ, �̸�, �Ի���, �ٷ� ���� �Ի��� ����� �Ի��� ���
-- �ٷ� ������ �Ի��� ����� �Ի��� ���
-- �μ� ��ȣ���� �����ؼ� ���
SELECT deptno, empno, ename, hiredate,
            LAG(hiredate, 1) OVER (PARTITION BY deptno ORDER BY hiredate ASC) "�� ��",
            LEAD(hiredate, 1) OVER (PARTITION BY deptno ORDER BY hiredate DESC) "���� ��"
    FROM emp;
    
-- ��� ���� 
--10	7782	CLARK	81/05/09	(null)     (null)
--10	7839	KING	    81/11/17	81/05/09	81/05/09
--10	7934	MILLER	82/01/11	81/11/17	81/11/17
--20	7369	SMITH	80/12/09 (null)     (null)	
--20	7566	JONES	81/04/01	80/12/09	80/12/09
--20	7902	FORD	    81/12/11	81/04/01	81/04/01
--20	7788	SCOTT	82/12/22	81/12/11	81/12/11
--20	7876	ADAMS	83/01/15	82/12/22	82/12/22
--30	7499	ALLEN	81/02/11	(null)     (null)	
--30	7521	WARD	81/02/23	81/02/11	81/02/11
--30	7698	BLAKE	81/05/01	81/02/23	81/02/23
--30	7844	TURNER	81/08/21	81/05/01	81/05/01
--30	7654	MARTIN	81/09/10	81/08/21	81/08/21
--30	7900	JAMES	81/12/11	81/09/10	81/09/10

-----------------------------------------------------------------------

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

-----------------------------------------------------------------------

-- 048 COLUMN�� ROW�� ��� �� (PIVOT)
-- �μ� ��ȣ, �μ� ��ȣ�� ��Ż ������ PIVOT�� ����ؼ� ���η� ��� 
SELECT *
    FROM (SELECT deptno, sal FROM emp)
    PIVOT (SUM(sal) for deptno IN (10, 20, 30));
    
-- ��� ���� 
-- 10      20      30 
-- 8750	10875	  9400

SELECT *
    FROM (SELECT job, sal FROM emp)
    PIVOT (SUM(sal) for JOB IN ('ANALYST', 'CLERK', 'MANAGER', 'SALESMAN')) ;

SELECT DISTINCT(job)
    FROM emp;

-- ��� ���� 
-- 'ANALYST', 'CLERK', 'MANAGER', 'SALESMAN'
-- 6000	4150	8275	5600

-- [�ؼ�]
-- ��µǴ� ����� �ʿ��� �����Ͱ� �ִ� �÷��� ������ ������ �����Ѵ�.
-- ������ �ʿ��� �÷��� ������ ���޻�
-- PIVOT���� ����� ���� FROM ���� ��ȣ�� ����ؼ� Ư�� �÷��� �����ؾ� �մϴ�. 
-- FROM emp ��� �ۼ��ϸ� ������ �߻� 
-- �ݵ�� ��ȣ �ȿ� ����� �ʿ��� �÷��� �����ϴ� ������ �ۼ��ؾ� �� 

-- PIVOT���� �̿��ؼ� ��Ż ���� ��� 
-- in ������ ��Ż ������ ����� ���� ����Ʈ�� ����
-- �̱� �����̼� ��ũ�� ��µ��� �ʰ� �Ϸ��� ������ ���� as �ڿ� �ش� ������
-- ���� �����̼����� �ѷ��� �ۼ��ϰ� �Ǹ� �̱� �����̼� ��ũ ���� ����� ��������
SELECT *
    FROM (SELECT job, sal FROM emp) 
    PIVOT (SUM(sal) for job IN ('ANALYST' as "ANALYST", 'CLERK' as "CLERK", 'MANAGER' as "MANAGER",
                                        'SALESMAN' as "SALESMAN") ) ;

-- ��� ���� 
-- ANALYST CLERK MANAGER SALESMAN
-- 6000	4150	8275	5600


-----------------------------------------------------------------------

drop table order2;

create  table  order2
( ename    varchar2(10),
   bicycle     number(10),
   camera    number(10),
   notebook   number(10) );

insert  into  order2  values('SMITH', 2, 3, 1);
insert  into  order2  values('ALLEN', 1, 2, 3);
insert  into  order2  values('KING', 3, 2, 2 );
commit;


-- 049 ROW�� COLUMN���� ��� (UNPIVOT)
SELECT * 
    FROM order2
    UNPIVOT (�Ǽ� for ������ IN (BICYCLE, CAMERA, NOTEBOOK));

-- ��� 
-- ename, ������, �Ǽ�
--SMITH	BICYCLE   	2
--SMITH	CAMERA  	3
--SMITH	NOTEBOOK	1
--ALLEN	BICYCLE	    1
--ALLEN	CAMERA	    2
--ALLEN	NOTEBOOK	3
--KING	BICYCLE	    3
--KING	CAMERA	    2
--KING	NOTEBOOK	2

SELECT * 
    FROM order2
    UNPIVOT (�Ǽ� for ������ IN (BICYCLE as 'B', CAMERA as 'C', NOTEBOOK as 'N'));

-- ��� ���� 
--SMITH	B	2
--SMITH	C	3
--SMITH	N	1
--ALLEN	B	1
--ALLEN	C	2
--ALLEN	N	3
--KING	B	3
--KING	C	2
--KING	N	2

-----------------------------------------------------------------------

-- 050 ������ �м� �Լ��� ���� ������ ��� (SUM OVER)
SELECT empno, ename, sal, SUM(sal) OVER (ORDER BY empno ROWS
                                                          BETWEEN UNBOUNDED PRECEDING
                                                          AND CURRENT ROW) ����ġ
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER');

-- ��� ���� 
--7566	JONES	2975	2975
--7698	BLAKE	2850	5825
--7782	CLARK	2450	8275
--7788	SCOTT	3000	11275
--7902	FORD	    3000	14275
