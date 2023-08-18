package com.mrmr.gamto.admin.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.mrmr.gamto.admin.dto.AskDTO;
@Mapper
public interface AskDAO {
	
	//문의 전체보기 리스트
	public List<AskDTO> askListDao(int pageNo);
	
	//문의 상세보기 
	public AskDTO askViewDao(int a_seq_number);
	
	//문의 상세보기 처리여부 업데이트
	public int askUpdateComplete(int a_seq_number,String a_complete);
	
	//문의 검색하기 리스트
	public List<AskDTO> askSearchListDao(int pageNo,String query);
}
