-- 031 ��¥������ ������ ���� ��ȯ�ϱ� (TO_DATE)
SELECT ename, hiredate 
    FROM emp 
    WHERE hiredate = TO_DATE('81/11/17', 'RR/MM/DD');

-- ��� ���� 
-- KING	81/11/17

-- ���� ������ ������ ��¥ ���� Ȯ��
SELECT * 
    FROM NLS_SESSION_PARAMETERS
    WHERE parameter = 'NLS_DATE_FORMAT' ;
    
-- ��� ���� 
-- NLS_DATE_FORMAT	RR/MM/DD


SELECT ename, hiredate 
    FROM emp 
    WHERE hiredate = '81/11/17';

-- ��� ���� 
-- KING	81/11/17

-- ��¥ ���� ����  -> ��/��/��
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/RR';

SELECT ename, hiredate
    FROM emp
    WHERE hiredate = '17/11/81';

-- ��� ����
-- KING	17/11/81

-- ��¥ ���� ����  -> ��/��/��
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';