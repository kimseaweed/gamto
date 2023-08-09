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

import jakarta.servlet.http.HttpSession;



@Controller
@RequestMapping("/member/reset-pw")
public class MemberFindpwController {

	@Autowired
	MemberService service;
	
	//비밀번호찾기 : 페이지이동
	@RequestMapping()
	public String resetPwPage(HttpSession session,Model model) {
		return GamtoService.noneLogin(session, model, "member/resetPw");
	}
	//비밀번호찾기 : 아이디,메일확인
	/*
	 * @PostMapping("/mail") 
	 * public String resetPw(String id, String email) { 
	 * return Integer.toString(service.resetPwMail(id,email)); }
	 */
	//비밀번호찾기 : 정보확인
	@RequestMapping("/matching")
	@ResponseBody
	public int matchingInfo(String u_id,String u_email) {
		return service.matchingInfo(u_id,u_email);
	}
	//비밀번호찾기 : 인증메일 전송완료
	@GetMapping("/send")
	public String sendMail(Model model) {
		model.addAttribute("message","인증메일이 발송되었습니다");
		return "member/result";
	}
	//비밀번호찾기 : 인증링크 눌렀을때 연결되는 비번번경 페이지
	@GetMapping("/token")
	public String subjectToken(@RequestParam(value="t") String t,Model model){			
			String u_id = service.getClaim(t);
			model.addAttribute("u_id",u_id);
			return "member/changePw";
	}
	//비밀번호찾기 : 비번 변경요청
	@PostMapping("/token.do")
	public String subjectToken(String u_id,String u_pw,Model model){
			int result = service.resetPw(u_id, u_pw);
			if(result==1) {				
				model.addAttribute("message","비밀번호 변경이 완료되었습니다.");
			}else if(result==0){
				model.addAttribute("message","<script>alert('기존비번과 동일한 비밀번호입니다. 다른비밀번호를 입력핸주세요'); history.back();</script>");
			}else {
				model.addAttribute("message","비밀번호 변경이 실패했습니다. 다시 인증해주세요."); //시스템오류
			}
			return "member/result";
	}
	
}
