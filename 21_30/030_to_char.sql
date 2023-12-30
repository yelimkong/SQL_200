-- 030 문자형으로 데이터 유형 변환 (TO_CHAR)
-- 이름이 SCOTT인 사원의 이름과 입사한 요일 출력,
-- SCOTT의 월급에 천 단위 출력 
SELECT ename, TO_CHAR(hiredate, 'DAY') as "요일", TO_CHAR(sal, '999,999') as "월급"
    FROM emp
    WHERE ename = 'SCOTT';

-- 출력 예시
-- SCOTT	수요일	   3,000

-- KING 사원의 입사일의 연도, 달, 일, 요일 출력 
SELECT TO_CHAR(hiredate, 'RRRR') as 연도, TO_CHAR(hiredate, 'MM') as 달,
           TO_CHAR(hiredate, 'DD') as 일, TO_CHAR(hiredate, 'DAY') as 요일
           FROM emp
           WHERE ename = 'KING';

-- 출력 예시
-- 1981	11	17	화요일

-- 1981년도에 입사한 사원의 이름과 입사일 출력 
SELECT ename, hiredate
    FROM emp
    WHERE TO_CHAR(hiredate, 'RRRR') = '1981';
 
-- 출력 예시 
--KING	81/11/17
--BLAKE	81/05/01
--CLARK	81/05/09
--JONES	81/04/01
--MARTIN	81/09/10

-- 사원들의 입사 년도/달/요일 출력
SELECT ename as 이름, EXTRACT(year from hiredate) as 연도,
                               EXTRACT(month from hiredate) as 달,
                               EXTRACT(day from hiredate) as 요일
         FROM emp;

-- 출력 예시 
--KING	1981	11	17
--BLAKE	1981	5	1
--CLARK	1981	5	9
--JONES	1981	4	1
--MARTIN	1981	9	10

-- 사원의 이름, 월급은 천 단위 표시해서 출력 
SELECT ename as 이름, TO_CHAR(sal, '999,999') as 월급 
    FROM emp;

-- 출력 예시
--KING	   5,000
--BLAKE	   2,850
--CLARK	   2,450
--JONES	   2,975
--MARTIN	   1,250

-- 월급의 천 단위와 백만 단위 표시해서 출력 
SELECT ename as 이름, TO_CHAR(sal*200, '999,999,999') as 월급
    FROM emp;

--출력 예시
--KING	   1,000,000
--BLAKE	     570,000
--CLARK	     490,000
--JONES	     595,000
--MARTIN	     250,000

-- 알파벳 L을 사용하면 화폐 단위\(원화)를 붙여 출력 가능 
SELECT ename as 이름, TO_CHAR(sal * 200, 'L999,999,999') as 월급 
    FROM emp;

--출력 예시
--KING	          ￦1,000,000
--BLAKE	            ￦570,000
--CLARK	            ￦490,000
--JONES	            ￦595,000
--MARTIN	            ￦250,000