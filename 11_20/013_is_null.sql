-- 013 �񱳿����� �� (IS NULL)
-- Ŀ�̼��� NULL�� ������� �̸��� Ŀ�̼� ��ȸ 
SELECT ename, comm
    FROM emp
    WHERE comm IS NULL;
    
-- ��� ��� 
--KING	    (null)
--BLAKE   	(null)
--CLARK   	(null)
--JONES   	(null)
--JAMES	    (null)
--FORD	    (null)
--SMITH	    (null)
--SCOTT   	(null)
--ADAMS	(null)
--MILLER	    (null)

-- NULL���� �����Ͱ� �Ҵ���� ���� ���¶�� �ϰ� �� �� ���� ���̶�� �Ѵ�. 
-- �� �� ���� ���̱� ������ ���� ������(=)�δ� ���� �� ����. 
-- NULL���� �˻��ϱ� ���ؼ��� is null �����ڸ� �˻��ؾ� �Ѵ�. 

-- NULL �� �ƴ� �����͸� �˻��� ������ COMM != NULL�� ����Ͽ� �˻��� �� ����
-- NULL�� �����Ͱ� ���� �����̰� �� �� ���� ���̱� �����̴�.