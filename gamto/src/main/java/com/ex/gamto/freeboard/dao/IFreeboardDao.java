package com.ex.gamto.freeboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ex.gamto.freeboard.dto.CommentDto;
import com.ex.gamto.freeboard.dto.FreeboardDto;

@Mapper
public interface IFreeboardDao {
	public List<FreeboardDto> listDao();
	public FreeboardDto viewDao(String f_seq_number);
	public int writeDao(Map<String, String> map);
	public int deleteDao(String f_seq_number);
	public void updateDao(Map<String, String> map);
	public void updateCnt(String f_seq_number);
	public void goodCnt(String f_seq_number);
	
	public List<CommentDto> cListDao();
	public CommentDto cViewDao(String f_seq_number);
	public int cWriteDao(Map<String, String> map);
	public int cDeleteDao(String c_seq_number);
	public int cUpdateDao(Map<String, String> map);
	public int cGoodCnt(String c_seq_number);
	public int cBadCnt(String c_seq_number);
	
}
