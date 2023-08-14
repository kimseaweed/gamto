package com.mrmr.gamto.report.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.mrmr.gamto.report.dto.BookReportDTO;

@Mapper
public interface IBookReportDAO {
	public int countBoard();
	public List<BookReportDTO> getPageList(Map<String, Integer> map);
	public BookReportDTO viewDao(String r_seq_number);
	public int writeDao(Map<String, String> map);
	public int deleteDao(String r_seq_number);
	public int updateDao(Map<String, String> map);
	public int updateCnt(String r_seq_number);
	public int goodCnt(String r_seq_number);
	public List<BookReportDTO> SearchTotal(Map<String, String> map);
	public void updateCnt(int r_seq_number);
	public void viewCountUp(int u_id);
}
