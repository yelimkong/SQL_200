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
