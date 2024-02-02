--078 데이터 입력하기 (INSERT)
-- 사원 테이블에 데이터를 입력하는데 사원 번호 2812, 사원 이름 JACK, 월급 3500, 입사일 2019년 6월 5일,
-- 직업 ANALYST로 진행 
INSERT INTO emp (empno, ename, sal, hiredate, job)
    VALUES(2812, 'JACK', 3500, TO_DATE('2019/06/05', 'RRRR/MM/DD'), 'ANALYST') ;

-- 출력 예시
-- 1 행 이(가) 삽입되었습니다.

-- INSERT INTO 다음에 입력하고자 하는 테이블명을 작성
-- 괄호를 열어 데이터를 컬럼명 순서대로 기술 
-- 괄호를 쓰지 않는다면 다음과 같이 전체 컬럼에 모두 데이터를 입력해야 한다.
-- 입력할 때는 테이블의 컬럼의 순서를 맞춰야 한다. 

INSERT INTO emp 
    VALUES(1234, 'JAMES', 'ANALYST', 7566, TO_DATE('2019/06/22', 'RRRR/MM/DD'),
        3500, null, 20, null);

-- 출력 예시
-- 1 행 이(가) 삽입되었습니다.


-- 테이블의 컬럼 구조 확인 
DESC emp;
--이름       널?       유형           
---------- -------- ------------ 
--EMPNO    NOT NULL NUMBER(4)    
--ENAME    NOT NULL VARCHAR2(10) 
--JOB               VARCHAR2(9)  
--MGR               NUMBER(4)    
--HIREDATE          DATE         
--SAL               NUMBER(7,2)  
--COMM              NUMBER(7,2)  
--DEPTNO            NUMBER(2)    
--EMAIL             VARCHAR2(50) 

-- VALUES 다음에 입력하고자 하는 데이터 값을 1번 라인에서 괄호에 작성했던 컬럼 순서대로 
-- 기술한다. 이때 숫자는 그대로 기술하면 되지만, 문자와 날짜는 양쪽에 싱글 쿼테이션마크(')를 
-- 둘러줘야 한다. 날짜를 입력할 때는 TO_DATE 변환 함수를 사용하여 2019는 '연도 4자리'이고 
-- 06은 '달'이며, 05는 '일'임을 명시한다. 


-- 테이블에 NULL 값을 입력하는 방법은 크게 2가지가 있다. 
-- NULL 입력 방법              |        값       |    INSERT 예제 
-- 암시적으로 입력하는 방법 |                  |  INSERT INTO EMP(empno, ename, sal) 
--                                   |                  |     VALUES(2912, 'JANE', 4500) ;
-- 명시적으로 입력하는 방법 |     NULL      |  INSERT INTO EMP(empno, ename, sal, job) 
--                                   |                  |     VALUES(8381, 'JACK', NULL, NULL) ;
-- 명시적으로 입력하는 방법 |                  |  INSERT INTO EMP(empno, ename, sal, job) 
--                                   |                  |     VALUES(2912, 'JACK', '', '') ;

-- EMPNO, ENAME, SAL에만 데이터를 입력하면 나머지 컬럼에는 자동으로 NULL이 입력되어지는
-- 것이 암시적으로 NULL을 입력하는 방법이다.
-- 명시적으로 입력하는 방법은 INSERT문의 VALUES절에 입력하고 싶은 컬럼의 값에 NULL을 직접 
-- 기술하거나, 싱글 쿼테이션 마크를 공백 없이 붙여주어 입력하는 것을 말합니다. 

-- 이렇게 테이블에 데이터를 입력하고 수정하고 삭제하는 SQL문을 DML문이라고 합니다.
-- DML(Data Manipulation Language)문의 종류는 다음과 같다. 
-- 종류     |     설명 
-- INSERT  |   데이터 입력 
-- UPDATE |   데이터 수정 
-- DELETE  |   데이터 삭제 
-- MERGE  |    데이터 입력, 수정, 삭제를 한 번에 수행 

