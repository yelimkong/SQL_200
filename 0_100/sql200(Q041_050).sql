-- 041 데이터 분석 함수로 순위 ① (RANK) 
-- 직업이 ANALYST, MANAGER인 사원들의 이름, 직업, 월급, 월급의 순위 출력
SELECT ename, job, sal, RANK() OVER (ORDER BY sal DESC) 순위
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER');
 
-- 출력 예시 
--FORD	ANALYST	3000	1
--SCOTT	ANALYST	3000	1
--JONES	MANAGER	2975	3
--BLAKE	MANAGER	2850	4
--CLARK	MANAGER	2450	5
-- RANK 함수 : 1등이 2명이어서 2등이 출력되지 않고 바로 3등 출력

-- 직업별로 월급이 높은 순서대로 순위 부여 
SELECT ename, sal, job, RANK() OVER (PARTITION BY job
                                                    ORDER BY sal DESC) as 순위
         FROM emp;

-- 출력 예시 
--SCOTT	3000	ANALYST	1
--FORD	3000	ANALYST	1
--MILLER	1300	CLERK	1
--ADAMS	1100	CLERK	2
--JAMES	950	CLERK	3
-- 직업별로 묶어서 순위를 부여하기 위해
-- ORDER BY 앞에 PARTITION BY job 을 사용 

-----------------------------------------------------------------------

-- 042 데이터 분석 함수로 순위 ② (DENSE_RANK) 
-- 직업이 ANALYST, MANAGER인 사원들의 이름, 직업, 월급, 월급의 순위 출력
-- 1위인 사원이 2명이 있을 경우 다음 순위가 3위로 출력되지 않고 2위로 출력
SELECT ename, job, sal, RANK() OVER (ORDER BY sal DESC) as RANK,
                                DENSE_RANK() OVER (ORDER BY sal DESC) as DENSE_RANK
    FROM emp 
    WHERE job IN ('ANALYST', 'MANAGER'); 


-- 출력 예시 
--FORD	ANALYST	    3000	1	1
--SCOTT	ANALYST 	3000  1	1
--JONES	MANAGER	2975	3	2  RANK 함수는 3위, DENSE_RANK는 2위 출력
--BLAKE	MANAGER	2850	4	3
--CLARK	MANAGER	2450	5	4

-- 81년도에 입사한 사원들의 직업, 이름, 월급, 순위 출력
-- 직업별로 월급이 높은 순서대로 순위 부여 
SELECT job, ename, sal, DENSE_RANK() OVER (PARTITION BY job
                                                              ORDER BY sal DESC) 순위
    FROM emp 
    WHERE hiredate BETWEEN TO_DATE('1981/01/01', 'RRRR/MM/DD')
                                AND TO_DATE('1981/12/31', 'RRRR/MM/DD');

-- 출력 예시 
--ANALYST	     FORD	3000	1
--CLERK	        JAMES	950	1
--MANAGER	JONES	2975	1
--MANAGER	BLAKE	2850	2
--MANAGER	CLARK	2450	3
--PRESIDENT	KING  	5000	1
--SALESMAN	ALLEN	1600	1
--SALESMAN	TURNER	1500	2
--SALESMAN	WARD	1250	3
--SALESMAN	MARTIN	1250	3


-- DENSE_RANK 바로 다음에 나오는 괄호에도 데이터를 넣고 사용할 수 있다.
-- 월급이 2975인 사원의 월급의 순위가 어떻게 되는지 출력 
-- DENSE_RANK 바로 다음에 나오는 괄호 안에 값을 입력
-- 그 값이 데이터 전체에서의 순위가 어떻게 되는지 출력 
-- WHITIN : ~ 이내에 
-- WHITIN GROUP : 어느 그룹 이내에서 2975의 순위가 어떻게 되는지 

SELECT DENSE_RANK(2975) WITHIN GROUP (ORDER BY sal desc) 순위
    FROM emp;

