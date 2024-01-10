--071 ���� ���� ����ϱ� �� (������ ��������)
--JONES ���� �� ���� ������ �޴� ������� �̸��� ������ ���
SELECT ename, sal
    FROM emp 
    WHERE sal > (SELECT sal
                        FROM emp 
                        WHERE ename = 'JONES');
                        
-- ��� ����
--KING	5000
--FORD	3000
--SCOTT	3000 

--[���]
-- JONES���� �� ���� ������ �޴� ������� �˻��Ϸ��� 
-- ���� JONES�� ������ �������� �˾ƾ� �Ѵ�
-- 1. JONES�� ������ �˻��ϴ� ����
SELECT ename, sal
    FROM emp
    WHERE ename = 'JONES';

-- ��� ����
--JONES	2975


--2. JONES�� ������ 2975�� ������ �� ���� ���� ������� �̸��� ���� ���
SELECT ename, sal
    FROM emp
    WHERE sal > 2975;

-- ��� ����
--KING	5000
--FORD	3000
--SCOTT	3000

-- 3. �̿� ���� ������ �� ���� �����ؾ� ����� �� �� �ִ�,
-- �׷��� ������������ ����ϸ� ������ ���� �� ���� ����� ����� �� �ִ�.
SELECT ename, sal                                     -- ���� ����
    FROM emp 
    WHERE sal > (SELECT sal                        --  ���� ����
                        FROM emp 
                        WHERE ename = 'JONES');
                        
-- ��ȣ�� ���δ� �������� ����(sub) �����̴�.
-- JONES�� ������ ����ϴ� �������� ���� ���� ������ �ۼ��Ͽ� �� ���� �����Ѵ�.

-- SCOTT�� ���� ������ �޴� ������� �̸��� ������ ����ϴ� ����
SELECT ename, sal
    FROM emp
    WHERE sal = (SELECT sal
                        FROM emp
                        WHERE ename = 'SCOTT');
                        
-- ��� ����
--FORD	3000
--SCOTT	3000

-- ����� ���� SCOTT�� ���� ��µǾ���.
-- SCOTT�� ��µ��� �ʰ� �Ϸ��� ������ ���� ���� ������ ������ �߰��ϸ� �ȴ�.

SELECT ename, sal
    FROM emp
    WHERE sal = (SELECT sal
                        FROM emp
                        WHERE ename = 'SCOTT')
    AND ename != 'SCOTT';
    
-- ��� ����
-- FORD	3000
