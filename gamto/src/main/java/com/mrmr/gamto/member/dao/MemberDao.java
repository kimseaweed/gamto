package com.mrmr.gamto.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mrmr.gamto.Think.DTO.ThinkDTO;
import com.mrmr.gamto.member.dto.MemberDTO;


@Mapper
public interface MemberDao {
	public List<MemberDTO> listDao();
	public MemberDTO loginDao(String u_id, String u_pw);
	public int addMemberDao(String u_id, String u_pw, String u_name, String u_phone, String u_email, String u_address, String u_delete);
	public int deleteMemberDao(String u_id);
	public MemberDTO readMemberDao(String u_id);
	public int updateMemberDao(@Param("dto") MemberDTO dto);
	public MemberDTO overlapIdDao(String u_id);
	public MemberDTO overlapMailDao(String u_id);
	public MemberDTO findIdDao(String u_email);
	public String ResetPwCheck(String u_id);
	public int ResetPwDo(@Param("u_id") String u_id,@Param("u_pw")String u_pw);
	public List<ThinkDTO> ThinkDao(String u_id, String u_id2);
}
