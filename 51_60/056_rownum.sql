--056 출력되는 행 제한하기 ① (ROWNUM)
-- 사원 테이블에서 사원 번호, 이름, 직업, 월급을 상단 5개의 행만 출력
SELECT empno, ename, job, sal
    FROM emp
    WHERE ROWNUM <= 5;
    

-- 출력 예시
--7839	KING	PRESIDENT	5000
--7698	BLAKE	MANAGER	2850
--7782	CLARK	MANAGER	2450
--7566	JONES	MANAGER	2975
--7654	MARTIN	SALESMAN	1250

-- 맨 위쪽 5개의 행만 출력하는 쿼리
-- ROWNUM은 PSEUDO COLUMN으로 '가짜의'라는 뜻 그대로 별표(*)로 검색해서는 출력되지 않는 감춰진 컬럼
-- 가짜 컬럼인 ROWNUM을 WHERE 절에 사용하여 위의예제와 같이 5개의 행으로 제한하면,
-- 사원 테이블 전체를 다 읽지 않고 5개의 행만 읽어 출력한다
-- 그래서 대용량 테이블의 데이터 상단 행만 잠깐 살펴볼 때 유용하게 사용할 수 있다.