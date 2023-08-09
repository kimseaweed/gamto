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
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberDao dao;
	
	@RequestMapping()
	public String Member() {
		System.out.println("member요청");
		return "/member/welcome"; // 임시페이지
	}
	@RequestMapping("/index")
	public String index() {
		System.out.println("member요청");
		return "redirect:/"; // 임시페이지
	}
	
	@RequestMapping("/login")
	public String loginMember() {
		return "/member/loginMemberForm";
	}
	@RequestMapping("/processLoginMember")
	public String processLoginMember(HttpServletRequest request, Model model) {
		String u_id = request.getParameter("u_id");
		String u_pw = request.getParameter("u_pw");
		System.out.println("test1-----------------"+u_id+","+u_pw);
		MemberDTO dto = dao.loginDao(u_id, u_pw);
		System.out.println("dto값 : "+dto);
		
		if(dto == null ) {
			return "redirect:/member/loginMemberForm?error="+1;
		}
		if(dto != null && dto.getU_delete().equals("0")){
			String id = u_id;
			System.out.println("dto.getU_delete() : "+dto.getU_delete());
			HttpSession session = request.getSession();
			session.setAttribute("u_id", id);
			return "redirect:/member/resultMember?msg="+2;
		}else {
			return "/member/addMember";
		}
	
	}
	@RequestMapping("/resultMember")
	public String resultMemberOk(Model model) {
		return "/member/resultMember";
	}
	@RequestMapping("/addMember")
	public String resultMemberFail(Model model) {
		return "/member/addMember";
	}
	
	@RequestMapping("/memberCheck")
	public String userlistPage(Model model) {
		model.addAttribute("list", dao.listDao());
		return "/member/memberCheck";
	}
	@RequestMapping("/addFalseMember")
	public String addFalseMember() {
		return "/member/addFalseMember";
	}
	
	@RequestMapping("/newMember")
	public String newMember(HttpServletRequest request) {
		
		if(dao.overlapIdDao(request.getParameter("u_id")) == null && dao.overlapMailDao(request.getParameter("u_email"))==null) {
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
		return "/member/deleteMember";
	}
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request) {
		dao.deleteMemberDao(request.getParameter("u_id"));
		return "/member/resultMember";
	}
	
	
	@RequestMapping("/logoutMember")
	public String logoutMember() {
		return "/member/logoutMember";
	}

	@RequestMapping("/updateMember")
	public String updateMember(HttpServletRequest request, Model model) {
		String u_id = request.getParameter("u_id");
		System.out.println("u_id : "+u_id);
		
		model.addAttribute("rows",dao.readMemberDao(u_id));
		System.out.println("model : "+model.getAttribute("rows"));
		return "/member/updateMember";
	}
	
	@RequestMapping("/processUpdateMember")
	public String processUpdateMember(HttpServletRequest request, MemberDTO dto) {
		dto.setU_email(request.getParameter("mail1")+"@"+request.getParameter("mail2"));
		System.out.println("dto값 : "+dto);
		dao.updateMemberDao(dto);
		return "/member/resultMember";
	}
	
	@RequestMapping("/emailCAuthentication")//아이디 찾기 0807
	public String emailCAuthentication(HttpServletRequest request) {
		String u_id = request.getParameter("u_id");
		System.out.println(u_id);
		return "/member/findId";
	}
	
	@RequestMapping("/findId")
	public String findId(HttpServletRequest request, Model model) {
		String u_email = request.getParameter("u_email");
		model.addAttribute("dto", dao.findIdDao(u_email));
		//model.addAttribute(null)
		return "/member/findMember";
	}	
}
