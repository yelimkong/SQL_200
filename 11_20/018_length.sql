-- 018 ���ڿ��� ���� ��� (LENGTH)
SELECT ename, LENGTH(ename)
    FROM emp;

-- ��� ��� ����
--KING	4
--BLAKE	5
--CLARK	5
--JONES	5
--MARTIN	6

-- LENGTH(ename)�� �̸� ö���� ���� ���
SELECT LENGTH('�����ٶ�')
    FROM DUAL;

-- ��� ��� 
-- 5 

-- LENGTHB �� ����Ʈ�� ���� ��ȯ 
SELECT LENGTHB('�����ٶ�')
    FROM DUAL;

-- ��� ��� 
-- 15