-- 출력 예시 
-- 순위 
-- 3

-- 입사일 81년 11월 17일 사원 테이블 전체 사원들 중 몇 번째로 입사한 것인지 출력
SELECT DENSE_RANK('81/11/17') WITHIN GROUP (ORDER BY hiredate ASC) 순위 
    FROM emp;

-- 출력 예시 
-- 순위 
-- 9

-----------------------------------------------------------------------

-- 043 데이터 분석 함수로 등급 출력 (NTILE)
-- 이름과 월급, 직업, 월급의 등급 출력 
-- 월급의 등급은 4등급으로 나누기
-- 1등급(0 ~ 25%), 2등급(25 ~ 50%), 3등급(50 ~ 75%), 4등급(75 ~ 100%)
SELECT ename, job, sal ,
          NTILE(4) OVER (ORDER BY sal DESC NULLS LAST) 등급
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER', 'CLECK');

-- 출력 예시 
--FORD	ANALYST    3000	1
--SCOTT	ANALYST	    3000	1
--JONES	MANAGER	2975	2
--BLAKE	MANAGER	2850	3
--CLARK	MANAGER	2450	4

-- 1등급(0 ~ 20%), 2등급(20 ~ 40%), 3등급(40 ~ 60%), 4등급(60 ~ 80%), 5등급(80 ~ 100%)
SELECT ename, job, sal ,
          NTILE(5) OVER (ORDER BY sal DESC NULLS LAST) 등급
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER', 'CLECK');

-- 출력 예시 
--FORD	ANALYST	    3000	1
--SCOTT	ANALYST	    3000	2
--JONES	MANAGER	2975	3
--BLAKE	MANAGER	2850	4
--CLARK	MANAGER	2450	5 

-- ORDER BY sal DESC NULLS LAST에서 
-- NULLS LAST는 NULL을 맨 아래에 출력 
-- 1) NULLS LAST를 사용 안 했을 때 
SELECT ename, comm
    FROM emp 
    WHERE deptno = 30 
    ORDER BY comm DESC;

-- 출력 예시 
--BLAKE	    (null)
--JAMES  	(null)
--MARTIN	1400
--WARD	    500
--ALLEN  	300
--TURNER	0

-- 2) NULLS LAST를 사용 했을 때 
SELECT ename, comm
    FROM emp
    WHERE deptno = 30
    ORDER BY comm DESC NULLS LAST;
    
-- 출력 예시 
--MARTIN	1400
--WARD	    500
--ALLEN  	300
--TURNER	0
--BLAKE	    (null)
--JAMES  	(null)

-----------------------------------------------------------------------

-- 044 데이터 분석 함수로 순위의 비율 출력 (CUME_DIST)
-- 이름과 월급, 월급의 순위, 월급의 순위 비율 출력
SELECT ename, sal, RANK() OVER (ORDER BY sal DESC) as RANK,
                         DENSE_RANK() OVER (ORDER BY sal DESC) as DENSE_RANK,
                         ROUND(CUME_DIST() OVER (ORDER BY sal DESC),2) as CUME_DIST
    FROM emp;

---- 출력 예시 
--ename sal  RANK DENSE_RANK CUME_DIST
--KING	    5000	1	1	0.07
--SCOTT  	3000	2	2	0.21
--FORD	    3000	2	2	0.21
--JONES  	2975	4	3	0.29
--BLAKE  	2850	5	4	0.36
--CLARK   	2450	6	5	0.43
--ALLEN   	1600	7	6	0.5
--TURNER	1500	8	7	0.57
--MILLER	    1300	9	8	0.64
--WARD	    1250	10	9	0.79
--MARTIN	1250	10	9	0.79
--ADAMS	1100	12	10	0.86
--JAMES	    950	13	11	0.93
--SMITH	    800	14	12	1

