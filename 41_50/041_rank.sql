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