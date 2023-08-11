package com.mrmr.gamto.report.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mrmr.gamto.freeboard.dto.CommentDto;
import com.mrmr.gamto.freeboard.dto.FreeboardDto;
import com.mrmr.gamto.report.dto.Book_reportDTO;

@Mapper
public interface IBook_reportDAO {
	public int countBoard();
	public List<Book_reportDTO> getPageList(Map<String, Integer> map);
	public Book_reportDTO viewDao(String r_seq_number);
	public int writeDao(Map<String, String> map);
	public int deleteDao(String r_seq_number);
	public int updateDao(Map<String, String> map);
	public int updateCnt(String r_seq_number);
	public int goodCnt(String r_seq_number);
	public List<Book_reportDTO> SearchTotal(Map<String, String> map);
	public void updateCnt(int r_seq_number);
	public void viewCountUp(int u_id);
}
