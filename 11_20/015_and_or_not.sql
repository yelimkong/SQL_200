-- 015 �������� (AND, OR, NOT)
-- ������ ANALYST�̰�, ������ 1200 �̻��� ������� �̸�, ����, ���� ��ȸ
SELECT ename, sal, job 
    FROM emp 
    WHERE job = 'ANALYST' AND sal >= 1200 ;

-- ��� ����
--FORD	3000	ANALYST
--SCOTT	3000	ANALYST
    
-- �� �߿� �ϳ��� ������ FLASE�̸� ��ȯ���� ����
SELECT ename, sal, job 
    FROM emp 
    WHERE job = 'ABCDEF' AND sal >= 1200 ;
    
-- TRUE AND TRUE �� TRUE
-- TRUE AND FALSE �� FALSE
-- TRUE AND NULL �� NULL
-- NULL�� �� �� ���� ���̱� ����