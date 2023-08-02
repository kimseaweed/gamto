package com.ex.gamto.report.dto;

import java.text.SimpleDateFormat;

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
	private int r_recommand;
	private int r_delete;
	
	public void setR_regist_day(java.sql.Timestamp r_regist_day) {
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		this.r_regist_day = format.format(r_regist_day);
	}
	public void setR_update_day(java.sql.Timestamp r_update_day) {
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		this.r_update_day = format.format(r_update_day);
	}
}
