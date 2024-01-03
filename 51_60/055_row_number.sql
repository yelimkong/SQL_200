--055 데이터 분석 함수로 출력 결과 넘버링 하기(ROW_NUMBER)
SELECT empno, ename, sal, RANK() OVER (ORDER BY sal DESC) RANK,
                                    DENSE_RANK() OVER (ORDER BY sal DESC) DENSE_RANK,
                                    ROW_NUMBER() OVER (ORDER BY sal DESC) 번호
    FROM emp
    WHERE deptno = 20;

-- 출력 예시
--EMPNO ENAME SAL RANK DENSE_RANK 번호
--7902	FORD	    3000	1	1	1
--7788	SCOTT	3000	1	1	2
--7566	JONES	2975	3	2	3
--7876	ADAMS	1100	4	3	4
--7369	SMITH	800	5	4	5

-- [ 결과 해석 ]
-- ROW_NUMBER()는 출력되는 각 행에 고유한 숫자 값을 부여하는 데이터 분석 함수
-- PSEUDOCOLUMN인 ROWNUM과 유사하며 RANK와 DENSE_NUMBER 분석 함수와는 다르다.
-- 첫 번째 행인 FORD와 두 번째 행인 SCOTT의 월급이 서로 같아 RANK와 DENSE_RANK는 순위를 둘 다 1로 출력하고 있으나,
-- ROW_NUMBER는 1, 2로 출력하고 있다.
-- ROW_NUMBER()는 출력되는 결과에 번호를 순서대로 부여해서 출력 
-- ROW_NUMBER() 함수는 OVER 다음 괄호 안에 반드시 ORDER BY 절을 기술해야 한다.
-- 그렇지 않으면 다음과 같이 에러가 발생 

--[ERROR]
--SELECT empno, ename, sal, ROW_NUMBER() OVER() 번호 
--    FROM emp
--    WHERE deptno = 20;

-- ORA-30485: 윈도우 지정에 ORDER BY 표현식이 없습니다

-- 부서 번호별로 월급에 대한 순위를 출력하는 쿼리
-- PARTITTION BY를 사용하여 부서 번호별로 파티션에서 순위를 부여
SELECT deptno, ename, sal, ROW_NUMBER() OVER(PARTITION BY deptno
                                                                    ORDER BY sal DESC) 번호 
    FROM emp
    WHERE deptno IN (10, 20);

-- 출력 예시
--deptno ename sal 번호
--10	KING   	5000	1
--10	CLARK	2450	2
--10	MILLER	1300	3
--20	FORD	    3000	1
--20	SCOTT	3000	2
--20	JONES	2975	3
--20	ADAMS	1100	4
--20	SMITH	800	5 
