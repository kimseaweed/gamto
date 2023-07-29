package com.ex.gamto.write;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WriteDAO {
	public int getNext_seq_number(String tableName);
	public int writeDao(int i,String writer, String title, String content);
}
