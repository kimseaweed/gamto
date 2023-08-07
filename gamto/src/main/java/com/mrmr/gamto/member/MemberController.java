package com.mrmr.gamto.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mrmr.gamto.member.dao.MemberDao;
import com.mrmr.gamto.member.dto.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class MemberController {
	@Autowired
	MemberDao dao;
	
	@RequestMapping("/")
	public String root() {
		return "welcome";
	}
	
	@RequestMapping("/welcome")
	public String Member() {
		return "welcome";
	}
	
	@RequestMapping("/loginMemberForm")
	public String loginMember() {
		return "loginMemberForm";
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
			return "redirect:/resultMember?msg="+2;
		}
		else if(dto == null ) {
			return "redirect:/loginMemberForm?error="+1;
		}else {
			return "redirect:/addMember";
		}
	}
	@RequestMapping("/resultMember")
	public String resultMemberOk(Model model) {
		return "resultMember";
	}
	@RequestMapping("/addMember")
	public String resultMemberFail(Model model) {
		return "addMember";
	}
	
	@RequestMapping("/memberCheck")
	public String userlistPage(Model model) {
		model.addAttribute("list", dao.listDao());
		return "memberCheck";
	}
	@RequestMapping("/addFalseMember")
	public String addFalseMember() {
		return "addFalseMember";
	}
	
	@RequestMapping("/newMember")
	public String newMember(HttpServletRequest request) {
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
		
		return  "redirect:/resultMember?msg="+1;
		}else {
			return "redirect:/addFalseMember";
		}
		
	}
	
	@RequestMapping("/deleteMember")
	public String u_delete(HttpServletRequest request) {
		return "deleteMember";
	}
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request) {
		dao.deleteMemberDao(request.getParameter("u_id"));
		return "resultMember";
	}
	
	
	@RequestMapping("/logoutMember")
	public String logoutMember() {
		return "logoutMember";
	}

	@RequestMapping("/updateMember")
	public String updateMember(HttpServletRequest request, Model model) {
		String u_id = request.getParameter("u_id");
		System.out.println("u_id : "+u_id);
		
		model.addAttribute("rows",dao.readMemberDao(u_id));
		System.out.println("model : "+model.getAttribute("rows"));
		return "updateMember";
	}
	
	@RequestMapping("/processUpdateMember")
	public String processUpdateMember(HttpServletRequest request, MemberDTO dto) {
		dto.setU_email(request.getParameter("mail1")+"@"+request.getParameter("mail2"));
		dao.updateMemberDao(
				dto
			);
		return "resultMember";
	}
}
