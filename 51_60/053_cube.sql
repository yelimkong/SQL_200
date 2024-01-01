--053 ������ �м� �Լ��� ���� ��� ��� �� (CUBE)
-- ����, ������ ��Ż ���� ��� 
-- ù ��° �࿡ ��Ż ���� ��� 
SELECT job, SUM(sal)
    FROM emp
    GROUP BY CUBE(job);

-- ��� ����
--(null)  		    29025
--CLERK	        4150
--ANALYST	    6000
--MANAGER	8275
--SALESMAN	5600
--PRESIDENT	5000

-- CUBE�� �߰����� �ʾ��� �� 
SELECT job, SUM(sal)
    FROM emp
    GROUP BY job;
    
-- ��� ����
--PRESIDENT	5000
--MANAGER	8275
--SALESMAN	5600
--CLERK	        4150
--ANALYST	    6000

-- CUBE�� �߰� ���� �� 
SELECT job, SUM(sal)
    FROM emp
    GROUP BY CUBE(job);

-- ��� ����
--(null)  		    29025
--CLERK	        4150
--ANALYST	    6000
--MANAGER	8275
--SALESMAN	5600
--PRESIDENT	5000

SELECT deptno, job, sum(sal)
    FROM emp
    GROUP BY CUBE(deptno, job);
    
-- ��� ����
--	     (null)       	29025 �� ��Ż ���� ��� 
--   	CLERK	    4150  �� ������ ��Ż ���� ���
--	    ANALYST 	6000
--	    MANAGER	8275
--	    SALESMAN	5600
--	    PRESIDENT	5000
--10	(null)       	8750  �� �μ� ��ȣ�� ��Ż ������ ��� 
--10	CLERK	    1300  �� �μ� ��ȣ�� ��������Ż ���� ���
--10	MANAGER	2450
--10	PRESIDENT	5000
--20	(null)       	10875
--20	CLERK	    1900
--20	ANALYST	    6000
--20	MANAGER	2975
--30	(null)          9400
--30	CLERK	    950

-- GROUP BY CUBE(deptno, job)�� �� 4���� ��� ���� ����� ���´�.

--[���� ���]
-- ����ü ��Ż ������ �� ���� ���
-- �������� ��Ż ������ ��µ�
-- ��μ���ȣ�� ��Ż ���ް� �μ� ��ȣ�� ������ ��Ż ����
-- ����ü ��Ż ����