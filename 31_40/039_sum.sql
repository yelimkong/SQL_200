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