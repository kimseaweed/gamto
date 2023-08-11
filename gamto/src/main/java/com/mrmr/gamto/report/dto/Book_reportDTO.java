package com.mrmr.gamto.report.dto;

import lombok.Data;

@Data
public class Book_reportDTO {
	private int r_seq_number; //독후감 번호
	private String r_filename; //책 이미지
	private String r_title; //책 제목
	private String r_writer; //작성자
	private String r_content; //독후감 내용
	private String r_regist_day; //작성일
	private String r_update_day; //수정일
	private int r_view; //조회수
	private int r_recommend; //추천수
	private int r_delete; //삭제
}
