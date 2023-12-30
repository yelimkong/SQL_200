-- 035 IF���� SQL�� ���� �� (CASE)
-- �̸�, ����, ����, ���ʽ� ��� 
-- ���ʽ��� ������ 3000 �̻��̸� 500 ���
-- ������ 2000 �̻��̰� 3000 ���� ������ 300 ���
-- ������ 1000�̻��̰� 2000 ���� ������ 200 ��� 
-- ������ ������� 0 ��� 
SELECT ename, job, sal, CASE WHEN sal >= 3000 THEN 500
                                        WHEN sal >= 2000 THEN 300
                                        WHEN sal >= 1000 THEN 200
                                        ELSE 0 END AS BONUS 
    FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST');

-- ��� ���� 
--MARTIN	SALESMAN	1250	200
--ALLEN	SALESMAN	1600	200
--TURNER	SALESMAN	1500	200
--WARD	SALESMAN	1250	200
--FORD	ANALYST	3000	500

-- CASE�� DECODE�� ������ 
-- DECODE�� ��ȣ(=) �񱳸� ����, 
-- CASE�� ��ȣ�񱳿� �ε�ȣ (>=, <=, >, <) �� �� ���� 

-- �̸�, ����, Ŀ�̼�, ���ʽ� ��� 
-- ���ʽ��� Ŀ�̼��� NULL�̸� 500 ���
-- NULL�� �ƴϸ� 0�� ��� 
SELECT ename, job, comm, CASE WHEN comm is null then 500
                                            ELSE 0 END BONUS
    FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST');

-- ��� ����
--MARTIN	SALESMAN	1400	0
--ALLEN	SALESMAN	300	0
--TURNER	SALESMAN	0	0
--WARD	SALESMAN	500	0
--FORD	ANALYST		(null) 500

-- ���ʽ� ����� �� ������ 'SALESMAN', 'ANALYST' �̸� 500 ��� 
-- ������ 'CLECK', 'MANAGER' �̸� 400 ��� 
-- ������ ������ 0�� ��� 
SELECT ename, job, CASE WHEN job IN ( 'SALESMAN', 'ANALYST' ) THEN 500 
                                   WHEN job IN ('CLECK', 'MANAGER') THEN 400 
                                   ELSE 0 END BONUS
    FROM emp;
    
-- ��� ����
--KING	PRESIDENT	0
--BLAKE	MANAGER	400
--CLARK	MANAGER	400
--JONES	MANAGER	400
--MARTIN	SALESMAN	500