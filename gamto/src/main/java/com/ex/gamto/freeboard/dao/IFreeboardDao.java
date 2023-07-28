package com.ex.gamto.freeboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ex.gamto.freeboard.dto.FreeboardDto;

@Mapper
public interface IFreeboardDao {
	public List<FreeboardDto> listDao();
	public FreeboardDto viewDao(String f_seq_number);
	public int writeDao(Map<String, String> map);
	public int deleteDao(String f_seq_number);
	
}
