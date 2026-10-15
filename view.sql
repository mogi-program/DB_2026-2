select 고객이름 from 고객
where Not Exists(select * from 주문
                 where 주문일자 = '2026-08-01' and 주문고객 = 고객아이디
                 );

-- 고객테이블에 고객아이디가 kiwi, 고객이름이 김유정, 나이가 32세, 등급이 gold, 직업이 연예인, 적립금이 1000원인 고객의 정보를 삽입하시오

insert into 고객 values('kiwi', '김유정', 32, 'gold', '연예인', 1000);

select * from 고객;

-- 고객테이블에 고객아이디 tomato, 고객이름 정은심, 나이 36세, 등급 silver, 적립금 4000원, 직업은 모름

insert into 고객(고객아이디, 고객이름, 나이, 등급, 적립금) values('tomato', '정은심', 36, 'silver', 4000);

insert into 고객 values('tomato', '정은심', 36, 'silver' ,null ,4000);

drop table 한빛제품;

create table 한빛제품(
    제품명 VARCHAR(50) not null primary key,
    재고량 int,
    단가 int
);

insert into 한빛제품 (제품명, 재고량, 단가)
select 제품명, 재고량, 단가 from 제품 where 제조업체 = '한빛제과';

-- 제품테이블에서 제품번호가 p03인 제품의 제품명을 통큰파이로 수정하시오.

update 제품 set 제품명 = '통큰파이'
where 제품번호 = 'p03';

-- 통통우동을 쫄깃우동으로 수정
update 제품 set 제품명 = '쫄깃우동'
where 제품명 = '통통우동';

update 제품 set 단가 = 단가 * 1.1;
select * from 제품;

update 주문 set 수량=5
where 주문고객 in (select 고객아이디 from 고객 where 고객이름 = '정소화');

select * from 주문;

-- 고객테이블에서 tomato2인 고객을 삭제하시오.
delete from 고객
where 고객아이디 = 'tomato2';

-- View(기본테이블에서 파생된 가상 테이블)
-- 고객테이블에서 등급이 vip인 고객의 고객아이디, 고객이름, 나이, 등급으로 구성된 뷰를
-- 우수고객이라는 이름으로 생성하시오.

create view 우수고객(고객아이디, 고객이름, 나이, 등급)
as select 고객아이디, 고객이름, 나이, 등급 from 고객
where 등급 = 'vip';

select * from 우수고객;

drop view 우수고객;

-- 제품테이블에서 제조업체별 제품수로 구성된 뷰를 업체별 제품수라는 이름으로 생성하시오.

select 제조업체, count(*) 제품수 from 제품 group by 제조업체;

create view 업체별제품수(제조업체, 제품수)
as select 제조업체, count(*) 제품수 from 제품 group by 제조업체
with check option;

create view 제품1
as select 제품번호, 재고량, 제조업체 from 제품
with check option;

select * from 제품;

--제품1 뷰에 제품번호 'p08', 재고량 100, 제조업체가 '신선식품'인 새로운 제품의 정보를 추가하시오

insert into 제품1 values('p08', 100, '신선식품');

-- 제품1 뷰의 기본테이블인 제품에도 추가가 되었는지 확인