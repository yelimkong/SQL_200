-- 028 Ư�� ��¥ �ڿ� ���� ���� ��¥ ��� (NEXT_DAY)
-- 2019�� 5�� 22�Ϸκ��� �ٷ� ���ƿ� �������� ��¥ ��� 
SELECT '2019/05/22' AS ��¥, NEXT_DAY('2019/05/22', '������')
    FROM DUAL;

-- ��� ���� 
-- 2019/05/22	19/05/27
    
-- ���� ��¥ ��� 
SELECT SYSDATE as "���� ��¥"
    FROM DUAL;
    
-- ��� ����
-- 23/12/25

-- ���ú��� ������ ���ƿ� ȭ������ ��¥ ��� 
SELECT NEXT_DAY(SYSDATE, 'ȭ����') AS "���� ��¥"
    FROM DUAL;

-- ��� ���� 
-- 23/12/26

-- 2019�� 5�� 22�Ϻ��� 100�� �ڿ� ���ƿ��� ȭ������ ��¥ ��� 
SELECT NEXT_DAY(ADD_MONTHS('2019/05/22', 100), 'ȭ����') AS "���� ��¥"
    FROM DUAL;

-- ��� ���� 
-- 27/09/28

-- ���ú��� 100�� �ڿ� ���ƿ��� �������� ��¥ ��� 
SELECT NEXT_DAY(ADD_MONTHS(SYSDATE, 100), '������') AS "���� ��¥"
    FROM DUAL;

-- ��� ���� 
-- 32/04/26