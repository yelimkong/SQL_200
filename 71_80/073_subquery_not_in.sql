--073 서브 쿼리 사용하기 ③(NOT IN)
-- 관리자가 아닌 사원들의 이름과 월급과 직업을 출력
SELECT ename, sal, job 
    FROM emp 
    WHERE empno not in (SELECT mgr
                                    FROM emp
                                    WHERE mgr is not null);

-- 출력 예시
--SMITH	    800	CLERK
--ALLEN	    1600	SALESMAN
--WARD	    1250	SALESMAN
--MARTIN	1250	SALESMAN
--TURNER	1500	SALESMAN
--ADAMS	1100	CLERK
--JAMES	    950	CLERK
--MILLER	    1300	CLERK

-- 위의 예제는 자기 밑에 직속 부하 사원이 한 명도 없는 사원들을 출력하는 쿼리입니다.
-- 자기 밑에 직속 부하가 한 명도 없는 사원은 사원 번호(EMPNO)가 권리자 번호(MGR)가 아닌 
-- 사원들 NOT IN 연산자를 사용하여 관리자 번호가 아닌 사원들을 검색합니다. 
-- 서브 쿼리문이 먼저 실행되었다고 가정하고 위의 쿼리문을 작성하면 다음과 같다.

SELECT ename, sal, job
    FROM emp
    WHERE empno not in (7839, 7698, 7902, 7566, 7788, 7782);

-- 출력 예시
--MARTIN	1250	SALESMAN
--ALLEN	    1600	SALESMAN
--TURNER	1500	SALESMAN
--JAMES   	950	CLERK
--WARD	    1250	SALESMAN
--SMITH	    800	CLERK
--ADAMS	1100	CLERK
--MILLER	    1300	CLERK

-- 서브 쿼리문의 WHERE 절에 mgr is not null을 사용하지 않고 실행하면 다음과 같이 결과가 출력되지 않습니다.
SELECT ename, sal, job 
    FROM emp 
    WHERE empno not in (SELECT mgr
                                    FROM emp);
-- 선택된 레코드가 없습니다. 
--[이유] mgr 컬럼에 NULL값이 있기 때문입니다. 
-- NOT IN 을 사용할 경우 서브 쿼리에서 메인 쿼리로 NULL 값이 하나라도 리턴되면 
-- 결과가 출력되지 않습니다. 

-- NOT IN 으로 작성한 서브 쿼리문은 다음의 SQL과 같기 때문입니다. 

SELECT ename, sal, job
    FROM emp 
    WHERE empno != 7839 AND empno != 7698 AND empno != 7902
    AND empno != 7566 AND empno != 7566 AND empno != 7788
    AND empno != 7782 AND empno!= NULL;

-- 전체가 NULL이 되어버려 결과가 출력되지 않습니다. 
-- 서브 쿼리문에서 NOT IN을 사용할 때는 반드시 서브 쿼리문에서 메인 쿼리문으로 NULL 값이 
-- 리턴되지 않게 해야 합니다.