-- DDL(데이터 정의어)
-- 테이블 변경
-- 컬럼(속성) 추가
alter table 고객
            add 가입날짜 date;

-- 컬럼(속성) 삭제
alter table 고객
            drop column 가입날짜;

-- 제약조건 추가
alter table 고객
            add constraint chk_age check(나이 >= 20);

-- 제약조건 삭제
alter table 고객
            drop constraint chk_age;
            
drop table 배송업체;

alter table 고객
            modify 적립금 default 0;


-- DML(데이터 조작어)
-- insert 데이터 삽입

-- 고객 테이블에 데이터행 삽입
-- 모든 컬럼에 값을 삽입
-- 1번 방법
insert into 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
            values('banana', '김선우', 25, 'vip', '간호사', 2500);
            
-- 2번 방법
insert into 고객
            values('carrot','고명석',28,'gold','교사',4500);
            
-- 3번 방법 : 컬럼의 순서를 바꿔서 하기
insert into 고객(고객아이디, 고객이름, 직업, 등급, 적립금, 나이)
            values('orange', '김용욱', '학생', 'vip', 0, 25);
            
-- 4번 방법 : 컬럼 일부를 리스트에서 생략
insert into 고객(고객아이디, 고객이름, 등급, 직업)
            values('melon', '성원용', 'gold', '회사원');
            
insert into 고객(고객아이디, 고객이름, 등급, 직업, 적립금)
values('peach','오형준','silver','의사',300);

insert into 고객
values('pear','채광주',31,'silver','회사원',500);

insert into 고객
values('strawberry','최유경',30,'vip','공무원',100);


-- 제품 테이블에 데이터 삽입

-- Insert Into
-- 이건 여기선 안됨(mysql에서 됨) 
insert into 제품
        values
            ('p02','매운쫄면',2500,5500,'민국푸드'),
            ('p03','쿵떡파이',3600,2600,'한빛제과'),
            ('p04','맛난초콜릿',1250,2500,'한빛제과'),
            ('p05','얼큰라면',2200,1200,'대한식품'),
            ('p06','통통우동',1000,1550,'민국푸드'),
            ('p07','달콤비스킷',1650,1500,'한빛제과');

-- 오라클 문법 insert all into
insert all
into 제품 values('p02','매운쫄면',2500,5500,'민국푸드')
into 제품 values('p03','쿵떡파이',3600,2600,'한빛제과')
into 제품 values('p04','맛난초콜릿',1250,2500,'한빛제과')
into 제품 values('p05','얼큰라면',2200,1200,'대한식품')
into 제품 values('p06','통통우동',1000,1550,'민국푸드')
into 제품 values('p07','달콤비스킷',1650,1500,'한빛제과')
SELECT * FROM DUAL;

select * from 제품
order by 제품번호;


-- 주문 테이블에 데이터 삽입

insert all
into 주문 values('o3','banana','p06',45,'경기도 부천시','26/09/01')
into 주문 values('o4','carrot','p02',8,'부산시 금정구','26/07/30')
into 주문 values('o5','melon','p06',36,'경기도 용인시','26/08/01')
into 주문 values('o6','banana','p01',19,'충청북도 보은군','26/07/07')
into 주문 values('o7','apple','p03',22,'서울시 영등포구','26/09/03')
into 주문 values('o8','pear','p02',50,'강원도 춘천시','26/06/03')
into 주문 values('o9','banana','p04',15,'전라남도 목포시','26/07/08')
into 주문 values('o10','carrot','p03',20,'경기도 안양시','26/08/20')
select * from dual;



