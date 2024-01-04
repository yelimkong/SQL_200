--055 ������ �м� �Լ��� ��� ��� �ѹ��� �ϱ�(ROW_NUMBER)
SELECT empno, ename, sal, RANK() OVER (ORDER BY sal DESC) RANK,
                                    DENSE_RANK() OVER (ORDER BY sal DESC) DENSE_RANK,
                                    ROW_NUMBER() OVER (ORDER BY sal DESC) ��ȣ
    FROM emp
    WHERE deptno = 20;

-- ��� ����
--EMPNO ENAME SAL RANK DENSE_RANK ��ȣ
--7902	FORD	    3000	1	1	1
--7788	SCOTT	3000	1	1	2
--7566	JONES	2975	3	2	3
--7876	ADAMS	1100	4	3	4
--7369	SMITH	800	5	4	5

-- [ ��� �ؼ� ]
-- ROW_NUMBER()�� ��µǴ� �� �࿡ ������ ���� ���� �ο��ϴ� ������ �м� �Լ�
-- PSEUDOCOLUMN�� ROWNUM�� �����ϸ� RANK�� DENSE_NUMBER �м� �Լ��ʹ� �ٸ���.
-- ù ��° ���� FORD�� �� ��° ���� SCOTT�� ������ ���� ���� RANK�� DENSE_RANK�� ������ �� �� 1�� ����ϰ� ������,
-- ROW_NUMBER�� 1, 2�� ����ϰ� �ִ�.
-- ROW_NUMBER()�� ��µǴ� ����� ��ȣ�� ������� �ο��ؼ� ��� 
-- ROW_NUMBER() �Լ��� OVER ���� ��ȣ �ȿ� �ݵ�� ORDER BY ���� ����ؾ� �Ѵ�.
-- �׷��� ������ ������ ���� ������ �߻� 

--[ERROR]
--SELECT empno, ename, sal, ROW_NUMBER() OVER() ��ȣ 
--    FROM emp
--    WHERE deptno = 20;

-- ORA-30485: ������ ������ ORDER BY ǥ������ �����ϴ�

-- �μ� ��ȣ���� ���޿� ���� ������ ����ϴ� ����
-- PARTITTION BY�� ����Ͽ� �μ� ��ȣ���� ��Ƽ�ǿ��� ������ �ο�
SELECT deptno, ename, sal, ROW_NUMBER() OVER(PARTITION BY deptno
                                                                    ORDER BY sal DESC) ��ȣ 
    FROM emp
    WHERE deptno IN (10, 20);

-- ��� ����
--deptno ename sal ��ȣ
--10	KING   	5000	1
--10	CLARK	2450	2
--10	MILLER	1300	3
--20	FORD	    3000	1
--20	SCOTT	3000	2
--20	JONES	2975	3
--20	ADAMS	1100	4
--20	SMITH	800	5 
