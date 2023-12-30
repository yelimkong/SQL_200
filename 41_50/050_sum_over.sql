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

--UNBOUNDED PRECEDING�� ���� ù ��° ���� ����Ų��.
-- ���� ù ��° ���� ���� 2975
-- BETWEEN UNBOUNDED AND CURRENT ROW�� ���� ù ��° ����� ���� ������� �� 
-- �� ��° ���� ����ġ 5825�� ���� ù ��° ���� ���� 
-- 2975�� ���� ���� ���� 2850�� �հ��� ��� 