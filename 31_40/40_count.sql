-- 040 �Ǽ� ��� (COUNT)
--  ��� ���̺� ��ü ����� ��� 
SELECT COUNT(empno)
    FROM emp;

-- ��� ����
-- 14

SELECT COUNT(*)
    FROM emp;
    
-- ��� ����
-- 14

-- COUNT(empno)�� EMP�� ī��Ʈ�ϰ�, COUNT(*)�� ��ü ���� �ϳ��� ī��Ʈ ��
-- Ŀ�̼��� ī��Ʈ�ϸ� 4�� ��� �ȴ�.
-- Ŀ�̼� ī��Ʈ 
SELECT COUNT(comm)
    FROM emp;

-- ��� ����
-- 4
-- Ŀ�̼��� NULL�� �ƴ� ����� 4�� ī��Ʈ�ϰ� ��� ��� 
-- �׷��Լ� COUNT�� NULL���� COUNT���� ����
-- ��հ��� ����� ���� Ư�� NULL���� �� ����ؾ� �� 
