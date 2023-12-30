-- 022 Ư�� ö�� �߶󳻱� (TRIM, RTRIM, LTRIM)
-- ù ��° �÷��� ���� �ܾ� smith ö�� ���, 
-- �� ��° �÷��� ���� �ܾ� smith ���� s�� �߶� ��� 
-- �� ��° �÷��� ���� �ܾ� smith ���� h�� �߶� ��� 
-- �� ��° �÷��� smiths�� ���ʿ� s�� �߶� ��� 
SELECT 'smith', LTRIM('smith', 's'), RTRIM('smith', 'h'), TRIM('s' from 'smiths')
    FROM dual;

-- ��� ����
--smith	mith	smit	mith

-- ���ο� JACK ��� ������ ����
INSERT INTO emp(empno, ename, sal, job, deptno) values(8291, 'JACK   ', 3000, 'SALESMAN', 30);
COMMIT;

-- JACK ����� �̸��� ���� ��ȸ 
SELECT ename, sal
     FROM emp
     WHERE ename = 'JACK';
-- ��� ��ȸ �� �� 

SELECT ename, sal
     FROM emp
     WHERE RTRIM(ename) = 'JACK';

-- ��� ���� 
--JACK   	3000

-- ���ο� JACK ��� ������ ����
DELETE FROM emp WHERE TRIM(ename) = 'JACK' ; 
COMMIT;
    