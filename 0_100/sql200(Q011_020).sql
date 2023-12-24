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
    
------------------------------------------------------------------------------------
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
    
------------------------------------------------------------------------------------
-- 013 �񱳿����� �� (IS NULL)
-- Ŀ�̼��� NULL�� ������� �̸��� Ŀ�̼� ��ȸ 
SELECT ename, comm
    FROM emp
    WHERE comm IS NULL;
    
------------------------------------------------------------------------------------
-- 014 �񱳿����� �� (IN)
-- ������ SALESMAN, ANALYST, MANAGER�� ������� �̸�, ����, ���� ��ȸ 
SELECT ename, sal, job 
    FROM emp 
    WHERE job IN ('SALESMAN', 'ANALYST', 'MANAGER');

-- ���� ������ ��� ����ϴ� SQL
SELECT ename, sal, job 
    FROM emp 
    WHERE (job = 'SALESMAN' or job = 'ANALYST' or job = 'MANAGER');

-- ������ SALESMAN, ANALYST, MANAGER�� �ƴ� ������� �̸�, ����, ���� ��ȸ 
SELECT ename, sal, job 
    FROM emp 
    WHERE job NOT IN ('SALESMAN', 'ANALYST', 'MANAGER');

-- ���� ������ ��� ����ϴ� SQL
SELECT ename, sal, job 
    FROM emp 
    WHERE (job != 'SALESMAN' or job != 'ANALYST' or job != 'MANAGER');
     
------------------------------------------------------------------------------------
-- 015 �������� (AND, OR, NOT)
-- ������ ANALYST�̰�, ������ 1200 �̻��� ������� �̸�, ����, ���� ��ȸ
SELECT ename, sal, job 
    FROM emp 
    WHERE job = 'ANALYST' AND sal >= 1200 ;
    
-- �� �߿� �ϳ��� ������ FLASE�̸� ��ȯ���� ����
SELECT ename, sal, job 
    FROM emp 
    WHERE job = 'ABCDEF' AND sal >= 1200 ;
      
------------------------------------------------------------------------------------
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

------------------------------------------------------------------------------------
-- 017 ���ڿ��� Ư�� ö�� ����
-- ���� �ܾ� SMITH���� SMI�� �߶󳻼� ��� 
SELECT SUBSTR('SMITH', 1, 3)
    FROM DUAL;
    
------------------------------------------------------------------------------------
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

------------------------------------------------------------------------------------
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


-- �����ʿ� .com �߶󳻰� naver�� ��� 
SELECT RTRIM (SUBSTR('abcdefgh@naver.com', INSTR('abcdefgh@naver.com', '@') +1 ), '.com')
    FROM DUAL;

------------------------------------------------------------------------------------
-- 020 Ư�� ö�ڸ� �ٸ� ö�ڷ� ���� (REPLACE)
-- �̸��� ���� ���, ���� ��� �� ���� 0�� ��ǥ(*)�� ���
SELECT ename, REPLACE(sal, 0, '*')
    FROM emp;

-- ��� ���� 
--KING	5***
--BLAKE	285*
--CLARK	245*
--JONES	2975
--MARTIN	125*

-- �̸��� ���� ���, ���� ��� �� ���� 0~3�� ��ǥ(*)�� ���
SELECT ename, REGEXP_REPLACE(sal, '[0-3]', '*') SALARY
    FROM emp;

-- ��� ����
--KING	5***
--BLAKE	*85*
--CLARK	*45*
--JONES	*975
--MARTIN	**5*

-- �̸��� �� ��° �ڸ��� �ѱ��� *�� ��� 
SELECT REPLACE(ename, SUBSTR(ename, 2, 1), '*') ������_�̸�
    FROM emp ;

-- ��� ����
--K*NG
--B*AKE
--C*ARK
--J*NES
--M*RTIN

    