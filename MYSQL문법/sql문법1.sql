-- 또는 # 한줄주석 
/*블록 주석*/

/*
-쿼리 실행
	활성시트(에디터) 메뉴바의 노란번개 두개있음
    1.노란번개: 현재 활성시트에 있는 모든 명령어 실행
				(컨트롤+쉬프트+엔터)
	2.노란간번개I: 현재 커서가 있는 명령어 실행
				(컨트롤+엔터)
*/
use test;
select now(); -- 현재 시간 출력

/*테이블에서 정보 불러오기 select */
SELECT * FROM students;
truncate students; -- 내용 없애기

/*정보 삽입 - insert
	방법1) insert into 테이블명 values('값1','값2', ....)
    
	방법2)insert into 테이블명 (컬럼명1, 컬럼명2,....) valuse('값1','값2',..);
    *반드시 컬럼명의 순서와 값의 순서를 지켜야함
    모든 컬럼의 값을 넣을 필요 없음, 내가 명시한 컬럼꺼만 넣어주면 됨.
    
    
*/
-- 아래 명령문은 컬럼명을 별도로 명시하지 않을때는 테이블의 모든 컬럼에 매칭되도록 값을 넣어줘야하는데 여기서는 4개만 넣어서 에러난다
	insert into students values ('S-001','홍길동','2000-01-01','010-1111-1111');

-- 아래 명령문은 4개만 값을 줫지만 ok임 이유는 컬럼명을 명시햇기때문
    insert into students (s_seqno,s_name,s_birth,s_phone,s_level,s_regdate)
    values ('S-001','홍길동','2000-01-01','010-1111-1111','0','2023-01-01');
    
    -- insert into students values('S-003','빵상','2000-01-01','010-2222-2222','0',now() );
	-- insert into students values('S-004',md5('빵상'),'2000-01-01','010-2222-2222','0',now() );
/*수정(테이블 내용) : update
		*주의: where 없이 실행하면 싹 다 바뀜
        update 테이블명 set 컬럼명='값'
*/
-- s_level 변경
	update students set s_level='0';
    select * from students;

/*삭제(테이블 내용): delete
	
    delete from 테이블명 where 컬렴명='값'
*/
delete from students where s_seqno='S-004';


