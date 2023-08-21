package com.mrmr.gamto.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mrmr.gamto.admin.dto.AdminMemberDTO;
import com.mrmr.gamto.help.dto.AccuseDTO;
import com.mrmr.gamto.help.dto.AskDTO;
import com.mrmr.gamto.member.dto.MemberDTO;
import com.mrmr.gamto.member.dto.MyBoardDTO;
import com.mrmr.gamto.store.dto.StoreDTO;

@Mapper
public interface AdminDAO {
	
	/*관리자계정 관리 DAO*/
	
	//계정생성
	public int insertAdminMember(@Param("dto")AdminMemberDTO dto);
	//로그인
	public AdminMemberDTO selectAdminMember(String query);
	//멤버리스트 로드
	public List<AdminMemberDTO> adminListDao(String pageNo,String onePageNo,String query);
	
	/*회원 관리 DAO*/
	public List<MemberDTO> memberListDao(String pageNo,String onePageNo,String query);
	
	/*문의 관리 DAO*/
	
	//문의 전체보기 리스트
	public List<AskDTO> askListDao(String pageNo,String onePageNo);
	
	//문의 상세보기 
	public AskDTO askViewDao(int a_seq_number);
	
	//문의 상세보기 처리여부 업데이트
	public int askUpdateComplete(int a_seq_number,String a_complete);
	
	//문의 검색하기 리스트
	public List<AskDTO> askSearchListDao(int pageNo,String query);
	
	/*신고관리 DAO*/
	
	//신고 전체보기 리스트
	public List<AccuseDTO> accuseListDao(String pageNo,String onePageNo);
	
	//신고 상세보기 
	public AccuseDTO accuseViewDao(int a_seq_number);
	
	//신고 상세보기 처리여부 업데이트
	public int accuseUpdateComplete(int a_seq_number,String a_complete);
	
	//신고 검색하기 리스트
	public List<AccuseDTO> accuseSearchListDao(int pageNo,String query);
	
	
	
	/* 게시판 관리 DAO */
	
	//게시판 모든글 블러옴
	public List<MyBoardDTO> boardListDao(String pageNo,String onePageNo,String query);
	
	
	
	/*상품관리 DAO*/
	
	//상품등록
	public int insertStoreDao(@Param("dto")StoreDTO dto);
	//상품검색
	public List<StoreDTO> storeListDao(String pageNo,String onePageNo,String query);
	
	
}
