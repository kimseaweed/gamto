package com.mrmr.gamto.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mrmr.gamto.member.dao.MemberDao;
import com.mrmr.gamto.member.dto.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberDao dao;
	@Autowired
	MemberService service;
	
	@RequestMapping()
	public String Member() {
		return "member/welcome"; // 임시페이지
	}
	
	@RequestMapping("/loginMemberForm")
	public String loginMember() {
		return "member/loginMemberForm";
	}
	@RequestMapping("/processLoginMember")
	public String processLoginMember(HttpServletRequest request, Model model) {
		
		String u_id = request.getParameter("u_id");
		String u_pw = request.getParameter("u_pw");
		System.out.println("test1"+u_id+","+u_pw);
		MemberDTO dto = dao.loginDao(u_id, u_pw);
		System.out.println(dto);
		System.out.println("모델 아이디 : "+dto.getU_id());
		HttpSession session = request.getSession();
		String id = u_id;
		System.out.println("dto.getU_delete() : "+dto.getU_delete());
		
		
		if(dto.getU_id() != null && dto.getU_delete().equals("0")){
			session.setAttribute("sessionId", id);
			return "redirect:/member/resultMember?msg="+2;
		}
		else if(dto == null ) {
			return "redirect:/member/loginMemberForm?error="+1;
		}else {
			return "redirect:/member/addMember";
		}
	}
	@RequestMapping("/resultMember")
	public String resultMemberOk(Model model) {
		return "member/resultMember";
	}
	@RequestMapping("/addMember")
	public String resultMemberFail(Model model) {
		return "member/addMember";
	}
	
	@RequestMapping("/memberCheck")
	public String userlistPage(Model model) {
		model.addAttribute("list", dao.listDao());
		return "member/memberCheck";
	}
	@RequestMapping("/addFalseMember")
	public String addFalseMember() {
		return "member/addFalseMember";
	}
	
	@RequestMapping("/newMember")
	public String newMember(HttpServletRequest request, MemberDTO dto) {
		if(dao.overlapDao(request.getParameter("u_id")) == null) {
		
		String u_email1=request.getParameter("u_email1");
		String u_email2=request.getParameter("u_email2");
		String u_email=u_email1+"@"+u_email2;
		dao.addMemberDao(
			request.getParameter("u_id"),
			request.getParameter("u_pw"),
			request.getParameter("u_name"),
			request.getParameter("u_phone"),
			u_email,
			request.getParameter("u_address"),
			request.getParameter("u_delete")
		);
		
		dto.setU_email(u_email);
		service.createMail(dto);
		
		return  "redirect:/member/resultMember?msg="+1;
		}else {
			return "redirect:/member/addFalseMember";
		}
		
	}
	
	@RequestMapping("/deleteMember")
	public String u_delete(HttpServletRequest request) {
		return "member/deleteMember";
	}
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request) {
		dao.deleteMemberDao(request.getParameter("u_id"));
		return "member/resultMember";
	}
	
	
	@RequestMapping("/logoutMember")
	public String logoutMember() {
		System.out.println("로그아웃 요청");
		return "member/logoutMember";
	}

	@RequestMapping("/updateMember")
	public String updateMember(HttpServletRequest request, Model model) {
		String u_id = request.getParameter("u_id");
		System.out.println("u_id : "+u_id);
		
		model.addAttribute("rows",dao.readMemberDao(u_id));
		System.out.println("model : "+model.getAttribute("rows"));
		return "member/updateMember";
	}
	
	@RequestMapping("/processUpdateMember")
	public String processUpdateMember(HttpServletRequest request, MemberDTO dto) {
		dto.setU_email(request.getParameter("mail1")+"@"+request.getParameter("mail2"));
		dao.updateMemberDao(dto);
		return "member/resultMember";
	}
	
	//비밀번호찾기 : 페이지이동
	@GetMapping("/reset-pw")
	public String resetPwPage() {
		return "member/resetPw";
	}
	//비밀번호찾기 : 아이디,메일확인
	@PostMapping("mail")
	@ResponseBody
	public int resetPw(String id, String email) {
		System.out.println("ajax 수신 확인 : "+id+","+email);
		return service.resetPwMail(id,email);
	}

	
}
