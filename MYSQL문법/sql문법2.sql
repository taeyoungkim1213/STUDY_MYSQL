/*
1. db(스키마) 관련
	1) db 생성
		create database 데이터베이스이름;
    2) db 삭제
		delete database 데이터베이스이름;
    3) db 조회
		show databases;
    4) db 사용
		use 데이터베이스이름;

2. 테이블
	1) 테이블 조회
		show tables;
	2) 테이블 정보확인
		desc 테이블이름;
        
	3) 테이블 생성
		create table 이름 (
			컬럼1 타입 [옵션],
            컬럼2 타입 [옵션],
            컬럼3 타입 [옵션]
        );
        
        create table classes (
			c_seqno int(10) not null auto_increment,  
			c_title varchar(255) not null,
			c_roomNo varchar(255) not null,
			c_openDate varchar(255) not null,
			c_closeDate varchar(255) not null,
			PRIMARY KEY(c_seqno)
		);
        
        int(10) => 숫자 10자리 만큼 노출(저장도 10자리)
        varchar(255) => 문자
        auto_increment => 자동으로 1씩 증가하는 숫자
        datetime => 시간 날짜 입력
        
	4) 테이블 삭제
		drop table 테이블명; 
	
    5) 테이블 초기화
		truncate 테이블명;
       
       
3. 레코드
	1) 추가(삽입) - insert 
		방법1) insert into 테이블명 values (값1, 값2,....)
			 값을 모든 컬럼 순서에 맞춰서 다 넣어줘야 한다.
			
		방법2) insert into 테이블명 (컬럼명1, 컬럼명2, ....) values (값1, 값2,....)
				*반드시 명시한 컬럼명의 순서와 값의 순서를 지켜야한다.
				 모든 컬럼의 값을 넣을 필요 없음. 내가 명시한 컬럼꺼만 넣어주면 됨
                 
	2) 조회 - select
		- 전체 컬럼 조회: select * from 테이블명;
        - 일부 컬럼 조회: select 필드A, 필드B,... from 테이블명;
        - 특정 조건에 조회: select * frcityom 테이블명 where 필드명=값;
        - 중복제거: select distinct 필드명 from 테이블명;
				해당 필드의 중복이 있으면 하나로 압축해준다.
        - 사이값: select * from 테이블명 where 필드명 between '값1' and '값2';
        - 검색: select * from 테이블명 where 필드명 like '%값%'
		
        * limit: 최대 row 개수 지정
			select * from classes limit 3; -- 전체 반 중에서 상위 3개만 나옴
        
	3) 변경 - update 
		update 테이블명 set 컬럼명=값 
		*주의: where 없이 실행하면 싹 다 바뀜
         
    4) 삭제 - delete
		delete from 테이블명 where 컬럼명=값;
        *주의: where 없이 실행하면 싹 다 바뀜
        
		* auto_increment 를 사용중인경우 delete 명령문 사용시 숫자가 이빨빠지게 된다. 
		  그래서 auto_increment 를 초기화 해줘야 한다.
			alter table 테이블명 auto_increment=1; 
			
4. 기존 테이블(컬럼) 변경
	1) 추가 - alter table 테이블명 add 컬럼명 타입 [옵션]
			ex) alter table classes add s_gender varchar(10) not null;
    2) 삭제 - alter table 테이블명 drop
			ex) alter table classes drop s_gender;
    3) 컬럼 수정 -  alter table 테이블명 modify 컬럼명 타입 [옵션]
			ex) alter table students modify s_gender2 char(50) not null;
	4) 컬럼명 수정 - alter table 테이블명 change 기존컬럼명 새컬럼명 컬럼타입
			ex) alter table students change s_gender2 s_gender int(10) not null;
		*4번으로 3번꺼 가능
        *해당 컬럼이 not null 인 경우 값이 뭐라도 들어있어야 3,4번 적용됨
        
	5) 테이블명 변경
		rename table 기존이름 to 새이름; 
		ex) rename table classes to classes22; 

5. join
	1) inner join (교집합)
		- inner join 은 ON 절과 함께 사용되며, ON 절의 조건을 만족하는 데이터만 가져온다.
	
    2) left join
		- 첫번째 테이블을 기준으로 두번째 테이블을 조합하는 join 방식
		  ON절이 만족하지 않으면 왼쪽(첫번째 테이블)꺼는 다 가져온다.
          나머지 부분은 null 로 표시된다.
	
    3) right join 
		- left join 과는 반대로 두번째 테이블이 기준으로 첫번째 테이블을 조합하는 방식
          ON절이 만족하지 않으면 두번째 테이블꺼는 다 가져온다.
          나머지(첫번째 테이블 파트)는 null로 표시된다.
*/


show databases; -- db 조회
use test; -- db 사용
show tables; -- 테이블 조회
desc students; -- 테이블 정보확인

create table classes (
	c_seqno int(10) not null auto_increment, -- auto_increment: 자동으로 1씩 증가
    c_title varchar(255) not null,
    c_roomNo varchar(255) not null,
    c_openDate varchar(255) not null,
    c_closeDate varchar(255) not null,
    PRIMARY KEY(c_seqno)
);


desc classes;
select * from classes;

drop table classes;
INSERT INTO classes VALUES (null, '자바', 'D강의장', '2023-07-27','2023-12-27');
INSERT INTO classes VALUES (null, 'C', '501', '2023-07-27','2023-12-27');
INSERT INTO classes VALUES (null, '파이썬', '302', '2023-07-27','2023-12-27');
INSERT INTO classes VALUES (null, '코틀린', '604', '2023-07-27','2023-12-27');
INSERT INTO classes VALUES (null, '자바', 'c강의장', '2023-07-27','2023-12-27');
INSERT INTO classes VALUES (null, 'C', 'c강의장', '2023-07-27','2023-12-27');
INSERT INTO classes VALUES (null, '파이썬', 'c강의장', '2023-07-27','2023-12-27');
INSERT INTO classes VALUES (null, '코틀린', 'c강의장', '2023-07-27','2023-12-27');

delete from classes where c_seqno=5;
alter table classes auto_increment=1; -- auto_increment 초기화


delete from classes;
truncate classes; -- 테이블 내용 초기화
 
select distinct c_roomNo from classes; -- c_roomNo 중복제거

-- 사이값 구하기
select * from classes where c_openDate between '2022-01-01' and '2022-12-12';
select * from classes where '2022-01-01' <= c_openDate  and c_openDate  <= '2022-12-12';

select * from classes where c_roomNo like '%강의장%' limit 3;


alter table students add s_gender2 varchar(10) not null; -- s_gender 필드 추가
select * from students;
alter table students drop s_gender; -- s_gender 필드 삭제
alter table students modify s_gender2 int(10) not null;
alter table students change s_gender2 s_gender int(10) not null;
desc students;

select * from classes;
alter table classes drop s_gender;

rename table classes to classes22; -- 테이블명 변경


use world;
select * from city; -- countrycode
select code, name, region from country;  -- code

-- 조인 join
select c.*, ct.code, ct.name, ct.region 
 from city C 
	right join country CT 
		ON C.countrycode = CT.code;