-- PARTITION BY JOB 을 사용해 CUME_DIST를 출력 
SELECT job, ename, sal, RANK() OVER (PARTITION BY job
                                                    ORDER BY sal DESC ) as RANK, 
                                ROUND(CUME_DIST() OVER (PARTITION BY job
                                                            ORDER BY sal DESC),2) as CUME_DIST
    FROM emp;

-- 출력 예시
--  job,           ename,   sal,   RANK, CUME_DIST
--ANALYST   	SCOTT	3000	1	1
--ANALYST   	FORD	    3000	1	1
--CLERK       	MILLER	1300	1	0.25
--CLERK	        ADAMS	1100	2	0.5
--CLERK       	JAMES	950	3	0.75
--CLERK	        SMITH	800	4	1
--MANAGER	JONES	2975	1	0.33
--MANAGER	BLAKE	2850	2	0.67
--MANAGER	CLARK	2450	3	1
--PRESIDENT	KING	    5000	1	1
--SALESMAN	ALLEN	1600	1	0.25
--SALESMAN	TURNER	1500	2	0.5
--SALESMAN	MARTIN	1250	3	1
--SALESMAN	WARD	1250	3	1

-----------------------------------------------------------------------

-- 045 데이터 분석 함수로 데이터를 가로로 출력 (LISTAGG)
-- 부서 번호를 출력, 
-- 부서 번호 옆에 해당 부서에 속하는 사원들의 이름을 가로로 출력
SELECT deptno, LISTAGG(ename, ',') WITHIN GROUP (ORDER BY ename) as EMPLOYEE
    FROM emp 
    GROUP BY deptno;

-- 출력 예시 
--10	CLARK,KING,MILLER
--20	ADAMS,FORD,JONES,SCOTT,SMITH
--30	ALLEN,BLAKE,JAMES,MARTIN,TURNER,WARD
-- LISTAGG : 데이터를 가로로 출력 

-- 직업과 그 직업에 속한 사원들의 이름을 가로로 출력 
SELECT job, LISTAGG(ename, ',') WITHIN GROUP (ORDER BY ename ASC) as EMPLOYEE
    FROM emp 
    GROUP BY job;

-- 출력 예시 
--ANALYST	    FORD,SCOTT
--CLERK	        ADAMS,JAMES,MILLER,SMITH
--MANAGER	BLAKE,CLARK,JONES
--PRESIDENT	KING
--SALESMAN	ALLEN,MARTIN,TURNER,WARD

-- 이름 옆에 월급도 같이 출력하려면 연결 연산자를 사용
-- 각 직업별로 월급의 분포가 어떻게 되는지 한눈에 확인할 수 있음
SELECT job,
LISTAGG(ename||'(' ||sal||')',', ') WITHIN GROUP (ORDER BY ename ASC) as EMPLOYEE
    FROM emp 
    GROUP BY job;

-- 출력 예시 
--ANALYST	FORD(3000),SCOTT(3000)
--CLERK	ADAMS(1100),JAMES(950),MILLER(1300),SMITH(800)
--MANAGER	BLAKE(2850),CLARK(2450),JONES(2975)
--PRESIDENT	KING(5000)
--SALESMAN	ALLEN(1600),MARTIN(1250),TURNER(1500),WARD(1250)

-----------------------------------------------------------------------

-- 046 데이터 분석 함수로 바로 전 행과 다음 행 출력 (LAG, LEAD)
SELECT empno, ename, sal,
            LAG(sal, 1) OVER (ORDER BY sal ASC) "전 행",
            LEAD(sal, 1) OVER (ORDER BY sal ASC) "다음 행"
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER');

-- 출력 예시 
-- empno ename  sal     LAG   LEAD
--7782	CLARK	2450	(null)  2850
--7698	BLAKE	2850	2450	2975
--7566	JONES	2975	2850	3000
--7902	FORD	    3000	2975	3000
--7788	SCOTT	3000	3000	(null) 
-- LAG : 바로 전 행의 데이터 출력
-- LEAD : 바로 다음 행의 데이터 출력 

