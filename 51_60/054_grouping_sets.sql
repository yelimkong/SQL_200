
--054 ������ �м� �Լ��� ���� ��� ��� �� (GROUPING SETS)
-- �μ� ��ȣ�� ����, �μ� ��ȣ�� ��Ż ���ް� ������ ��Ż ����, ��ü ��Ż ���� ���
SELECT deptno, job, SUM(sal)
    FROM emp
    GROUP BY GROUPING SETS((deptno), (job), ());

-- ��� ����
--deptno  job          SUM(sal)
--10       (null)	        8750
--30       (null)		    9400
--20       (null)      	10875
--(null)	PRESIDENT	5000
--(null)	MANAGER	8275
--(null)	SALESMAN	5600
--(null)	CLERK	    4150
--(null)	ANALYST 	6000
--(null)	(null)	        29025
-- GROUPING SETS�� �տ��� ��� ROLLUP�� CUBE���� ����� ����� �����ϱ� �� ����.
-- GROUPING SETS�� �����ϰ� ���� �÷����� ����ϸ� �״�� ��µǱ� �����̴�. 

-- GROUPING SETS ��ȣ �ȿ� �����ϰ� ���� �÷����� ����ϸ�, ����Ѵ�� ����� ������ָ� �ȴ�.

-- GROUPING SETS                           ��� ��� 
-- GROUPING SETS((deptno), (job), ())    �μ� ��ȣ�� ����, ������ ����, ��ü ���� 
-- GROUPING SETS((deptno), (job))        �μ� ��ȣ�� ����, ������ ����
-- GROUPING SETS((deptno, job), ())      �μ� ��ȣ�� ������ ����, ��ü ���� 
-- GROUPING SETS((deptno, job))         �μ� ��ȣ�� ������ ����
    
-- ROLLUP���� GROUPING SETS�� ����
-- �� ROLLUP ������� �� 
SELECT deptno, SUM(sal)
    FROM emp
    GROUP BY ROLLUP(deptno);
    
-- ��� ����
--10   	8750
--30	    9400
--20	    10875
--(null)	29025   

--�� GROUPING SETS ������� ��
SELECT deptno, SUM(sal)
    FROM emp
    GROUP BY GROUPING SETS((deptno), ());
    
-- ��� ����
--10   	8750
--30	    9400
--20	    10875
--(null)	29025 

-- ��ȣ ()�� ��ü�� �ǹ�
-- ��ü�� ������� ���� ���� 
-- �� ���� ��� ����� �����ϳ� GROUPING SETS�� ����� �����ϱ� �� ����.
 
    
-- ��Ż ���� �� �Ʒ��� ����� �� �Ǿ�.. UNION ALL�� ����Ͽ� ������ ����� �� ��ġ��   
-- �μ� ��ȣ�� ��Ż ���� ���
SELECT deptno, NULL AS job, SUM(sal) AS total_salary
FROM emp
GROUP BY deptno
UNION ALL
-- ������ ��Ż ���� ���
SELECT NULL AS deptno, job, SUM(sal)
FROM emp
GROUP BY job
UNION ALL
-- ��ü ��Ż ���� ���
SELECT NULL AS deptno, NULL AS job, SUM(sal)
FROM emp;
    

-- ��� ����
--deptno  job          total_salary
--10       (null)	        8750
--30       (null)		    9400
--20       (null)      	10875
--(null)	PRESIDENT	5000
--(null)	MANAGER	8275
--(null)	SALESMAN	5600
--(null)	CLERK	    4150
--(null)	ANALYST 	6000
--(null)	(null)	        29025

-------