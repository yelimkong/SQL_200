--074 서브 쿼리 사용하기 ④ (EXISTS와 NOT EXISTS)
-- 부서 테이블에 있는 부서 번호 중에서 사원 테이블에도 존재하는 부서 번호의 부서 번호, 부서명,
-- 부서 위치를 출력 
SELECT *
    FROM dept d
    WHERE EXISTS (SELECT *
                            FROM emp e
                            WHERE e.deptno = d.deptno) ; 

-- 출력 예시
--10	ACCOUNTING	NEW YORK
--30	SALES	            CHICAGO
--20	RESEARCH	    DALLAS


-- 테이블 A에 존재하는 데이터가 테이블 B에 존재하는지 여부를 확인할 때 EXISTS 또는 
-- NOT EXISTS를 사용합니다. 
-- 위의 예제는 DEPT 테이블에 존재하는 부선 번호가 EMP 테이블에도 존재하는지 검색하는 쿼리입니다. 

-- WHERE 절 바로 다음에 EXISTS문을 작성합니다. 따로 컬럼명을 기술하지 않습니다. 

-- e.deptno = d.deptno 조건에 의하여 emp 테이블의 부서 번호가 dept 테이블에도 존재하는지 검색하게 됩니다. 

-- DEPT 테이블의 10번이 EMP 테이블에도 존재하는지 처음부터 검색합니다.
-- 존재하면 10번 CLARK 뒤로 더 이상 스캔하지 않습니다. 
-- 존재하는지 확인되었으므로 더 이상 읽지 않습니다. 
-- 그 다음 DEPT 테이블에서 20번이 EMP 테이블에 존재하는지 확인합니다. 
-- 첫 번째 행에서 확인하면 되기 때문에 EMP 테이블의 데이터가 아무리 많아도 처음부터 스캔하다가
-- 부서 번호가 존재하기만 하면 스캔을 멈춥니다.

-- DEPT 테이블에는 존재하는 부서 번호인데 EMP 테이블에 존재하지 않는 데이터를 검색할 때는
-- 다음과 같이 NOT EXISTS문을 사용합니다. 

SELECT *
    FROM dept d
    WHERE NOT EXISTS ( SELECT *
                                    FROM emp e 
                                    WHERE e.deptno = d.deptno ) ;

-- 출력 예시
-- 40	OPERATIONS	BOSTON
