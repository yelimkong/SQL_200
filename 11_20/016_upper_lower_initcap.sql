-- 016 ��ҹ��� ��ȯ �Լ� (UPPER, LOWER, INITCAP)
-- ù ��° �÷� : �̸� �빮��, �� ��° �÷� : �̸� �ҹ���, 
-- �� ��° �÷� : �̸��� ù ��° ö�� �빮�� �������� �ҹ��� 
SELECT UPPER(ename), LOWER(ename), INITCAP(ename)
    FROM emp ;

-- ��� ��� ���� 
--KING	king	King
--BLAKE	blake	Blake
--CLARK	clark	Clark
--JONES	jones	Jones
--MARTIN	martin	Martin

-- �̸��� scott�� ����� �̸��� ���� ��ȸ 
SELECT ename, sal
    FROM emp 
    WHERE LOWER(ename) = 'scott';

-- ��� ����
-- SCOTT	 3000
-- LOWER(ename) : �빮�ڿ��� ��� �̸��� �ҹ��ڷ� ��ȯ 

