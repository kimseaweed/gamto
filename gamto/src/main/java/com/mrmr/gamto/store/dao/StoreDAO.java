package com.mrmr.gamto.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mrmr.gamto.store.dto.StoreDTO;

@Mapper
public interface StoreDAO {
	public List<StoreDTO> listDao(); //리스트를 보기 위한 select 메서드 정의
	public StoreDTO viewDao(String b_code); //상세 뷰 페이지를 보기 위한 select메서드 정의
	public int deleteDao(String b_code);
}
