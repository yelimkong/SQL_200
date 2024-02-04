--079 데이터 수정하기 (UPDATE)
-- SCOTT의 월급을 3200으로 수정하기 
UPDATE emp 
    SET sal = 3200 
    WHERE ename = 'SCOTT';

-- 출력 예시
-- 1 행 이(가) 업데이트되었습니다.

-- 1) UPDATE할 테이블명을 기술합니다. 
-- 2) SET 절에는 변경할 데이터를 설정합니다. 월급을 3200으로 변경합니다. 
-- 3) WEHRE절에는 변경할 대상 데이터를 제한하는 조건을 기술합니다. 
-- WHERE 절이 없으면 다음과 같이 EMP 테이블의 모든 월급이 3200으로 갱신됩니다. 

UPDATE emp 
    SET sal = 3200;

-- 출력 예시
-- 16개 행 이(가) 업데이트되었습니다.

-- 하나의 UPDATE문으로 여러 개의 열 값을 수정할 수 있습니다. 
-- 다음의 예제는 SCOTT의 월급과 커미션을 동시에 변경하는 UPDATE문입니다. 

UPDATE emp 
    SET sal = 5000, comm = 200 
    WHERE ename = 'SCOTT';

-- 출력 예시
-- 1 행 이(가) 업데이트되었습니다.

-- SET 절에 변경할 컬럼을 콤마(,)로 구분하여 작성 후 월급과 커미션을 동시에 변경합니다. 
-- UPDATE문에서도 서브 쿼리를 사용할 수 있습니다. 
-- 다음은 SET 절에 서브 쿼리를 사용한 예제입니다. 

UPDATE emp 
    SET sal = (SELECT sal FROM emp WHERE ename = 'KING')
    WHERE ename = 'SCOTT' ;

-- 출력 예시
-- 1 행 이(가) 업데이트되었습니다.

-- SET 절에 서브 쿼리를 사용하여 SCOTT의 월급을 KING의 월급으로 변경합니다. 
-- UPDATE문은 모든 절에서 서브 쿼리 작성이 가능합니다. 

-- UPDATE문   |   가능여부 
-- UPDATE      |    서브 쿼리 가능
-- SET            |    서브 쿼리 가능
-- WHERE       |    서브 쿼리 가능

