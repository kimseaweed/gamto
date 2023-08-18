package com.mrmr.gamto.member;

import java.net.http.HttpClient.Redirect;
import java.nio.file.spi.FileSystemProvider;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.redis.RedisReactiveAutoConfiguration;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mrmr.gamto.member.dao.MemberDAO;
import com.mrmr.gamto.member.dto.MemberDTO;
import com.mrmr.gamto.member.service.MemberHelpService;
import com.mrmr.gamto.utils.GamtoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/help")
public class MemberHelpController {

	@Autowired
	MemberHelpService service;
	@Autowired
	MemberDAO dao;
	
	/*
	 * id : 폼이동 POST) 
	 * POST) id/check - ajax요청으로 인증번호 발송 
	 * POST) id/res - 아이디 보여줌
	 */
	//아이디 찾기 : 로그인여부 확인후 폼 이동
	@RequestMapping("/id") 
	public String emailCAuthentication(HttpSession session, Model model) {
		return GamtoService.noneLogin(session, model, "member/findId");
	}
	//아이디 찾기 : ajax 인증코드 발송
	@ResponseBody
	@PostMapping("/id/check")
	public int idSearch(String u_name,String u_email,HttpSession session) {
		int authcode = service.idSearch(u_name, u_email);
		if(authcode==1||authcode==2) {
			return authcode;			
		}else {
			session.setAttribute("authCode",authcode);
			session.setMaxInactiveInterval(60*10);//분
			return 0;
		}
	}
	
	//아이디찾기 : 인증코드 맞는지 확인하기
	@ResponseBody
	@GetMapping("/id/check")
	public int codeCheck(HttpSession session,String code,String u_email) {
		log.info("/id/check get 요청 : 입력값"+code);
		if(session.getAttribute("authCode")==null) {
			log.error("세션에 코드가 없습니다");
			return 2;	
		}		
		String authcode =session.getAttribute("authCode").toString();
		if(!(authcode.equals(code))){
			log.error("코드가 틀렸습니다");
			return 1;
		}else {
		session.setAttribute("authCode",u_email);
		log.info("세션에 코드가 맞아서 "+u_email+"로 변경했습니다");
		return 0;
		}
		
	}	
	
	//아이디찾기 : 인증코드 입력후 이동
	@RequestMapping("/id/res")
	public String ifOk(HttpSession session,Model model) {
		String message="";
		String u_email = (String)session.getAttribute("authCode");
		log.info("/id/res 요청"+u_email);
		if(u_email!=null) {
			if(u_email.indexOf("@")>0) {
				session.removeAttribute("authcode");
				MemberDTO dto = dao.findIdDao(u_email);
				message=  "가입하신 아이디는<br> <b>"+dto.getU_id()+"</b>입니다.<br>"
						+ "감사합니다. <br>";
			}else {
				message = "세션이 만료되었거나 잘못된 접근입니다.<br>처음부터 다시 진행해주세요.";
			}
		}else {
			message = "잘못된 요청입니다.<br>처음부터 다시 진행해주세요";
		}
		model.addAttribute("script",message);		
		return "script";
	}
	
	/*****/
	
	
	// 비밀번호찾기 : 로그인 여부 확인후 폼 이동
	@RequestMapping("/pw")
	public String resetPwPage(HttpSession session, Model model) {
		return GamtoService.noneLogin(session, model, "member/resetPw");
	}
	
	// 비밀번호찾기 : ajax 정보확인
	@PostMapping("/pw/check")
	@ResponseBody
	public int pwSearch(String u_id, String u_email) {
		return service.pwSearch(u_id, u_email);
	}

	// 비밀번호찾기 : 인증메일 전송완료
	@GetMapping("/pw/send")
	public String sendMail(Model model) {
		model.addAttribute("message", "인증메일이 발송되었습니다");
		return "member/result";
	}

	// 비밀번호찾기 : 인증링크 눌렀을때 연결되는 비번번경 페이지
	@GetMapping("/pw/token")
	public String subjectToken(@RequestParam(value = "t") String t, Model model) {
		String u_id = service.getClaim(t);
		model.addAttribute("u_id", u_id);
		return "member/changePw";
	}

	// 비밀번호찾기 : 비번 변경요청
	@PostMapping("/pw/token")
	public String subjectToken(String u_id, String u_pw, Model model) {
		int result = service.resetPw(u_id, u_pw);
		if (result == 1) {
			model.addAttribute("message", "비밀번호 변경이 완료되었습니다.");
		} else if (result == 0) {
			model.addAttribute("message",
					"<script>alert('기존비번과 동일한 비밀번호입니다. 다른비밀번호를 입력해주세요'); history.back();</script>");
		} else {
			model.addAttribute("message", "비밀번호 변경이 실패했습니다. 다시 인증해주세요."); // 시스템오류
		}
		return "member/result";
	}

}
