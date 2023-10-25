use test;
 

/* 영화 테이블 생성
	PK	m_seqno	int not null auto_increment	
제목		m_title	varchar(255) not null	
줄거리	m_desc	text null	
별점		m_rate	decimal(4,2) not null	
감독	FK	d_seqno	int not null	
배우	FK	a_seqno	int not null	
장르	FK	g_seqno	int not null	

*/
drop table movie ;
create table movie (
	m_seqno	int unsigned not null auto_increment,
	m_title	varchar(255) not null,
	m_desc	text null,
	m_rate	decimal(4,2) not null,
	d_seqno	int not null,
	a_seqno	int not null,
	g_seqno	int not null,
	primary key(m_seqno)
    -- ,
--     foreign key(d_seqno) references director(d_seqno),
--     foreign key(d_seqno) references actor(a_seqno),
--     foreign key(d_seqno) references genre(g_seqno)
);
insert into movie value (null, '전우치','도술얘기', 8.2, 1,1,1);
insert into movie value (null, '무빙','초능력얘기', 10, 3,3,2);
insert into movie value (null, '아이언맨','SF얘기', 10, 3,4,2);
insert into movie value (null, '망치의신','SF얘기', 10, 4,7,2);
insert into movie value (null, '사이버포뮬러','레이싱', 9.8, 1,9,3);
/* 장르 테이블 생성 
	PK	g_seqno	int not null auto_increment
		g_title	varcher(255) not null 
*/
drop table genre;
create table genre (
	g_seqno	int not null auto_increment	,
	g_title	varchar(255) not null	,
    primary key(g_seqno)
);
insert into genre values (null, '코미디');
insert into genre values (null, '액션');
insert into genre values (null, '스포츠');
insert into genre values (null, '로맨스');

/* 감독 테이블 생성 
	PK	d_seqno	int not null auto_increment	
		d_name	varchar(255) not null	

*/
drop table director;
create table director (
	d_seqno	int not null auto_increment	,
	d_name	varchar(255) not null	,
    primary key(d_seqno)
);
insert into director values (null, '감독1');
insert into director values (null, '감독2');
insert into director values (null, '감독3');
insert into director values (null, '토르');
insert into director values (null, '하야토');
/* 배우 테이블 생성 
	PK	a_seqno	int not null auto_increment	
		a_name	varchar(255) not null	
		a_gender	varchar(255) not null	

*/
drop table actor;
create table actor (
	a_seqno	int not null auto_increment	,
	a_name	varchar(255) not null	,
	a_gender varchar(255) not null	,
    primary key(a_seqno)
);
insert into actor values (null, '강동원', '남');
insert into actor values (null, '조인성', '남');
insert into actor values (null, '한효주', '여');
insert into actor values (null, '안준성1', '남');
insert into actor values (null, '배수지', '여');
insert into actor values (null, '안준성2', '남');



SELECT * FROM movie;
SELECT * FROM genre;
SELECT * FROM director;
SELECT * FROM actor;

-- 전체 영화 개수 출력
SELECT count(*) FROM movie;
-- 배우중에 성별이 남자인 사람만 출력
SELECT * FROM actor where a_gender='남';
-- 배우중에 이름에 '성' 있는 사람들 다 출력
SELECT * FROM actor where a_name like '%성%';
-- 배우 이름 가나다 순으로 출력
SELECT * FROM actor order by a_name ;

-- 영화 테이블에 장르, 감독, 배우 나타나게 하기
select M.m_seqno, M.m_title, M.m_desc, M.m_rate, D.d_name, A.a_name, A.a_gender, G.g_title 
	from movie M
		join director D
			on M.d_seqno = D.d_seqno
		join actor A
			on M.a_seqno = A.a_seqno
		join genre G
			on M.g_seqno = G.g_seqno;

