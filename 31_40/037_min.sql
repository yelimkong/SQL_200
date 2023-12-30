-- 037 �ּҰ� ��� (MIN)
-- SALESMAN �� ����� �� �ּ� ������ ���
SELECT MIN(sal)
    FROM emp
    WHERE job = 'SALESMAN';

-- ��� ����
-- 1250

-- ������ ������ �ּ� ���� ��� 
-- ORDER BY ���� ����Ͽ� �ּ� ������ ���� �ͺ��� ���
--  ORDER BY ���� �׻� �� �������� �ۼ��ϰ� ���� ���� �� �������� ����
SELECT job, MIN(sal) as �ּҰ�
    FROM emp
    GROUP BY job
    ORDER BY �ּҰ� DESC;

-- ��� ����
--PRESIDENT	5000
--ANALYST	3000
--MANAGER	2450
--SALESMAN	1250
--CLERK	800

-- �׷� �Լ��� Ư¡�� WHERE���� ������ �����̾ ����� ����Ѵٴ� �� 
SELECT MIN(sal) 
    FROM emp 
    WHERE 1 = 2;

-- ��� ����
-- (null)
-- WHERE ���� 1=2�� ������ ���������� �����
-- NULL�� ��µǾ����� NVL �Լ� ����غ��� �� �� ���� 
SELECT NVL(MIN(sal), 0)
    FROM emp 
    WHERE 1 = 2;

-- ��� ����
-- 0 

-- ����, ������ �ּ� ���� ��� 
-- �������� SALESMAN�� �����ϰ� ����ϰ� ������ �ּ� ������ ���� �ͺ��� ��� 
SELECT job, MIN(sal) 
    FROM emp 
    WHERE job != 'SALESMAN'
    GROUP BY job 
    ORDER BY MIN(sal) DESC;

-- ��� ����
--PRESIDENT	5000
--ANALYST	3000
--MANAGER	2450
--CLERK	800