-- 직업이 ANALYST 또는 MANAGER인 사원들의 사원 번호, 이름, 입사일,
-- 바로 전에 입사한 사원의 입사일, 바로 다음에 입사한 사원의 입사일 출력 
SELECT empno, ename, hiredate,
            LAG(hiredate, 1)  OVER (ORDER BY hiredate ASC) "전 행",
            LEAD(hiredate, 1) OVER (ORDER BY hiredate ASC) "다음 행"
    FROM emp
    WHERE job IN ('ANALYST', 'MANAGER');

-- 출력 예시 
--7566	JONES	81/04/01		(null)         81/05/01
--7698	BLAKE	81/05/01 	81/04/01	   81/05/09
--7782	CLARK	81/05/09	    81/05/01	   81/12/11
--7902	FORD	    81/12/11	    81/05/09	   82/12/22
--7788	SCOTT	82/12/22  	81/12/11	   (null)

-- 부서 번호, 사원 번호, 이름, 입사일, 바로 전에 입사한 사원의 입사일 출력
-- 바로 다음에 입사한 사원의 입사일 출력
-- 부서 번호별로 구분해서 출력
SELECT deptno, empno, ename, hiredate,
            LAG(hiredate, 1) OVER (PARTITION BY deptno ORDER BY hiredate ASC) "전 행",
            LEAD(hiredate, 1) OVER (PARTITION BY deptno ORDER BY hiredate DESC) "다음 행"
    FROM emp;
    
-- 출력 예시 
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

-----------------------------------------------------------------------

-- 047 COLUMN을 ROW로 출력하기 ① (SUM + DECODE)
-- 부서 번호, 부서 번호별 토탈 월급 출력, 가로로 출력 
SELECT SUM(DECODE(deptno, 10, sal)) as "10",
           SUM(DECODE(deptno, 20, sal)) as "20",
           SUM(DECODE(deptno, 30, sal)) as "30"
    FROM emp;

-- 출력 예시 
-- 8750	10875	   9400

-- 부서 번호가 10번이면 월급이 출력되고 아니면 NULL이 출력
SELECT deptno, DECODE(deptno, 10, sal) as "10"
    FROM emp;

-- 출력 예시 
--10	5000
--30	(null)
--10	2450
--20	(null)
--30	(null)
--30	(null)
--30	(null)
--30	(null)
--30	(null)
--20	(null)
--20	(null)
--20	(null)
--20	(null)
--10	1300

-- 부서 번호가 10번인 사원들의 월급의 합
SELECT SUM(DECODE(deptno, 10, sal)) as "10"
    FROM emp;
    
-- 출력 예시 
-- 8750

-- 직업, 직업별 토탈 월급 출력, 가로로 출력
-- 사원 테이블에 직업 종류를 알아야 사용할 수 있는 쿼리
-- 모른다면 PL/SQL 사용해야 함
SELECT SUM(DECODE(job, 'ANALYST', sal)) as "ANALYST",
           SUM(DECODE(job, 'CLERK', sal)) as "CLERK",
           SUM(DECODE(job, 'CLERK', sal)) as "CLERK",
           SUM(DECODE(job, 'SALESMAN', sal)) as "SALESMAN"
    FROM emp;
           
-- 출력 예시
-- 6000	4150	8275	5600

-- 부서번호별 직업의 토탈 월급 분포 출력 
SELECT deptno, SUM(DECODE(job, 'ANALYST', sal)) as "ANALYST",
                     SUM(DECODE(job, 'CLERK', sal)) as "CLERK",
                     SUM(DECODE(job, 'MANAGER', sal)) as "MANAGER",
                     SUM(DECODE(job, 'SALESMAN', sal)) as "SALESMAN"
    FROM emp
    GROUP BY deptno;
                     
-- 출력 예시 
--10	(null)	1300	2450	(null)
--30	(null)	950	2850	5600
--20	6000	1900	2975	(null)

