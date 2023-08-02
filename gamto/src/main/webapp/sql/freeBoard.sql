---------free_board------
create table free_board(
    f_seq_number number(4) primary key, --freeboard sequence number
    f_title varchar2(100) not null, --freeboard title
    f_writer varchar2(100) not null, --freeboard writer
    f_regist_day date default sysdate,--freeboard regist_day
    f_update_day date default sysdate, --freeboard update_day
    f_filename varchar2(30), --freeboard filename
    f_recommend number default 0, --freeboard recommand count
    f_delete number default 0 not null, --freeboard delete check
    f_view number default 0, --freeboard hits count
    f_content varchar2(500) not null --freeboard content
);

create sequence free_board_seq;
drop sequence free_board_seq;
drop table free_board;
select*from free_board;
commit;

insert into free_board values(free_board_seq.nextval,'열공중','안상용',sysdate,sysdate,'img.png',0,0,0,'포폴 빨리 끝내고싶다..');
update free_board set f_view = f_view+1 where f_seq_number = 1;
update free_board set f_update_day = sysdate where f_seq_number = 1;
update free_board set f_title ='수정', f_content ='수정', f_update_day = sysdate where f_seq_number = 3;
select*from free_board where f_seq_number=3;
insert into free_board values(free_board_seq.nextval,'화이팅','무민이',sysdate,sysdate,'img.png',0,0,0,'입력');
delete free_board where f_seq_number=41;
update  free_board set f_recommaed = f_recommaed+1 where f_seq_number = 3;

-------Comment_Board 게시판--------
create table comment_board(
    c_seq_number number(4) primary key, --comment_board sequence number
    c_writer varchar2(100) not null, --comment_board writer
    c_regist_day date default sysdate, --comment_board regist_day
    c_update_day date default sysdate, --comment_board update_day
    c_recommand number default 0, --comment_board recommand count
    c_dercommend number default 0, --comment_board derecommand count
    c_delete number default 0 not null, --comments_board delete check
    c_content varchar2(500) not null --comments_board content
);

create sequence comment_board_seq;
drop sequence comment_board_seq;
drop table comment_board;

insert into comment_board values(comments_board_seq,'박민철',sysdate,sysdate,'#img.png',0,0,0,'투기장 시작하자고');
