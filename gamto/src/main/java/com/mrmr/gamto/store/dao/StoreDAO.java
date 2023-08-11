package com.mrmr.gamto.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mrmr.gamto.store.dto.CartDTO;
import com.mrmr.gamto.store.dto.StoreDTO;
import com.mrmr.gamto.store.dto.imsiDto;

@Mapper
public interface StoreDAO {
	public List<StoreDTO> listDao(); //리스트를 보기 위한 select 메서드 정의
	public StoreDTO viewDao(String b_code); //상세 뷰 페이지를 보기 위한 select메서드 정의
	public int insertDao(String b_code); //제품 등록 메소드
	public int deleteDao(String b_code); // 제품 삭제 메소드 
	public List<CartDTO> cartDao(String u_id); // 장바구니 메서드 정의 
	public int addCartDao(String u_id, String b_code, String b_quantity); //장바구니 담기 메서드
	public int removeCartDao(String u_id, String b_code); //장바구니 삭제 메소드 
	public int removeAllCartDao(String u_id); //장바구니 목록 전체 삭제 메소드
	public int listNumDao(String u_id); //장바구니 갯수.
	
	public List<imsiDto> purchaseListDao();//구매내역
}
