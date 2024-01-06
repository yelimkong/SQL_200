--058 여러 테이블의 데이터를 조인해서 출력 ① (EQUI JOIN)
-- 사원(EMP) 테이블과 부서(DEPT) 테이블을 조인하여 이름과 부서 위치를 출력 
SELECT ename, loc
    FROM emp, dept
    WHERE emp.deptno = dept.deptno;

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


-- [해석]
-- 서로 다른 테이블에 있는 컬럼들을 하나의 결과로 출력하려면 조인(JOIN)을 사용해야 한다.
-- ename은 emp 테이블에 있고 loc는 dept 테이블에 존재하므로 ename과 loc를 
-- 하나의 결과로 출력하기 위해서는 from절에 emp와 dept 둘 다 기술한다.

-- emp와 dept를 조인하기 위해서는 조인 조건이 있어야 한다,
-- 조인 조건은 두 개의 테이블을 해결하기 위한 연결고리이다. 
-- emp 테이블에도 deptno가 존재하고 dept 테이블에도 deptno에도 존재하므로 
-- 'emp 테이블의 부서 번호는 dept 테이블의 부서 번호가 같다' 라는 조건 
-- emp.deptno = dept.deptno를 주어 조인을 수행한다.

-- 조인 조건을 주지 않고 다음과 같이 조인을 하게 되면 전부다 조인이 되어 
-- 56개(14 X 4)의 행이 출력된다.


SELECT ename, sal
    FROM emp, dept;

-- 출력 예시
--KING	    5000
--BLAKE	    2850
--CLARK	    2450
--JONES	    2975
--MARTIN	1250
-- :
--FORD   	3000
--SMITH    	800
--SCOTT	    3000
--ADAMS	1100
--MILLER	    1300
-- WHERE 절에 조인 조건을 정확하게 작성하고 조인을 하게 되면 14개의 행만 출력 
-- 조인이 되어 14개의 행이 출력되는 원리는 다음과 같다 
-- 먼저 사원 테이블에서 첫 번째 이름 KING을 가져온다
-- KONG의 부서 위치를 출력하기 위해 KING의 부서 번호 10번으로 dept 테이블에서 
-- 해당 부서 번호인 10번의 부서 위치인NEW YORK 찾아서 출력 
-- KING부터 시작해 맨 아래 ADAMS까지 이 작업을 반복하여 조인 
SELECT ename, loc 
    FROM emp, dept
    WHERE emp.deptno = dept.deptno;

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

-- 이 문법을 EQUI JOIN이라고 한다.
-- 조인 조건이 이퀄(=)이면 EQUI JOIN 이다.
-- 위의 결과에서 직업이 ANALYST인 사원들만 출력 
SELECT ename, loc, job
    FROM emp, dept
    WHERE emp.deptno = dept.deptno 
    AND emp.job = 'ANALYST';

-- 출력 예시
--FORD	DALLAS	ANALYST
--SCOTT	DALLAS	ANALYST

-- emp.deptno = dept.deptno 는 조인 조건이고 
-- emp.job = 'ANALYST'는 검색조건이다. 
-- 조인 조건은 두 테이블을 조인하기 위해 필요한 조건이고,
-- 검색 조건은 전체 데이터 중에 특정 데이터만 제한해서 보기 위한 조건 

-- 조인 조건과 검색 조건 AND 연산자로 연결하여 작성 

-- [ERROR] 위 예제의 SELECT deptno도 추가하여 출력 
SELECT ename, loc, job, deptno
    FROM emp, dept
    WHERE emp.deptno = dept.deptno 
    AND emp.job = 'ANALYST';

-- ORA-00918: 열의 정의가 애매합니다

-- deptno에 별표(*)를 가리며 deptno 열의 정의가 애매하다라는 에러가 나고 있다. 
-- detpno는 emp 테이블에도 존재하고 dept 테이블에도 존재하는 컬럼이기 때문에 
-- 어느 테이블에 있는 컬럼을 출력할지 몰라 에러가 나는 것이다, 
-- 열 이름 앞에 테이블명을 접두어로 붙여준다.

SELECT ename, loc, job, emp.deptno -- emp.deptno : 열 이름 앞에 접두어 
    FROM emp, dept
    WHERE emp.deptno = dept.deptno 
    AND emp.job = 'ANALYST';

-- 출력 예시
--FORD	DALLAS	ANALYST	  20
--SCOTT	DALLAS	ANALYST	  20

-- ename과 loc컬럼 앞에 테이블명을 붙이지 않아도 출력이 될 수 있었던 것은
-- ename과 emp 테이블에만 존재하고 loc는 dept 테이블에만 존재하는 열이기 때문
-- 검색 속도 향상을 위해 가급적 열 이름 앞에 테이블명을 붙여서 작성하는 것을 권장 

SELECT emp.ename, dept.loc, emp.job
    FROM emp, dept
    WHERE emp.deptno = dept.deptno
    AND emp.job = 'ANALYST';

-- 출력 예시
--FORD	DALLAS	ANALYST
--SCOTT	DALLAS	ANALYST

-- 컬럼명 앞에 테이블명을 일일이 붙이다 보니 테이블명이 반복하면서 코드가 길어지게 된다.
-- 테이블명 뒤에 테이블 별칭을 사용하여 조인 코드를 더 간결하게 작성한다.

SELECT e.ename, d.loc, e.job
    FROM emp e, dept d 
    WHERE e.deptno = d.deptno 
    AND e.job = 'ANALYST';

-- 출력 예시
--FORD	DALLAS	ANALYST
--SCOTT	DALLAS	ANALYST

-- 위의 조인문에서 emp는 e로 변경되고, dept는 d로 변경되어 실행됨
-- emp.ename으로 실행하면 에러가 발생한다.


SELECT emp.ename, d.loc, e.job
    FROM emp e, dept d 
    WHERE e.deptno = d.deptno 
    AND e.job = 'ANALYST';

-- ORA-00904: "EMP"."ENAME": 부적합한 식별자
-- 조인문이 FROM 절부터 실행되면서 emp 는 테이블 별칭인 e로 변경되었고
-- dept도 d로 변경되었다.
-- emp.ename이라고 사용할 수 없고, e.ename이라고 작성해야 한다.
