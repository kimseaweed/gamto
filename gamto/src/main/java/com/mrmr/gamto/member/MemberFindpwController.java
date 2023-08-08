package com.mrmr.gamto.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.mrmr.gamto.member.dao.MemberDao;



@Controller
public class MemberFindpwController {
	@Autowired
	MemberDao dao;
	@Autowired
	MemberService service;
	
	//비밀번호찾기 : 페이지이동
	@GetMapping("/member/reset-pw")
	public String resetPwPage() {
		System.out.println();
		return "member/resetPw";
	}
	//비밀번호찾기 : 아이디,메일확인
	@ResponseBody
	@PostMapping("/member/mail")
	public String resetPw(String id, String email) {
		return Integer.toString(service.resetPwMail(id,email));
	}
}
