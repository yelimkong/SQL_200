--060 여러 테이블의 데이터를 조인해서 출력 ③ (OUTER JOIN)
-- 사원(EMP) 테이블과 부서(DEPT) 테이블을 조인해서 이름과 부서 위치를 출력하는데, 
-- BOSTON 도 같이 출력되게 하기
SELECT e.ename, d.loc
    FROM emp e, dept d
    WHERE e.deptno (+) = d.deptno;

-- 출력 예시
--KING	    NEW YORK
--BLAKE	    CHICAGO
--CLARK	    NEW YORK
--JONES	    DALLAS
--MARTIN	CHICAGO
--ALLEN	    CHICAGO
--TURNER	CHICAGO
--JAMES	    CHICAGO
--WARD	    CHICAGO
--FORD	    DALLAS
--SMITH	    DALLAS
--SCOTT	    DALLAS
--ADAMS	DALLAS
--MILLER	    NEW YORK
--(null)	    BOSTON -- EQUI JOIN 과는 다르게 BOSTON이 출력되고 있다.

-- [결과]
-- EQUI JOIN 시 EMP와 DEPT 테이블과의 조인 결과에서 BOSTON 이 출력되지 않았다
-- BOSTON이 출력되지 않은 이우는 EMP 테이블에 40번 부서 번호가 없어서
-- DEPT 테이블과 조인이 되지 않았기 때문

--"BOSTON에는 사원이 배치되지 않았다"는 정보를 한 눈에 확인하려면 
-- OUTER JOIN 을 사용해야 한다.

-- OUTER JOIN은 기존 EQUI JOIN문법에 OUTER 조인 사인 (+)만 추가한 것이다.

-- WHERE e.deptno (+) = d.deptno ;
--OUTER JOIN 사인 (+) 는 EMP와 DEPT 테이블 중 결과가 덜 나오는 쪽에 붙여준다.

-- 위의 결과에서는 EMP 테이블의 ENAME 데이터가 DEPT 테이블의 LOC 데이터보다
-- 모자라게 출력되고 있으므로 EMP 테이블 쪽에 (+) 를 붙여준다.

-- EQUI JOIN은 양쪽에 다 존재하는 데이터만 출력한다. 
-- RIGHT OUTER JOIN은 DEPT 테이블에서는 존재하고 EMP 테이블에 존재하지 않는 데이터도 출력한다.
-- LEFT OUTER JOIN은 EMP 테이블에는 존재하는데 
-- DEPT 테이블에는 존재하지 않는 데이터도 출력한다.