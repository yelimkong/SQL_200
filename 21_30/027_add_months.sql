-- 027 ���� �� ���� ��¥ ���  (ADD_MONTHS)
-- 2019�� 5�� 1�Ϸκ��� 100�� ���� ��¥ ���ϱ� �� ADD_MONTHS
SELECT ADD_MONTHS(TO_DATE('2019-05-01', 'RRRR-MM-DD'), 100)
    FROM DUAL;

-- ��� ����
-- 27/09/01

-- 2019�� 5�� 1�Ϸκ��� 100�� ���� ��¥ ���ϱ� 
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + 100
    FROM DUAL;

-- ��� ����
-- 19/08/09

-- 2019�� 5�� 1�Ϸκ��� 100�� ���� ��¥ ���ϱ� �� INTERVAL �Լ�
-- INTERVAL �Լ��� ���� �����ϰ� ��¥ ��� ���� ���� ���� 
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + INTERVAL '100' MONTH
    FROM DUAL;

-- ��� ����
-- 27/09/01

-- 2019�� 5�� 1�Ϻ��� 1�� 3���� ���� ��¥ ��� 
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + INTERVAL'1-3' YEAR(1) TO MONTH
    FROM DUAL;

-- ��� ����
-- 20/08/01

-- 2019�� 5�� 1�Ϻ��� 3�� ���� ��¥ ��� 
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + INTERVAL '3' YEAR
    FROM DUAL;

-- ��� ���� 
-- 22/05/01

-- 2019�� 5�� 1�Ϻ��� 3�� 5���� ���� ��¥ ���
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + TO_YMINTERVAL('03-05') AS ��¥
    FROM DUAL;

-- ��� ���� 
-- 22/10/01