package com.mrmr.gamto.admin.dto;

import lombok.Data;

@Data
public class AskDTO {
	/*
	a_seq_number number(5) primary key default ask_seq.nextVal,
	a_seq_date date default sysdate not null,
	a_id varchar2(20) not null,
	a_category varchar2(30) not null,
	a_content varchar2(4000) not null,
	a_filename varchar(100) null,
	a_email varchar2(40) not null,
	a_reception varchar varchar(2) not null  CHECK (flag IN ('Y', 'N')),
	a_complete number number(2) default 1,
	*/	
	int a_tot; //페이지 총 행
	int a_seq_number; //문의번호
	String a_seq_date; //문의날짜
	String a_id; //문의자아이디
	String a_category; //문의분류
	String a_content; //문의내용
	String a_filename; //문의파일첨부
	String a_email; //문의회신 이메일
	String a_reception; //문의 여부
	int a_complete; //문의 진행여부
}
