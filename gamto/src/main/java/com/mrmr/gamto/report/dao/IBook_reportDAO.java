package com.mrmr.gamto.report.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mrmr.gamto.report.dto.Book_reportDTO;

@Mapper
public interface IBook_reportDAO {
	public List<Book_reportDTO> listDao(); //리스트를 보기 위한 select 메서드 정의
	public Book_reportDTO viewDao(String r_seq_number); //상세 뷰페이지를 보기 위한 select 메서드 정의
	public int writeDao(Map<String, String> r_map); //글 작성을 위한 insert 메서드 정의
	public int deleteDao(String r_seq_number); //글 삭제를 위한 delete 메서드 정의
	public int articleCount(); //글의 갯수를 세는 함수 정의
}
