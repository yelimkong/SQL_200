-- 050 데이터 분석 함수로 누적 데이터 출력 (SUM OVER)
SELECT empno, ename, sal, SUM(sal) OVER (ORDER BY empno ROWS
                                                          BETWEEN UNBOUNDED PRECEDING
                                                          AND CURRENT ROW) 누적치
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER');

-- 출력 예시 
--7566	JONES	2975	2975
--7698	BLAKE	2850	5825
--7782	CLARK	2450	8275
--7788	SCOTT	3000	11275
--7902	FORD	    3000	14275

--UNBOUNDED PRECEDING은 제일 첫 번째 행을 가리킨다.
-- 제일 첫 번째 행의 값은 2975
-- BETWEEN UNBOUNDED AND CURRENT ROW는 제일 첫 번째 행부터 현재 행까지의 값 
-- 두 번째 행의 누적치 5825는 제일 첫 번째 행의 값인 
-- 2975와 현재 행의 값인 2850을 합계한 결과 