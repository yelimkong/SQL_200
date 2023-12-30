-- 030 ���������� ������ ���� ��ȯ (TO_CHAR)
-- �̸��� SCOTT�� ����� �̸��� �Ի��� ���� ���,
-- SCOTT�� ���޿� õ ���� ��� 
SELECT ename, TO_CHAR(hiredate, 'DAY') as "����", TO_CHAR(sal, '999,999') as "����"
    FROM emp
    WHERE ename = 'SCOTT';

-- ��� ����
-- SCOTT	������	   3,000

-- KING ����� �Ի����� ����, ��, ��, ���� ��� 
SELECT TO_CHAR(hiredate, 'RRRR') as ����, TO_CHAR(hiredate, 'MM') as ��,
           TO_CHAR(hiredate, 'DD') as ��, TO_CHAR(hiredate, 'DAY') as ����
           FROM emp
           WHERE ename = 'KING';

-- ��� ����
-- 1981	11	17	ȭ����

-- 1981�⵵�� �Ի��� ����� �̸��� �Ի��� ��� 
SELECT ename, hiredate
    FROM emp
    WHERE TO_CHAR(hiredate, 'RRRR') = '1981';
 
-- ��� ���� 
--KING	81/11/17
--BLAKE	81/05/01
--CLARK	81/05/09
--JONES	81/04/01
--MARTIN	81/09/10

-- ������� �Ի� �⵵/��/���� ���
SELECT ename as �̸�, EXTRACT(year from hiredate) as ����,
                               EXTRACT(month from hiredate) as ��,
                               EXTRACT(day from hiredate) as ����
         FROM emp;

-- ��� ���� 
--KING	1981	11	17
--BLAKE	1981	5	1
--CLARK	1981	5	9
--JONES	1981	4	1
--MARTIN	1981	9	10

-- ����� �̸�, ������ õ ���� ǥ���ؼ� ��� 
SELECT ename as �̸�, TO_CHAR(sal, '999,999') as ���� 
    FROM emp;

-- ��� ����
--KING	   5,000
--BLAKE	   2,850
--CLARK	   2,450
--JONES	   2,975
--MARTIN	   1,250

-- ������ õ ������ �鸸 ���� ǥ���ؼ� ��� 
SELECT ename as �̸�, TO_CHAR(sal*200, '999,999,999') as ����
    FROM emp;

--��� ����
--KING	   1,000,000
--BLAKE	     570,000
--CLARK	     490,000
--JONES	     595,000
--MARTIN	     250,000

-- ���ĺ� L�� ����ϸ� ȭ�� ����\(��ȭ)�� �ٿ� ��� ���� 
SELECT ename as �̸�, TO_CHAR(sal * 200, 'L999,999,999') as ���� 
    FROM emp;

--��� ����
--KING	          ��1,000,000
--BLAKE	            ��570,000
--CLARK	            ��490,000
--JONES	            ��595,000
--MARTIN	            ��250,000