-- 011 �񱳿����ڨ� (BETWEEN AND)
-- ������ 1000���� 3000 ������ ������� �̸��� ���� ��� 
SELECT ename, sal
    FROM emp 
    WHERE sal BETWEEN 1000 AND 3000;
    
-- ������ 1000�� 3000�� ����, �� SQL�� ����
SELECT ename, sal 
    FROM emp 
    WHERE (sal >= 1000 AND sal <= 3000) ;
    
-- ������ 1000���� 3000 ���̰� �ƴ� ������� �̸��� ���� ��� 
SELECT ename, sal 
    FROM emp 
    WHERE sal NOT BETWEEN 1000 AND 3000;
    
-- ������ 1000�� 3000�� ���Ե��� ����, �� SQL�� ����
SELECT ename, sal
    FROM emp
    WHERE (sal < 1000 OR sal > 3000) ;
    
-- 1982�⿡ �Ի��� ������� �̸��� �Ի��� ��ȸ 
SELECT ename, hiredate 
    FROM emp 
    WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31';
    