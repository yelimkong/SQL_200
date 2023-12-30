-- 045 ������ �м� �Լ��� �����͸� ���η� ��� (LISTAGG)
-- �μ� ��ȣ�� ���, 
-- �μ� ��ȣ ���� �ش� �μ��� ���ϴ� ������� �̸��� ���η� ���
SELECT deptno, LISTAGG(ename, ',') WITHIN GROUP (ORDER BY ename) as EMPLOYEE
    FROM emp 
    GROUP BY deptno;

-- ��� ���� 
--10	CLARK,KING,MILLER
--20	ADAMS,FORD,JONES,SCOTT,SMITH
--30	ALLEN,BLAKE,JAMES,MARTIN,TURNER,WARD
-- LISTAGG : �����͸� ���η� ��� 

-- ������ �� ������ ���� ������� �̸��� ���η� ��� 
SELECT job, LISTAGG(ename, ',') WITHIN GROUP (ORDER BY ename ASC) as EMPLOYEE
    FROM emp 
    GROUP BY job;

-- ��� ���� 
--ANALYST	    FORD,SCOTT
--CLERK	        ADAMS,JAMES,MILLER,SMITH
--MANAGER	BLAKE,CLARK,JONES
--PRESIDENT	KING
--SALESMAN	ALLEN,MARTIN,TURNER,WARD

-- �̸� ���� ���޵� ���� ����Ϸ��� ���� �����ڸ� ���
-- �� �������� ������ ������ ��� �Ǵ��� �Ѵ��� Ȯ���� �� ����
SELECT job,
LISTAGG(ename||'(' ||sal||')',', ') WITHIN GROUP (ORDER BY ename ASC) as EMPLOYEE
    FROM emp 
    GROUP BY job;

-- ��� ���� 
--ANALYST	FORD(3000),SCOTT(3000)
--CLERK	ADAMS(1100),JAMES(950),MILLER(1300),SMITH(800)
--MANAGER	BLAKE(2850),CLARK(2450),JONES(2975)
--PRESIDENT	KING(5000)
--SALESMAN	ALLEN(1600),MARTIN(1250),TURNER(1500),WARD(1250)