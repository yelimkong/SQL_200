-- 012 �񱳿����� �� (LIKE)
-- �̸��� ù ���ڰ� S�� �����ϴ� ������� �̸��� ���� ��ȸ 
SELECT ename, sal
    FROM emp 
    WHERE ename LIKE 'S%';
    
-- �̸��� �� ��° ö�ڰ� M�� ����� �̸� ��ȸ 
SELECT ename
    FROM emp 
    WHERE ename LIKE '_M%';
    
-- �̸��� �� ���ڰ� T�� ������ ��� �̸� ��ȸ 
SELECT ename
    FROM emp 
    WHERE ename LIKE '%T';
    
-- �̸��� A�� ���ԵǴ� ����� �̸��� ��ȸ 
SELECT ename
    FROM emp 
    WHERE ename LIKE '%A%';