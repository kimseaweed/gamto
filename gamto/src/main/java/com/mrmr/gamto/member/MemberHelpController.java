package com.mrmr.gamto.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mrmr.gamto.GamtoService;
import com.mrmr.gamto.member.dao.MemberDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member/help")
public class MemberHelpController {

	@Autowired
	MemberHelpService service;
	@Autowired
	MemberDao dao;

	//아이디 찾기 : 로그인여부 확인후 폼 이동
	@RequestMapping("/find-id") 
	public String emailCAuthentication(HttpSession session, Model model) {
		return GamtoService.noneLogin(session, model, "member/findId");
	}
	//아이디 찾기 : ajax정보확인
	@ResponseBody
	@PostMapping("/find-id/check")
	public int idSearch(String u_name,String u_email) {
		return service.idSearch(u_name, u_email);
	}
	@ResponseBody
	@GetMapping("/find-id/check")
	public String idSearchGet(String u_email) {
		return dao.findIdDao(u_email).getU_id();
	}

	@PostMapping("/find-id/ok")
	public String ifOk(Model model,String u_email) {
		String u_id = dao.findIdDao(u_email).getU_id();
		String message=  
				"가입하신 아이디는 <b>"+u_id+"</b>입니다.<br>"
						+ "감사합니다. <br>"
						+ "<a href=\"/member/help/reset-pw\" class=\"btn btn-warning\">비밀번호 찾기</a>";
		model.addAttribute("message",message);
		return "member/result";
	}
	
	
	
	
	// 비밀번호찾기 : 로그인 여부 확인후 폼 이동
	@RequestMapping("/reset-pw")
	public String resetPwPage(HttpSession session, Model model) {
		return GamtoService.noneLogin(session, model, "member/resetPw");
	}
	
	// 비밀번호찾기 : ajax 정보확인
	@RequestMapping("/reset-pw/check")
	@ResponseBody
	public int pwSearch(String u_id, String u_email) {
		return service.pwSearch(u_id, u_email);
	}

	// 비밀번호찾기 : 인증메일 전송완료
	@GetMapping("/reset-pw/send")
	public String sendMail(Model model) {
		model.addAttribute("message", "인증메일이 발송되었습니다");
		return "member/result";
	}

	// 비밀번호찾기 : 인증링크 눌렀을때 연결되는 비번번경 페이지
	@GetMapping("/reset-pw/token")
	public String subjectToken(@RequestParam(value = "t") String t, Model model) {
		String u_id = service.getClaim(t);
		model.addAttribute("u_id", u_id);
		return "member/changePw";
	}

	// 비밀번호찾기 : 비번 변경요청
	@PostMapping("/reset-pw/tokendo")
	public String subjectToken(String u_id, String u_pw, Model model) {
		int result = service.resetPw(u_id, u_pw);
		if (result == 1) {
			model.addAttribute("message", "비밀번호 변경이 완료되었습니다.");
		} else if (result == 0) {
			model.addAttribute("message",
					"<script>alert('기존비번과 동일한 비밀번호입니다. 다른비밀번호를 입력핸주세요'); history.back();</script>");
		} else {
			model.addAttribute("message", "비밀번호 변경이 실패했습니다. 다시 인증해주세요."); // 시스템오류
		}
		return "member/result";
	}

}