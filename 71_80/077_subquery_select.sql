--077  ���� ���� ����ϱ� �� (SELECT ���� ���� ����)
-- ������ SALESMAN�� ������� �̸��� ������ ����ϴµ�, 
-- ������ SALESMAN�� ������� �ִ� ���ް� �ּ� ���� ���

SELECT ename, sal, (SELECT MAX(sal) FROM emp WHERE job = 'SALESMAN' ) as "�ִ� ����",
                          (SELECT MIN(sal) FROM emp WHERE job = 'SALESMAN' ) as "�ּ� ����"
    FROM emp 
    WHERE job = 'SALESMAN';

-- ��� ����
-- MARTIN	1250	1600	1250
--ALLEN	    1600	1600	1250
--TURNER	1500	1600	1250
--WARD	    1250	1600	1250


--[ERROR] ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�
-- SELECT���� ���� ������ ����Ͽ� ������ SALESMAN�� ����� �ִ� ���ް� �ּ� ������ ���� ����ϰ� �ִ�.
-- SELECT ���� ���� ������ ������� �ʰ� ����ϸ� ������ ���� ������ �߻��Ѵ�. 
SELECT ename, sal, MAX(sal), MIN(sal)
    FROM emp 
    WHERE job = 'SALESMAN';
-- ��� ����
--[ERROR] ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�

-- SELECT���� ���� ������ ���������� SELECT ���� Ȯ��Ǿ��ٰ� �ؼ� ��Į��(scalar) ���� ������ �Ҹ��ϴ�. 
-- ��Į�� ���� ������ ��µǴ� �� ����ŭ �ݺ��Ǿ� �����մϴ�. 