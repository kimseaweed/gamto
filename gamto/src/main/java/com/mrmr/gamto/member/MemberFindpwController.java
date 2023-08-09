package com.mrmr.gamto.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;



@RestController
@RequestMapping("/member/reset-pw")
public class MemberFindpwController {

	@Autowired
	MemberService service;
	
	//비밀번호찾기 : 페이지이동
	@GetMapping()
	public ModelAndView resetPwPage() {
		return new ModelAndView("member/resetPw");
	}
	//비밀번호찾기 : 아이디,메일확인
	/*
	 * @PostMapping("/mail") 
	 * public String resetPw(String id, String email) { 
	 * return Integer.toString(service.resetPwMail(id,email)); }
	 */
	//비밀번호찾기 : 정보확인
	@PostMapping("/matching")
	public int matchingInfo(String u_id,String u_email) {
		return service.matchingInfo(u_id,u_email);
	}
	//비밀번호찾기 : 인증메일 전송완료
	@GetMapping("/send")
	public ModelAndView sendMail() {
		ModelAndView mv =  new ModelAndView();
		mv.setViewName("member/result");
		mv.addObject("message","인증메일이 발송되었습니다");
		return mv;
	}
	//비밀번호찾기 : 인증링크 눌렀을때 연결되는 비번번경 페이지
	@GetMapping("/token")
	public ModelAndView subjectToken(@RequestParam(value="t") String t){			
			String u_id = service.getClaim(t);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/changePw");
			mv.addObject("u_id",u_id);
			return mv;
	}
	//비밀번호찾기 : 비번 변경요청
	@PostMapping("/token.do")
	public ModelAndView subjectToken(String u_id,String u_pw){
			int result = service.resetPw(u_id, u_pw);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/result");
			if(result==1) {				
				mv.addObject("message","비밀번호 변경이 완료되었습니다.");
			}else if(result==0){
				mv.addObject("message","<script>alert('기존비번과 동일한 비밀번호입니다. 다른비밀번호를 입력핸주세요'); history.back();</script>");
			}else {
				mv.addObject("message","비밀번호 변경이 실패했습니다. 다시 인증해주세요."); //시스템오류
			}
			return mv;
	}
	
}
