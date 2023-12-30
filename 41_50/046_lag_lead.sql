-- 046 ������ �м� �Լ��� �ٷ� �� ��� ���� �� ��� (LAG, LEAD)
SELECT empno, ename, sal,
            LAG(sal, 1) OVER (ORDER BY sal ASC) "�� ��",
            LEAD(sal, 1) OVER (ORDER BY sal ASC) "���� ��"
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER');

-- ��� ���� 
-- empno ename  sal     LAG   LEAD
--7782	CLARK	2450	(null)  2850
--7698	BLAKE	2850	2450	2975
--7566	JONES	2975	2850	3000
--7902	FORD	    3000	2975	3000
--7788	SCOTT	3000	3000	(null) 
-- LAG : �ٷ� �� ���� ������ ���
-- LEAD : �ٷ� ���� ���� ������ ��� 

-- ������ ANALYST �Ǵ� MANAGER�� ������� ��� ��ȣ, �̸�, �Ի���,
-- �ٷ� ���� �Ի��� ����� �Ի���, �ٷ� ������ �Ի��� ����� �Ի��� ��� 
SELECT empno, ename, hiredate,
            LAG(hiredate, 1)  OVER (ORDER BY hiredate ASC) "�� ��",
            LEAD(hiredate, 1) OVER (ORDER BY hiredate ASC) "���� ��"
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER');

-- ��� ���� 
--7566	JONES	81/04/01		(null)         81/05/01
--7698	BLAKE	81/05/01 	81/04/01	   81/05/09
--7782	CLARK	81/05/09	    81/05/01	   81/12/11
--7902	FORD	    81/12/11	    81/05/09	   82/12/22
--7788	SCOTT	82/12/22  	81/12/11	   (null)

-- �μ� ��ȣ, ��� ��ȣ, �̸�, �Ի���, �ٷ� ���� �Ի��� ����� �Ի��� ���
-- �ٷ� ������ �Ի��� ����� �Ի��� ���
-- �μ� ��ȣ���� �����ؼ� ���
SELECT deptno, empno, ename, hiredate,
            LAG(hiredate, 1) OVER (PARTITION BY deptno ORDER BY hiredate ASC) "�� ��",
            LEAD(hiredate, 1) OVER (PARTITION BY deptno ORDER BY hiredate DESC) "���� ��"
    FROM emp;
    
-- ��� ���� 
--10	7782	CLARK	81/05/09	(null)     (null)
--10	7839	KING	    81/11/17	81/05/09	81/05/09
--10	7934	MILLER	82/01/11	81/11/17	81/11/17
--20	7369	SMITH	80/12/09 (null)     (null)	
--20	7566	JONES	81/04/01	80/12/09	80/12/09
--20	7902	FORD	    81/12/11	81/04/01	81/04/01
--20	7788	SCOTT	82/12/22	81/12/11	81/12/11
--20	7876	ADAMS	83/01/15	82/12/22	82/12/22
--30	7499	ALLEN	81/02/11	(null)     (null)	
--30	7521	WARD	81/02/23	81/02/11	81/02/11
--30	7698	BLAKE	81/05/01	81/02/23	81/02/23
--30	7844	TURNER	81/08/21	81/05/01	81/05/01
--30	7654	MARTIN	81/09/10	81/08/21	81/08/21
--30	7900	JAMES	81/12/11	81/09/10	81/09/10