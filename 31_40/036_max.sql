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