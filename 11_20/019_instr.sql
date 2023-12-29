-- 019 ���ڿ��� Ư�� ö���� ��ġ ���(INSTR)
-- ��� �̸� SMITH���� ���ĺ� ö�� M�� �� ��° �ڸ��� �ִ��� ��� 
SELECT INSTR('SMITH', 'M')
    FROM DUAL;

-- ��� ��� 
-- 2

-- abcdefg@naver.com �̸��Ͽ��� naver.com�� �����ϰ� �ʹٸ� 
-- INSTR�� SUBSTR�� �̿��Ͽ� ���� ���� 
SELECT INSTR('abcdefgh@naver.com', '@')
     FROM DUAL;

-- ��� ��� 
-- 9

SELECT SUBSTR('abcdefgh@naver.com', INSTR('abcdefgh@naver.com', '@') +1 )
    FROM DUAL;

-- ��� ��� 
-- naver.com

-- �����ʿ� .com �߶󳻰� naver�� ��� 
SELECT RTRIM (SUBSTR('abcdefgh@naver.com', INSTR('abcdefgh@naver.com', '@') +1 ), '.com')
    FROM DUAL;

-- ��� ��� 
-- naver

