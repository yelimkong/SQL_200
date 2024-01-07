drop  table  salgrade;

create table salgrade
( grade   number(10),
  losal   number(10),
  hisal   number(10) );

insert into salgrade  values(1,700,1200);
insert into salgrade  values(2,1201,1400);
insert into salgrade  values(3,1401,2000);
insert into salgrade  values(4,2001,3000);
insert into salgrade  values(5,3001,9999);

commit;

--059 여러 테이블의 데이터를 조인해서 출력 ② (NON EQUI JOIN)
-- 사원(EMP) 테이블과 급여 등급(SALGRADE) 테이블을 조인하여 이름, 월급, 급여 등급을 출력 
SELECT e.ename, e.sal, s.grade
    FROM emp e, salgrade s
    WHERE e.sal BETWEEN s.losal AND s.hisal;
    
-- 출력 예시 
--SMITH	    800	1
--JAMES   	950	1
--ADAMS	1100	1
--WARD	    1250	2
--MARTIN	1250	2
--MILLER	    1300	2
--TURNER	1500	3
--ALLEN	    1600	3
--CLARK   	2450	4
--BLAKE	    2850	4
--JONES	    2975	4
--FORD	    3000	4
--SCOTT	    3000	4
--KING	    5000	5

-- [결과 해석]
--  salgrade 테이블은 급여 등급 테이블 
-- grade는 등급이고 losal은 등급을 나누는 월급 범위의 하단, 
-- hisal은 월급 범위의 상단
-- 5등급이 제일 높은 등급

SELECT * 
    FROM salgrade;

-- 출력 예시
--1 	700	1200
--2	    1201	1400
--3  	1401	2000
--4	    2001	3000
--5	    3001	9999

-- emp 테이블과 salgrade 테이블을 조인해서 이름(ename)과  급여 등급 (grade)을 하나의 결과로 출력하고자 한다.
-- [문제] emp와 dept 사이의 deptno처럼 동일한 컬럼이 없다
-- equal(=)을 사용한 equi join을 할 수 없다.
-- 조인 조건에 equal 조건을 줄 수 없을 때 사용하는 조인이 non equi join

-- 두 테이블 사이에 동일한 컬럼은 없지만 비슷한 컬럼이 있다.
-- emp 테이블의 sal컬럼과 salgrade 테이블의 losal과  hisal컬럼
-- emp 테이블의 월급은 salgrade 테이블의 losal과 hisal 사이에 있다.
-- 이 말을 영작하여 WHERE 절에 조인 조건을 작성하여 두 테이블을 조인한다.

SELECT e.ename, e.sal, s.grade
    FROM emp e, salgrade s
    WHERE e.sal BETWEEN s.losal AND s.hisal;

-- 출력 예시 
--SMITH	    800	1
--JAMES   	950	1
--ADAMS	1100	1
--WARD	    1250	2
--MARTIN	1250	2
--MILLER	    1300	2
--TURNER	1500	3
--ALLEN	    1600	3
--CLARK   	2450	4
--BLAKE	    2850	4
--JONES	    2975	4
--FORD	    3000	4
--SCOTT	    3000	4
--KING	    5000	5

-- [NON EQUI JOIN 결론 ]
-- NTILE 분석 함수의 경우 등급을 출력할 때 범위를 더 상세하게 지정할 수 없다.
-- NTILE(5)의 등급이 각각 20%로 지정된다.
-- SALGRADE 테이블과 EMP 테이블을 조인하게 되면 등급의 범위를 
-- SALGRADE 테이블의 losal과 hisal 컬럼의 데이터에 따라 자유롭게 지정할 수 있다.
