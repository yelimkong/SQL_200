--080 데이터 삭제하기 (DELETE, TRUNCATE, DROP) 
-- 1) DELETE FROM 다음에 데이터를 지울 테이블명을 작성합니다.  
-- WHERE 절에 삭제할 행을 제한합니다. WHERE 절을 작성하지 않으면 다음과 같이 모든 행이 삭제됩니다.

DELETE FROM emp ;

-- 출력 예시
-- 16개 행 이(가) 삭제되었습니다.

-- 오라클에서 데이터를 삭제하는 명령어는 세 가지가 있습니다. 
--                    |    DELETE     |     TRUNCATE      |        DROP
-- 데이터           |      삭제      |          삭제          |        삭제
-- 저장 공간       |      남김      |          삭제          |        삭제
-- 저장 구조       |      남김      |          삭제          |        삭제
-- 저장 공간       |      남김      |          남김          |        삭제
-- 취소 여부       |      가능      |        불가능         |        불가능
-- 플래시백 여부 |      가능      |        불가능         |        불가능

-- TRUNCATE 명령어는 모든 데이터를 한 번에 삭제합니다. 
-- 데이터 삭제 후에는 취소가 불가능하기 때문에 DELETE보다는 삭제되는 속도가 빠릅니다
-- 데이터를 모두 지우고 테이블 구조만 남겨두는것이 TRUNCATE 명령어입니다. 

TRUNCATE TABLE emp ;

-- 출력 예시
-- Table EMP이(가) 잘렸습니다.

-- DROP 명령어는 테이블 전체를 한 번에 삭제하는 명령어입니다.
-- 삭제 후에 취소 (ROLLBACK)는 불가능하지만 플래쉬백(FLASHBACK)으로 데이터를 복구할 수는 있습니다. 

DROP TABLE emp ;

-- 출력 예시
-- Table EMP이(가) 삭제되었습니다.

-- DELETE는 DML(Data Mainpulation Language)문이고 TRUNCATE와 DROP은 DDL문입니다.
-- DDL은 Data Definition Language의 약자입니다. DML문과는 다르게 DDL문은 수행되면서 
-- 암시적인 COMMIT이 발생합니다. DDL문의 종류는 다음과 같습니다.
--      종류      |        설명 
-- CREATE       |    객체를 생성합니다.
-- ALTER         |    객체를 수정합니다. 
-- DROP         |     객체를 삭제합니다.
-- TRUNCATE   |    객체를 삭제합니다. 
-- RENAME      |    객체의 이름을 변경합니다. 

