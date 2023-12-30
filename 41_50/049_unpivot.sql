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
