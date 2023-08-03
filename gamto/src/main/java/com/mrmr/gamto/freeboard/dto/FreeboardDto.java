package com.mrmr.gamto.freeboard.dto;

import lombok.Data;

@Data
public class FreeboardDto {
	private String f_title;
	private String f_writer;
	private String f_regist_day;
	private String f_update_day;
	private String f_filename;
	private String f_content;
	private int f_recommend;
	private int f_delete;
	private int f_view;
	private int f_seq_number;
}
