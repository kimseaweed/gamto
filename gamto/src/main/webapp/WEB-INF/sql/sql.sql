--------spring boot simple_bbs table---------
create table simple_bbs(
    id number(4) primary key,
    writer varchar2(100),
    title varchar2(100),
    content varchar2(100)
);
create sequence simple_bbs_seq;
drop sequence simple_bbs_seq;

insert into simple_bbs values(simple_bbs_seq.nextval,'작가님','글제목','컨텐츠내용');
insert into simple_bbs values(simple_bbs_seq.nextval,'미래작가님','꿈','희망을 현실로 이루어지도록 열정을 가지고 포폴작업을 하자');
insert into simple_bbs values(simple_bbs_seq.nextval,'예비직장인','입사','사원증 걸어보고싶네융');
update simple_bbs set writer='열정맨', title='제목변경', content='컨텐츠 변경' where id=1;
delete simple_bbs where id=1;
select*from simple_bbs order by id desc;
select count(*) from simple_bbs;
select*from simple_bbs where id=2;
commit;

---------free_board------
create table free_board(
    f_seq_number number(4) primary key, --freeboard sequence number
    f_title varchar2(100) not null, --freeboard title
    f_writer varchar2(100) not null, --freeboard writer
    f_regist_day date default sysdate, --freeboard regist_day
    f_update_day date default sysdate, --freeboard update_day
    f_filename varchar2(30), --freeboard filename
    f_recommand number default 0, --freeboard recommand count
    f_delete number default 0 not null, --freeboard delete check
    f_view number default 0, --freeboard hits count
    f_content varchar2(500) not null --freeboard content
);

create sequence free_board_seq;
drop sequence free_board_seq;
drop table free_board;


insert into free_board values(free_board_seq.nextval,'포토폴리오','박승준',sysdate,sysdate,'img.png',0,0,0,'자유 게시판');

-------Comments_Board 게시판--------
create table comments_board(
    c_seq_number number(4) primary key, --comments_board sequence number
    c_writer varchar2(100) not null, --comments_board writer
    c_regist_day date default sysdate, --comments_board regist_day
    c_update_day date default sysdate, --comments_board update_day
    c_filename varchar2(30), --comments_board filename
    c_recommand number default 0, --comments_board recommand count
    c_delete number default 0 not null, --comments_board delete check
    c_view number default 0, --comments_board hits count
    c_content varchar2(500) not null --comments_board content
);

create sequence comments_board_seq;
drop sequence comments_board_seq;
drop table comments_board;

insert into comments_board values(comments_board_seq,'박승준',sysdate,sysdate,'#img.png',0,0,0,'투기장 시작하자고');
