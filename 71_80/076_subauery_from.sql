--076 ���� ���� ����ϱ� �� (FROM ���� ���� ����)
-- �̸��� ���ް� ������ ����ϴµ� ������ 1���� ����� ��� 
SELECT v.ename, v.sal, v.����
    FROM (SELECT ename, sal, rank() over (order by sal desc) ����
                FROM emp) v
    WHERE v.���� = 1;

-- ��� ����
-- KING	5000	1

-- ���� ���� FROM���� ���� ������ in line view��� �մϴ�. 
-- FROM ���� �̸��� ����, ���޿� ���� ������ ������ ����ϴ� ������ ���� ������ ����߽��ϴ�. 
-- ���� ������ ��Ī�� v�� �����߽��ϴ�. 
-- ���� ������ ������� �ʰ� ������ ���� SQL�� �ۼ��Ѵٸ� ������ �߻��մϴ�.
-- [ERROR] ORA-30483: ������ �Լ��� ���⿡ ����� �� �����ϴ�
SELECT ename, sal, rank() over (order by sal desc) ���� 
    FROM emp 
    WHERE rank() over (order by sal desc) = 1;

-- WHERE������ �м� �Լ��� ����� �� �����ϴ�. 
-- �׷��� FROM ���� ���� �������� ����Ͽ� ���� �������� ���� ����ǰ� �ϰ� 
-- ��µ� ��� �����͸� �ϳ��� �������� ����ϴ�. 

-- FROM ������ ���� ��� ������ ��� ���̺��� ��� �̸��� ���ް� ���޿� ���� �����Դϴ�. 
-- �� �߿��� ������ 1���� ����� �����͸� �����ϴ�. 