-- [출력 결과 분석]
-- CLERK과 MANAGER는 모든 부서에 존재하지만, 
-- ANALST는 20번에만 존재 
-- SALESMAN은 30번에만 존재 

-----------------------------------------------------------------------

-- 048 COLUMN을 ROW로 출력 ② (PIVOT)
-- 부서 번호, 부서 번호별 토탈 월급을 PIVOT문 사용해서 가로로 출력 
SELECT *
    FROM (SELECT deptno, sal FROM emp)
    PIVOT (SUM(sal) for deptno IN (10, 20, 30));
    
-- 출력 예시 
-- 10      20      30 
-- 8750	10875	  9400

SELECT *
    FROM (SELECT job, sal FROM emp)
    PIVOT (SUM(sal) for JOB IN ('ANALYST', 'CLERK', 'MANAGER', 'SALESMAN')) ;

SELECT DISTINCT(job)
    FROM emp;

-- 출력 예시 
-- 'ANALYST', 'CLERK', 'MANAGER', 'SALESMAN'
-- 6000	4150	8275	5600

-- [해설]
-- 출력되는 결과에 필요한 데이터가 있는 컬럼인 직업과 월급을 선택한다.
-- 위에서 필요한 컬럼은 직업과 월급뿐
-- PIVOT문을 사용할 때는 FROM 절에 괄호를 사용해서 특정 컬럼만 선택해야 합니다. 
-- FROM emp 라고 작성하면 에러가 발생 
-- 반드시 괄호 안에 결과에 필요한 컬럼만 선택하는 쿼리문 작성해야 함 

-- PIVOT문을 이용해서 토탈 월급 출력 
-- in 다음에 토탈 월급을 출력할 직업 리스트를 나열
-- 싱글 쿼테이션 마크가 출력되지 않게 하려면 다음과 같이 as 뒤에 해당 직업을
-- 더블 쿼테이션으로 둘러서 작성하게 되면 싱글 쿼테이션 마크 없이 출력이 가능해짐
SELECT *
    FROM (SELECT job, sal FROM emp) 
    PIVOT (SUM(sal) for job IN ('ANALYST' as "ANALYST", 'CLERK' as "CLERK", 'MANAGER' as "MANAGER",
                                        'SALESMAN' as "SALESMAN") ) ;

-- 출력 예시 
-- ANALYST CLERK MANAGER SALESMAN
-- 6000	4150	8275	5600


-----------------------------------------------------------------------

drop table order2;

create  table  order2
( ename    varchar2(10),
   bicycle     number(10),
   camera    number(10),
   notebook   number(10) );

insert  into  order2  values('SMITH', 2, 3, 1);
insert  into  order2  values('ALLEN', 1, 2, 3);
insert  into  order2  values('KING', 3, 2, 2 );
commit;


-- 049 ROW를 COLUMN으로 출력 (UNPIVOT)
SELECT * 
    FROM order2
    UNPIVOT (건수 for 아이템 IN (BICYCLE, CAMERA, NOTEBOOK));

-- 출력 
-- ename, 아이템, 건수
--SMITH	BICYCLE   	2
--SMITH	CAMERA  	3
--SMITH	NOTEBOOK	1
--ALLEN	BICYCLE	    1
--ALLEN	CAMERA	    2
--ALLEN	NOTEBOOK	3
--KING	BICYCLE	    3
--KING	CAMERA	    2
--KING	NOTEBOOK	2

SELECT * 
    FROM order2
    UNPIVOT (건수 for 아이템 IN (BICYCLE as 'B', CAMERA as 'C', NOTEBOOK as 'N'));

-- 출력 예시 
--SMITH	B	2
--SMITH	C	3
--SMITH	N	1
--ALLEN	B	1
--ALLEN	C	2
--ALLEN	N	3
--KING	B	3
--KING	C	2
--KING	N	2

-----------------------------------------------------------------------

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
