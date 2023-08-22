package com.mrmr.gamto.member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mrmr.gamto.member.dao.MemberDAO;
import com.mrmr.gamto.member.dto.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberDAO dao;
	
	@RequestMapping()
	public String Member(HttpSession session) {
		//여기에 마이페이지 이동 + 로그인 안한경우 로그인창 연결 해주세요
		String u_id = (String)session.getAttribute("name");
		if(u_id==null) {
		return "member/login";
		}
		return "member/myPage";
	}
	@RequestMapping("/myPage")
	public String needLoginMember(HttpSession session, Model model) {
		String u_id = (String) session.getAttribute("u_id");      
	    model.addAttribute("rows",dao.readMemberDao(u_id));
		return "member/myPage";
	}
	@RequestMapping("/login")
	public String needLoginMember(String connect,Model model) {
		model.addAttribute("connect",connect);
		return "member/loginMemberForm";
	}
	
	@RequestMapping("/processLoginMember")
	public String processLoginMember(HttpSession session,String u_id, String u_pw, Model model,String connect) {
		//로그인 정보확인
		MemberDTO dto = dao.loginDao(u_id, u_pw);
		if(u_id.trim().equals("")||u_pw.trim().equals("")) {
			model.addAttribute("connect",connect);
			model.addAttribute("error",1);
			return "member/loginMemberForm";
			// 로그인폼 입력을 안하거나 빈칸이라서
		}else if(dto == null) {
			model.addAttribute("connect",connect);
			model.addAttribute("error",2);
			return "member/loginMemberForm";
			// 로그인정보가 없어 실패메세지
		}else if(dto.getU_delete().equals("1")){
			model.addAttribute("connect",connect);
			model.addAttribute("error",3);
			return "member/loginMemberForm";
			// 로그인정보가 있으나 탈퇴회원
		}else if(dto.getU_delete().equals("2")){
			model.addAttribute("connect",connect);
			model.addAttribute("error",4);
			return "member/loginMemberForm";
			// 로그인정보가 있으나 탈퇴회원
		}else {
			session.setAttribute("u_id", u_id);
			if(connect=="") connect="/";
			return "redirect:"+connect;
			// 로그인정보가 있어서 원래 가려던 페이지로 연결
		}
	}
	
	@RequestMapping("/addMember")
	public String resultMemberFail() {
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
	
	/*
	 * @RequestMapping("/newMember") public String newMember(HttpServletRequest
	 * request,MemberDTO dto) {
	 * 
	 * if(dao.overlapIdDao(request.getParameter("u_id")) == null &&
	 * dao.overlapMailDao(request.getParameter("u_email"))==null) { String
	 * u_email1=request.getParameter("u_email1"); String
	 * u_email2=request.getParameter("u_email2"); String
	 * u_email=u_email1+"@"+u_email2; dao.addMemberDao(
	 * request.getParameter("u_id"), request.getParameter("u_pw"),
	 * request.getParameter("u_name"), request.getParameter("u_phone"), u_email,
	 * request.getParameter("u_address"), request.getParameter("u_delete") ); return
	 * "redirect:/resultMember?msg="+1; }else {  }
	 * }
	 */
	@RequestMapping("/newMember")
	public String newMember(MemberDTO dto,String u_email1,String u_email2) {
		dto.setU_email(u_email1+"@"+u_email2);
		if(dao.overlapIdDao(dto.getU_id()) == null &&dao.overlapMailDao(dto.getU_email())==null){
			dao.addMemberDao(dto.getU_id(), dto.getU_pw(), dto.getU_name(), dto.getU_phone(), dto.getU_email(), dto.getU_address(), "0");
			return "member/loginMemberForm";
		}else {
			System.out.println("확인");
			return "member/addFalseMember";
		}
	}
	
	@RequestMapping("/deleteMember")
	public String u_delete(HttpServletRequest request) {
		return "/member/deleteMember";
	}
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request) {
		dao.deleteMemberDao(request.getParameter("u_id"));
		return "member/logoutMember";
	}
	
	
	@RequestMapping("/logoutMember")
	public String logoutMember() {
		return "member/logoutMember";
	}

	/*
	 * @RequestMapping("/updateMember") public String
	 * updateMember(HttpServletRequest request, Model model) { String u_id =
	 * request.getParameter("u_id"); System.out.println("u_id : "+u_id);
	 * 
	 * model.addAttribute("rows",dao.readMemberDao(u_id));
	 * System.out.println("model : "+model.getAttribute("rows")); return
	 * "/member/updateMember"; }
	 */
	 @RequestMapping("/updateMember")
	 public String updateMember(HttpSession session, Model model) {
	    String u_id = (String) session.getAttribute("u_id");      
	    model.addAttribute("rows",dao.readMemberDao(u_id));
	    return "/member/updateMember";
	 }
	 
	
	@RequestMapping("/processUpdateMember")
	public String processUpdateMember(HttpServletRequest request, MemberDTO dto) {
		dto.setU_email(request.getParameter("mail1")+"@"+request.getParameter("mail2"));
		System.out.println("dto값 : "+dto);
		dao.updateMemberDao(dto);
		return "/index";
	}

}
