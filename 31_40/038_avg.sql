-- 038 ��հ� ��� (AVG)
-- ��� ���̺��� ��� Ŀ�̼� ��� 
-- �׷� �Լ��� NULL���� ������
SELECT  AVG(comm) 
    FROM emp;

-- ��� ����
-- 550

SELECT comm
    FROM emp;

-- ��� ����
--(null)
--(null)
--(null)
--(null)
--1400
--300
--0
--(null)
--500
--(null)
--(null)
--(null)
--(null)
--(null)

--NULL ���� 10���̰�, 
--NULL �� �ƴ� ���� 4�� ���� 

SELECT ROUND(AVG(NVL(comm, 0)))
    FROM emp;
    
-- ��� ����
-- 157
-- 157�� ��µǴ� ���� : Ŀ�̼��� �� ���� �Ŀ� 14�� �������� ������ 