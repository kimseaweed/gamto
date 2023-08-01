-------free_board------
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
