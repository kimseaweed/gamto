package com.mrmr.gamto.report.dto;

import lombok.Data;

@Data
public class Book_reportDTO {
	private int r_seq_number;
	private String r_filename;
	private String r_title;
	private String r_writer;
	private String r_content;
	private String r_regist_day;
	private String r_update_day;
	private int r_view;
	private int r_recommend;
	private int r_delete;
}
