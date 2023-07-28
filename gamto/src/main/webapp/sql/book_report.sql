----------------------[book_report table]-------------------------
create table book_report(
    r_seq_number number primary key, --게시물 번호
    r_filename varchar2(500), --책이미지
    r_title varchar2(100) not null, --책제목
    r_writer varchar2(100) not null, --작성자
    r_content varchar2(500) not null, --내용
    r_regist_day date default sysdate, --등록 날짜
    r_update_day date default sysdate, --수정 날짜
    r_view number default 0, --조회수
    r_recommand number default 0, --추천수
    r_delete number(1) default 0 not null --삭제 여부
);

create sequence book_report_seq; --시퀀스 생성
drop sequence book_report_seq; --시퀀스 삭제

--데이터 저장
insert into book_report values(book_report_seq.nextval,'이미지.png','제목','작성자','독후감 내용란 입니다',sysdate,sysdate,5,2,0);

--데이터 확인
select * from book_report;
select * from book_report order by r_seq_number desc; --내림차순

--데이터 수정
update book_report set r_writer='열정맨', r_title='제목변경', r_content='컨텐츠변경' where r_seq_number=1;

--데이터 검색
select * from book_report where r_title like '%변경%';
select * from book_report where r_writer like '%작성%';

--테이블 삭제
drop table book_report;

rollback;
commit;