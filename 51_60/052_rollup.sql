--052 ������ �м� �Լ��� ���� ��� ��� �� (ROLLUP)
-- ������ ������ ��Ż ���� ���, 
-- �� ������ �࿡ ��Ż ���� ��� 
SELECT job, SUM(sal)
    FROM emp
    GROUP BY ROLLUP(job);
    
-- ��� ����
--PRESIDENT	5000
--MANAGER	8275
--SALESMAN	5600
--CLERK      	4150
--ANALYST   	6000
--(null)           29025

-- ROLLUP�� �̿��Ͽ� ������ ��������Ż ���� ��� 
-- �� �Ʒ��ʿ� ��ü ��Ż ���� �߰������� ��� 

-- �� ROLLUP �߰����� �ʾ��� ��
SELECT job, SUM(sal)
    FROM emp
    GROUP BY job;

-- ��� ����
--PRESIDENT	5000
--MANAGER	8275
--SALESMAN	5600
--CLERK      	4150
--ANALYST	    6000 

-- �� ROLLUP �߰� ���� ��
SELECT job, SUM(sal)
    FROM emp
    GROUP BY ROLLUP(job);
    
-- ��� ����
--PRESIDENT	5000
--MANAGER	8275
--SALESMAN	5600
--CLERK      	4150
--ANALYST   	6000
--(null)           29025

--ROLLUP�� ����ϸ� �� �Ʒ��� ��Ż ���޵� ��µǰ� JOB �÷��� �����͵� ������������ ���ĵ�

-- ROLLUP�� �÷� 2���� ����� ��� 
SELECT deptno, job, SUM(sal)
    FROM emp
    GROUP BY ROLLUP(deptno, job)
    ORDER BY deptno, job;

-- ��� ����
--10	CLERK	    1300   ��
--10	MANAGER	2450   �� �μ���ȣ�� ������ ��Ż ���� ���
--10	PRESIDENT	5000   ��
--10	(null)  	    8750   ��  �μ� ��ȣ�� ��Ż ���� ���
--20	ANALYST	    6000
--20	CLERK    	1900
--20	MANAGER	2975
--20	(null)  	    10875
--30	CLERK    	950
--30	MANAGER	2850
--30	SALESMAN	5600
--30  	(null)       	9400
--(null)  (null)  		29025
        