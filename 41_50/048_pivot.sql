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

