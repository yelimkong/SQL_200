--057 ��µǴ� �� �����ϱ� �� (Simple TOP-n Queries)
--������ ���� ��������� ��� ��ȣ, �̸�, ����, ������ 4���� ������ �����ؼ� ���
SELECT empno, ename, job, sal 
    FROM emp
    ORDER BY sal DESC FETCH FIRST 4 ROWS ONLY;

-- ��� ����
--7839	KING 	 PRESIDENT	    5000
--7902	FORD  	ANALYST	    3000
--7788	SCOTT	ANALYST	    3000
--7566	JONES	MANAGER	2975

--TOP-N-Query
-- : ���ĵ� ����κ��� ���� �Ǵ� �Ʒ����� N���� ���� ��ȯ�ϴ� ����
-- FETCH FIRST N ROWS ONLY�� ROWNUM���� �ܼ��ϰ� ����� ����� �� ����


-- ������ ���� ����� �� 20%�� �ش��ϴ� ����鸸 ���
SELECT empno, ename,  job, sal
    FROM emp
    ORDER BY sal DESC
    FETCH FIRST 20 PERCENT ROWS ONLY;

-- ��� ����
--7839	KING   	PRESIDENT	5000
--7788	SCOTT	ANALYST 	3000
--7902	FORD	    ANALYST  	3000

--WITH TIES �ɼ��� �̿��ϸ� ���� ���� N��° ���� ���� �����ϴٸ� ���� ����� �ش�.
--2 ROWS�� ����ؼ� 2���� ���� ��µ� �Ŷ� ����������, 
-- �����δ� 3���� ���� ��µǰ� �ִ�.
-- �� ��° ���� ���� 3000�� �� ��° ���� 3000�� �����ϱ� �����̴�.

SELECT empno, ename, job, sal
    FROM emp
    ORDER BY sal DESC FETCH FIRST 2 ROWS WITH TIES;

-- ��� ����
--7839	KING	    PRESIDENT	5000
--7902	FORD	    ANALYST	    3000
--7788	SCOTT	ANALYST	    3000
-- OFFSET �ɼ��� �̿��ϸ� ����� ���۵Ǵ� ���� ��ġ�� ������ �� �ִ�.

SELECT empno, ename, job, sal
    FROM emp
    ORDER BY sal DESC OFFSET 9 ROWS;

-- ��� ����
--7521	WARD	SALESMAN	1250
--7654	MARTIN	SALESMAN	1250
--7876	ADAMS	CLERK	    1100
--7900	JAMES	CLERK	    950
--7369	SMITH	CLERK	    800

-- ���� ������� ���� ���� ��� ��ȣ 7521�� ������ 1250���� ��� ���̺� ��ü ��� �߿� ������ 10��° (9 + 1) �� ���� ���
-- 10��° ����� ������ ����� ����Ѵ�.
-- OFFSET�� FETCH�� ������ ���� ���� �����ؼ� ����� �� �ִ�.

SELECT empno, ename, job, sal 
    FROM emp
    ORDER BY sal DESC OFFSET 9 ROWS
    FETCH FIRST 2 ROWS ONLY;

-- ��� ����
--7654	MARTIN	SALESMAN	1250
--7521	WARD	SALESMAN	1250

-- OFFSET 9�� ��µ� 5���� �� �߿��� 2���� �ุ ����ϰ� �ִ�.
