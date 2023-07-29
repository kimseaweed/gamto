package com.ex.gamto.write;

import lombok.Data;

@Data
public class Write_book_reportDTO {
	int	r_seq_number;
	String	r_title;
	String	r_writer;
	String	r_regist_day;
	String	r_update_day;
	String	r_filename;
	String	r_content;
}
